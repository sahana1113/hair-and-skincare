package com.utils;


import java.util.*;
import java.sql.*;
import java.sql.Date;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;

import com.dao.HairDao;
import com.dao.RoutineStreakDao;
import com.dao.SkinDao;
import com.pojo.Routine;
import com.pojo.RoutineStreak;

public class RoutineStatsCalculator {

    public static double calculateDailyTaskCompletion(int userId) {
        try {
            RoutineStreakDao streakDao = new RoutineStreakDao();
            SkinDao routineDao = new SkinDao();
            HairDao hairDao = new HairDao();

            List<Routine> allRoutines = routineDao.getCurrentRoutinesByUserId(userId);
            List<Routine> hairRotines = hairDao.getCurrentRoutinesByUserId(userId);
            allRoutines.addAll(hairRotines);

            List<Routine> dailyRoutines = new ArrayList<>();
            for (Routine routine : allRoutines) {
                if ("Morning".equals(routine.getOccurence()) || "Evening".equals(routine.getOccurence())) {
                    dailyRoutines.add(routine);
                }
            }
            
            if (dailyRoutines.isEmpty()) {
                return 0.0;
            }
            
            // Get the streaks for these routines
            int totalCompleted = 0;
            int totalRoutines = dailyRoutines.size();
            
            for (Routine routine : dailyRoutines) {
                RoutineStreak streak = streakDao.getStreakByRoutineId(routine.getRoutine_id());
                if (streak != null && streak.getLastCompleted() != null) {
                	Date dbDate = streak.getLastCompleted();

                	LocalDate lastCompleted = dbDate.toLocalDate();

                     if (lastCompleted.equals(LocalDate.now())) {
                        totalCompleted++;
                    }
                }
                
            }
            
            return (totalRoutines > 0) ? ((double) totalCompleted / totalRoutines) * 100 : 0.0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return 0.0;
        }
    }

    public static int calculateCurrentStreak(int userId) {
        try {
            RoutineStreakDao streakDao = new RoutineStreakDao();
        	SkinDao routineDao = new SkinDao();
            HairDao hairDao = new HairDao();

            List<Routine> routines = routineDao.getCurrentRoutinesByUserId(userId);
            List<Routine> hairRotines = hairDao.getCurrentRoutinesByUserId(userId);
            routines.addAll(hairRotines);
            
            int minStreak = Integer.MAX_VALUE;
            boolean hasStreak = false;
            
            for (Routine routine : routines) {
                if ("Morning".equals(routine.getOccurence()) || "Evening".equals(routine.getOccurence())) {
                    RoutineStreak streak = streakDao.getStreakByRoutineId(routine.getRoutine_id());
                    if (streak != null) {
                        hasStreak = true;
                        minStreak = Math.min(minStreak, streak.getCurrentStreak());
                    }
                }
            }
            
            return hasStreak ? minStreak : 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public static int calculateChallengesCompleted(int userId) {
        try {
            RoutineStreakDao streakDao = new RoutineStreakDao();
            
            SkinDao routineDao = new SkinDao();
            HairDao hairDao = new HairDao();
            List<Routine> allRoutines = routineDao.getCurrentRoutinesByUserId(userId);
            List<Routine> hairRotines = hairDao.getCurrentRoutinesByUserId(userId);
            allRoutines.addAll(hairRotines);
            List<Routine> weeklyRoutines = new ArrayList<>();
            
            for (Routine routine : allRoutines) {
                if ("Weekly".equals(routine.getOccurence())) {
                    weeklyRoutines.add(routine);
                }
            }
            
            // Count how many weekly routines have been completed at least once
            int completedChallenges = 0;
            
            for (Routine routine : weeklyRoutines) {
                RoutineStreak streak = streakDao.getStreakByRoutineId(routine.getRoutine_id());
                if (streak != null && streak.getLastCompleted() != null) {
                    // If it has been completed at least once, count it
                    completedChallenges++;
                }
            }
            
            return completedChallenges;
            
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    

    public static double calculateRoutineRating(int userId) {
        try {
            double completionPercentage = calculateDailyTaskCompletion(userId);
            int currentStreak = calculateCurrentStreak(userId);
            
            double completionScore = completionPercentage * 0.6; // 60% weight
            double streakScore = Math.min(currentStreak, 30) * (2.0 / 30) * 5.0; // 40% weight, max streak considered is 30
            
            double rating = (completionScore + streakScore) / 100 * 5;
            
            return Math.min(5.0, Math.max(0.0, rating));
            
        } catch (Exception e) {
            e.printStackTrace();
            return 0.0;
        }
    }
}