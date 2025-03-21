package com.pojo;

import java.sql.Date;

public class RoutineStreak {
    private int streakId;
    private int routineId;
    private int currentStreak;
    private int longestStreak;
    private Date lastCompleted;
    
    // Default constructor
    public RoutineStreak() {
    }
    
    // Getters and setters
    public int getStreakId() {
        return streakId;
    }
    
    public void setStreakId(int streakId) {
        this.streakId = streakId;
    }
    
    public int getRoutineId() {
        return routineId;
    }
    
    public void setRoutineId(int routineId) {
        this.routineId = routineId;
    }
    
    public int getCurrentStreak() {
        return currentStreak;
    }
    
    public void setCurrentStreak(int currentStreak) {
        this.currentStreak = currentStreak;
    }
    
    public int getLongestStreak() {
        return longestStreak;
    }
    
    public void setLongestStreak(int longestStreak) {
        this.longestStreak = longestStreak;
    }
    
    public Date getLastCompleted() {
        return lastCompleted;
    }
    
    public void setLastCompleted(Date lastCompleted) {
        this.lastCompleted = lastCompleted;
    }
    
    @Override
    public String toString() {
        return "RoutineStreak [streakId=" + streakId + ", routineId=" + routineId + 
               ", currentStreak=" + currentStreak + ", longestStreak=" + longestStreak + 
               ", lastCompleted=" + lastCompleted + "]";
    }
}