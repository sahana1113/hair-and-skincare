package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.config.HikariCPDataSource;
import com.pojo.HabitLog;
import com.pojo.HabitStreak;
import com.pojo.Habits;
import com.pojo.HairDetails;

public class HabitDao {
	public Connection getCon() throws SQLException {
		return HikariCPDataSource.getConnection();
	}

	public boolean insertHabitData(Habits habit) throws SQLException {
		boolean rs1 = false;
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
				stmt.setDate(5, habit.getStartDate());
				stmt.setDate(6, habit.getEndDate());
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
				rs1 = true;
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
				habit.setStartDate(rs.getDate("start_date"));
				habit.setEndDate(rs.getDate("end_date"));

				habitsList.add(habit);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return habitsList;
	}

	public boolean logHabitCompletion(int habitId, Date logDate, String status) throws SQLException {
		String sql = "INSERT INTO habit_logs (habit_id, log_date, status) VALUES (?, ?, ?) "
				+ "ON DUPLICATE KEY UPDATE status = ?";
		Connection conn = getCon();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, habitId);
			pstmt.setDate(2, new java.sql.Date(logDate.getTime()));
			pstmt.setString(3, status);
			pstmt.setString(4, status);

			int affectedRows = pstmt.executeUpdate();

			if (affectedRows > 0) {
				// Update streak info
				updateHabitStreak(habitId, logDate, status);
				return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// Update habit streak
	private void updateHabitStreak(int habitId, Date logDate, String status) throws SQLException {
		if ("Completed".equals(status)) {
			String sql = "SELECT * FROM habit_streaks WHERE habit_id = ?";
			Connection conn = getCon();
			try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, habitId);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
					int currentStreak = rs.getInt("current_streak");
					int longestStreak = rs.getInt("longest_streak");
					Date lastCompleted = rs.getDate("last_completed");

					// Calculate days difference
					long diff = 0;
					if (lastCompleted != null) {
						diff = (logDate.getTime() - lastCompleted.getTime()) / (1000 * 60 * 60 * 24);
					}

					// Update streak based on days difference
					if (lastCompleted == null || diff == 1) {
						// Continue streak
						currentStreak++;
					} else if (diff > 1) {
						// Streak broken
						currentStreak = 1;
					}

					// Update longest streak if needed
					if (currentStreak > longestStreak) {
						longestStreak = currentStreak;
					}

					// Update streak in database
					String updateSql = "UPDATE habit_streaks SET current_streak = ?, longest_streak = ?, last_completed = ? WHERE habit_id = ?";
					try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
						updateStmt.setInt(1, currentStreak);
						updateStmt.setInt(2, longestStreak);
						updateStmt.setDate(3, new java.sql.Date(logDate.getTime()));
						updateStmt.setInt(4, habitId);
						updateStmt.executeUpdate();
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// Get habit logs for a specific habit within a date range
	public List<HabitLog> getHabitLogs(int habitId, Date startDate, Date endDate) throws SQLException {
		List<HabitLog> logs = new ArrayList<>();
		String sql = "SELECT * FROM habit_logs WHERE habit_id = ? AND log_date BETWEEN ? AND ? ORDER BY log_date";
		Connection conn = getCon();
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, habitId);
			pstmt.setDate(2, new java.sql.Date(startDate.getTime()));
			pstmt.setDate(3, new java.sql.Date(endDate.getTime()));
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				HabitLog log = new HabitLog();
				log.setLogId(rs.getInt("log_id"));
				log.setHabitId(rs.getInt("habit_id"));
				log.setLogDate(rs.getDate("log_date"));
				log.setStatus(rs.getString("status"));
				logs.add(log);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return logs;
	}

	// Get streak information for a habit
	public HabitStreak getHabitStreak(int habitId) {
		String sql = "SELECT * FROM habit_streaks WHERE habit_id = ?";
		Connection conn = null;
		try {
			conn = getCon();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, habitId);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				HabitStreak streak = new HabitStreak();
				streak.setStreakId(rs.getInt("streak_id"));
				streak.setHabitId(rs.getInt("habit_id"));
				streak.setCurrentStreak(rs.getInt("current_streak"));
				streak.setLongestStreak(rs.getInt("longest_streak"));
				streak.setLastCompleted(rs.getDate("last_completed"));
				return streak;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	// Get weekly summary stats for a user
	public Map<String, Object> getWeeklySummary(int userId) throws SQLException {
		Map<String, Object> summary = new HashMap<>();

		// Get current date and calculate start of week (Monday)
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		java.util.Date utilStartOfWeek = cal.getTime();
		java.sql.Date startOfWeek = new java.sql.Date(utilStartOfWeek.getTime());
		// Calculate end of week (Sunday)
		cal.add(Calendar.DAY_OF_WEEK, 6);
		java.util.Date utilEndOfWeek = cal.getTime();
		java.sql.Date endOfWeek = new java.sql.Date(utilEndOfWeek.getTime());
		// Get total habits
		List<Habits> userHabits = getHabitsByUserId(String.valueOf(userId));
		int totalHabits = userHabits.size();
		summary.put("totalHabits", totalHabits);

		// Initialize counters
		int totalCompletions = 0;
		int totalPossibleCompletions = 0;
		Map<String, Integer> habitCompletions = new HashMap<>();
		Map<String, Integer> dayCompletions = new HashMap<>();

		// Initialize day counters
		String[] days = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" };
		for (String day : days) {
			dayCompletions.put(day, 0);
		}

		// Get completions for each habit
		for (Habits habit : userHabits) {
			List<HabitLog> logs = getHabitLogs(habit.getHabitId(), startOfWeek, endOfWeek);
			int habitCompletionCount = 0;

			for (HabitLog log : logs) {
				if ("Completed".equals(log.getStatus())) {
					habitCompletionCount++;
					totalCompletions++;

					// Update day completions
					Calendar logCal = Calendar.getInstance();
					logCal.setTime(log.getLogDate());
					int dayOfWeek = logCal.get(Calendar.DAY_OF_WEEK);
					String dayName = days[dayOfWeek - 2]; // Adjust for 0-based array
					dayCompletions.put(dayName, dayCompletions.get(dayName) + 1);
				}
			}

			habitCompletions.put(habit.getHabitName(), habitCompletionCount);
			totalPossibleCompletions += 7; // Daily habit for 7 days
		}

		// Calculate completion rate
		double completionRate = totalPossibleCompletions > 0
				? (double) totalCompletions / totalPossibleCompletions * 100
				: 0;
		summary.put("completionRate", Math.round(completionRate));

		// Find most consistent habit
		String mostConsistentHabit = "";
		int maxCompletions = 0;
		for (Map.Entry<String, Integer> entry : habitCompletions.entrySet()) {
			if (entry.getValue() > maxCompletions) {
				maxCompletions = entry.getValue();
				mostConsistentHabit = entry.getKey();
			}
		}
		summary.put("mostConsistent", mostConsistentHabit);

		// Find habit needing focus
		String needsFocus = "";
		int minCompletions = Integer.MAX_VALUE;
		for (Map.Entry<String, Integer> entry : habitCompletions.entrySet()) {
			if (entry.getValue() < minCompletions) {
				minCompletions = entry.getValue();
				needsFocus = entry.getKey();
			}
		}
		summary.put("needsFocus", needsFocus);

		// Find best day
		String bestDay = "";
		int maxDayCompletions = 0;
		for (Map.Entry<String, Integer> entry : dayCompletions.entrySet()) {
			if (entry.getValue() > maxDayCompletions) {
				maxDayCompletions = entry.getValue();
				bestDay = entry.getKey();
			}
		}
		summary.put("bestDay", bestDay);

		// Get longest streak across all habits
		int longestStreak = 0;
		for (Habits habit : userHabits) {
			HabitStreak streak = getHabitStreak(habit.getHabitId());
			if (streak != null && streak.getCurrentStreak() > longestStreak) {
				longestStreak = streak.getCurrentStreak();
			}
		}
		summary.put("longestStreak", longestStreak);

		return summary;
	}

}