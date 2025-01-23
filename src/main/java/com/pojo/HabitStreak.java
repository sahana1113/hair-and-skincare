package com.pojo;

import java.util.Date;

public class HabitStreak {
    private int streakId;
    private int habitId;
    private int currentStreak;
    private int longestStreak;
    private long lastCompleted;

    // Getters and Setters
    public int getStreakId() {
        return streakId;
    }

    public void setStreakId(int streakId) {
        this.streakId = streakId;
    }

    public int getHabitId() {
        return habitId;
    }

    public void setHabitId(int habitId) {
        this.habitId = habitId;
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

    public long getLastCompleted() {
        return lastCompleted;
    }

    public void setLastCompleted(long lastCompleted) {
        this.lastCompleted = lastCompleted;
    }
}

