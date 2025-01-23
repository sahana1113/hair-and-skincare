package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.config.HikariCPDataSource;
import com.pojo.Habits;
import com.pojo.HairDetails;

public class HabitDao {
	public Connection getCon() throws SQLException {
		return HikariCPDataSource.getConnection();
	}
    public boolean insertHabitData(Habits habit) throws SQLException {
        boolean rs1=false;
        String query = "INSERT INTO habits (user_id, habit_name, habit_description, frequency, start_date, end_date) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";
        String insertStreakSQL = "INSERT INTO habit_streaks (habit_id, current_streak, longest_streak, last_completed) "
                + "VALUES (?, 0, 0, NULL)";
        try (Connection connection = getCon()) {
            connection.setAutoCommit(false); // Start transaction
           
            try (PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
        	stmt.setObject(1, habit.getUserId());
        	stmt.setString(2, habit.getHabitName());
        	stmt.setString(3, habit.getHabitDescription());
        	stmt.setString(4, habit.getFrequency());
        	stmt.setLong(5, habit.getStartDate());
        	stmt.setLong(6, habit.getEndDate());
        	stmt.executeUpdate();
        	
        	ResultSet rs = stmt.getGeneratedKeys();
            int habitId = 0;
            if (rs.next()) {
                habitId = rs.getInt(1);
            }
            
            try (PreparedStatement streakStatement = connection.prepareStatement(insertStreakSQL)) {
                streakStatement.setInt(1, habitId);
                streakStatement.executeUpdate();
            }
            
            connection.commit(); // Commit transaction
            rs1=true;
        } catch (Exception e) {
            connection.rollback(); // Rollback on failure
            throw e;
        }
    }
		return rs1;
        
    }
    public List<Habits> getHabitsByUserId(String userId) {
        String query = "SELECT * FROM habits WHERE user_id = ?";
        List<Habits> habitsList = new ArrayList<>();

        try (Connection con = getCon(); PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setString(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Habits habit = new Habits();
                habit.setHabitId(rs.getInt("habit_id"));
                habit.setUserId(rs.getString("user_id"));
                habit.setHabitName(rs.getString("habit_name"));
                habit.setHabitDescription(rs.getString("habit_description"));
                habit.setFrequency(rs.getString("frequency"));
                habit.setStartDate(rs.getLong("start_date"));
                habit.setEndDate(rs.getLong("end_date"));

                habitsList.add(habit);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return habitsList;
    }


}
