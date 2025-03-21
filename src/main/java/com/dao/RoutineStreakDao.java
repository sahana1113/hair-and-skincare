package com.dao;

/**
 * RoutineStreakDao.java
 * Data Access Object for routine_streaks table
 */

import java.sql.*;
import java.util.*;
import java.util.Date;

import com.config.HikariCPDataSource;
import com.pojo.RoutineStreak;

public class RoutineStreakDao {
    
    public RoutineStreak getStreakByRoutineId(int routineId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        RoutineStreak streak = null;
        
        try {
            conn = HikariCPDataSource.getConnection();
            String sql = "SELECT * FROM routine_streaks WHERE routine_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, routineId);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                streak = new RoutineStreak();
                streak.setStreakId(rs.getInt("streak_id"));
                streak.setRoutineId(rs.getInt("routine_id"));
                streak.setCurrentStreak(rs.getInt("current_streak"));
                streak.setLongestStreak(rs.getInt("longest_streak"));
                streak.setLastCompleted(rs.getDate("last_completed"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	HikariCPDataSource.closeConnection(conn, ps, rs);
        }
        
        return streak;
    }
    

    public List<RoutineStreak> getAllStreaksByUserId(int userId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<RoutineStreak> streaks = new ArrayList<>();
        
        try {
            conn = HikariCPDataSource.getConnection();
            String sql = "SELECT s.* FROM routine_streaks s " +
                        "JOIN routines r ON s.routine_id = r.routine_id " +
                        "WHERE r.user_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                RoutineStreak streak = new RoutineStreak();
                streak.setStreakId(rs.getInt("streak_id"));
                streak.setRoutineId(rs.getInt("routine_id"));
                streak.setCurrentStreak(rs.getInt("current_streak"));
                streak.setLongestStreak(rs.getInt("longest_streak"));
                streak.setLastCompleted(rs.getDate("last_completed"));
                streaks.add(streak);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	HikariCPDataSource.closeConnection(conn, ps, rs);
        }
        
        return streaks;
    }
    
    public boolean updateStreakOnCompletion(String routineId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean success = false;
        
        try {
            conn = HikariCPDataSource.getConnection();
            conn.setAutoCommit(false);
            
            String checkSql = "SELECT * FROM routine_streaks WHERE routine_id = ?";
            ps = conn.prepareStatement(checkSql);
            ps.setObject(1, routineId);
            rs = ps.executeQuery();
            
            Date currentDate = new Date(System.currentTimeMillis());
            
            if (rs.next()) {
                Date lastCompleted = rs.getDate("last_completed");
                int currentStreak = rs.getInt("current_streak");
                int longestStreak = rs.getInt("longest_streak");
                
                long daysBetween = 0;
                if (lastCompleted != null) {
                    daysBetween = (currentDate.getTime() - lastCompleted.getTime()) / (1000 * 60 * 60 * 24);
                }
                
                if (daysBetween <= 1) {
                    currentStreak++;
                } else {
                    currentStreak = 1;
                }
                
                if (currentStreak > longestStreak) {
                    longestStreak = currentStreak;
                }
                
                String updateSql = "UPDATE routine_streaks SET current_streak = ?, " +
                                  "longest_streak = ?, last_completed = ? WHERE routine_id = ?";
                ps = conn.prepareStatement(updateSql);
                ps.setInt(1, currentStreak);
                ps.setInt(2, longestStreak);
                ps.setDate(3, new java.sql.Date(currentDate.getTime()));
                ps.setObject(4, routineId);
                ps.executeUpdate();
                
            } else {
                String insertSql = "INSERT INTO routine_streaks (routine_id, current_streak, " +
                                  "longest_streak, last_completed) VALUES (?, 1, 1, ?)";
                ps = conn.prepareStatement(insertSql);
                ps.setObject(1, routineId);
                ps.setDate(2, new java.sql.Date(currentDate.getTime()));
                ps.executeUpdate();
            }
            
            conn.commit();
            success = true;
            
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            HikariCPDataSource.closeConnection(conn, ps, rs);
        }
        
        return success;
    }
}