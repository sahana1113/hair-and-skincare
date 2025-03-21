package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.config.HikariCPDataSource;
import com.google.gson.Gson;
import com.pojo.Routine;
import com.pojo.SkinDetails;

public class SkinDao {
	public Connection getCon() throws SQLException {
		return HikariCPDataSource.getConnection();
	}

	public boolean insertSkinData(SkinDetails skincareData) {
		String query = "INSERT INTO skin (user_id, skin_type, skin_concerns, goals, current_routine, allergies, habits) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		Gson gson = new Gson();

		try (Connection con = getCon(); PreparedStatement stmt = con.prepareStatement(query)) {
			String skinConcernsJson = gson.toJson(skincareData.getSkinConcerns());
			String goalsJson = gson.toJson(skincareData.getGoals());
			String currentRoutineJson = gson
					.toJson(new CurrentRoutine(skincareData.getSkincareFrequency(), skincareData.getCurrentProducts()));
			boolean allergies = !(skincareData.getAllergies().contains("No")
					|| skincareData.getAllergies().contains("Not sure"));

			String allergiesJson = gson.toJson(new Allergies(allergies,
					allergies ? skincareData.getAllergies().get(skincareData.getAllergies().size() - 1) : null));
			String habitsJson = gson.toJson(new Habits(skincareData.getSunExposure(), skincareData.getWaterIntake(),
					skincareData.getSkinTreatment()));

			// Set parameters
			stmt.setObject(1, skincareData.getUser_id());
			stmt.setString(2, skincareData.getSkinType());
			stmt.setString(3, skinConcernsJson);
			stmt.setString(4, goalsJson);
			stmt.setString(5, currentRoutineJson);
			stmt.setString(6, allergiesJson);
			stmt.setString(7, habitsJson);

			// Execute update
			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0; // Return true if insertion was successful
		} catch (Exception e) {
			e.printStackTrace();
			return false; // Return false in case of an error
		}
	}

	public SkinDetails getSkinDetailsByUserId(String userId) {
		String query = "SELECT user_id, skin_id, skin_type, skin_concerns, goals, current_routine, allergies, habits FROM skin WHERE user_id = ?";
		Gson gson = new Gson();

		try (Connection con = getCon(); PreparedStatement stmt = con.prepareStatement(query)) {

			stmt.setObject(1, userId);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					SkinDetails skinDetails = new SkinDetails();

					// Set simple attributes
					skinDetails.setUser_id(rs.getString("user_id"));
					skinDetails.setSkin_id(rs.getInt("skin_id"));
					skinDetails.setSkinType(rs.getString("skin_type"));

					// Parse JSON fields
					List<String> skinConcerns = gson.fromJson(rs.getString("skin_concerns"), List.class);
					skinDetails.setSkinConcerns(skinConcerns);

					List<String> goals = gson.fromJson(rs.getString("goals"), List.class);
					skinDetails.setGoals(goals);

					CurrentRoutine currentRoutine = gson.fromJson(rs.getString("current_routine"),
							CurrentRoutine.class);
					skinDetails.setSkincareFrequency(currentRoutine.frequency);
					skinDetails.setCurrentProducts(currentRoutine.products);

					Allergies allergies = gson.fromJson(rs.getString("allergies"), Allergies.class);
					if (allergies != null) {
						skinDetails.setAllergies(allergies.hasAllergies ? List.of(allergies.details) : List.of("No"));
					}

					Habits habits = gson.fromJson(rs.getString("habits"), Habits.class);
					if (habits != null) {
						skinDetails.setSunExposure(habits.sunExposure);
						skinDetails.setWaterIntake(habits.waterIntake);
						skinDetails.setSkinTreatment(habits.skinTreatment);
					}
					return skinDetails;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null; // Return null if no record is found or an exception occurs
	}

	private static class CurrentRoutine {
		private String frequency;
		private List<String> products;

		public CurrentRoutine(String frequency, List<String> list) {
			this.frequency = frequency;
			this.products = list;
		}
	}

	private static class Allergies {
		private boolean hasAllergies;
		private String details;

		public Allergies(boolean hasAllergies, String details) {
			this.hasAllergies = hasAllergies;
			this.details = details;
		}
	}

	private static class Habits {
		private String sunExposure;
		private String waterIntake;
		private List<String> skinTreatment;

		public Habits(String sunExposure, String waterIntake, List<String> pastMedications) {
			this.sunExposure = sunExposure;
			this.waterIntake = waterIntake;
			this.skinTreatment = pastMedications;
		}
	}

	public static void insertRoutineData(Map<String, Object> skincareRoutine, String userId) {
		try {

			Connection conn = HikariCPDataSource.getConnection();
			String update = "update routines set is_current=false where is_current=true and  routine_type='Skincare'";

			try (PreparedStatement stmt = conn.prepareStatement(update)) {
				int r = stmt.executeUpdate();
			}

			String sql = "INSERT INTO routines (user_id, routine_type, details, occurrence, start_date, end_date,is_current) "
					+ "VALUES (?, ?, ?, ?, ?, ?,?)";
			try (PreparedStatement stmt = conn.prepareStatement(sql)) {

				for (Map.Entry<String, Object> entry : (skincareRoutine).entrySet()) {
					String occurrence = entry.getKey();
					List<String> routineSteps = (List<String>) entry.getValue();

//					String details = String.join(" ", routineSteps);
                    for(String details:routineSteps) {
					stmt.setObject(1, userId);
					stmt.setString(2, "Skincare");
					stmt.setString(3, details);
					stmt.setString(4, occurrence);
					stmt.setLong(5, System.currentTimeMillis() / 1000);
					stmt.setLong(6, System.currentTimeMillis() / 1000);
					stmt.setBoolean(7, true);

					stmt.addBatch();
                    }
				}

				int[] updateCounts = stmt.executeBatch();

				System.out.println("Inserted " + updateCounts.length + " rows successfully.");

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Routine> getCurrentRoutinesByUserId(int userId) {
		List<Routine> routines = new ArrayList<>();
		String sql = "SELECT * FROM routines WHERE user_id = ? AND is_current = TRUE AND routine_type = 'Skincare'";

		try (Connection con = getCon(); PreparedStatement statement = con.prepareStatement(sql)) {
			statement.setInt(1, userId);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				Routine routine = new Routine();
				routine.setRoutine_id(resultSet.getInt("routine_id"));
				routine.setUser_id(resultSet.getInt("user_id"));
				routine.setRoutine_type(resultSet.getString("routine_type"));
				routine.setOccurence(resultSet.getString("occurrence"));
				routine.setStart_date(resultSet.getLong("start_date"));
				routine.setEnd_date(resultSet.getLong("end_date"));
				routine.setIs_current(resultSet.getBoolean("is_current"));

				String details = resultSet.getString("details");
				List<String> detailsList = Arrays.asList(details.split("\\s*(?=\\d\\.)"));
				detailsList = detailsList.stream().filter(detail -> !detail.isEmpty()).collect(Collectors.toList());

				routine.setDetails(resultSet.getString("details"));
				routines.add(routine);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return routines;
	}
}
