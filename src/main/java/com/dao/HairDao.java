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
import com.pojo.HairDetails;
import com.pojo.Routine;
import com.pojo.SkinDetails;

public class HairDao {
	public Connection getCon() throws SQLException {
		return HikariCPDataSource.getConnection();
	}

	public boolean insertHairData(HairDetails haircareData) {
		String query = "INSERT INTO hair (user_id, hair_type, hair_concerns,scalp_type, goals, current_haircare_routine, allergies, styling_habits,lifestyle_factors) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Gson gson = new Gson();

		try (Connection con = getCon(); PreparedStatement stmt = con.prepareStatement(query)) {
			String hairConcernsJson = gson.toJson(haircareData.getHairConcerns());
			System.out.print(hairConcernsJson);
			String hairType = gson.toJson(new HairType(haircareData.getHairType(), haircareData.getHairLength()));
			String scalpConcern = gson.toJson(haircareData.getScalpConcerns());
			String goalsJson = gson.toJson(haircareData.getGrowthGoals());

			String currentRoutineJson = gson
					.toJson(new CurrentRoutine(haircareData.getWashFrequency(), haircareData.getCurrentProducts()));
			boolean allergies = !(haircareData.getAllergies().contains("No")
					|| haircareData.getAllergies().contains("Not sure"));

			String allergiesJson = gson.toJson(new Allergies(allergies,
					allergies ? haircareData.getAllergies().get(haircareData.getAllergies().size() - 1) : null));
			boolean treatment = !(haircareData.getChemicalTreatments().contains("No"));

			String habitsJson = gson.toJson(new StylingHabits(treatment,
					treatment
							? haircareData.getChemicalTreatments().get(haircareData.getChemicalTreatments().size() - 1)
							: null));

			String lifeFactors = gson
					.toJson(new LifeFactors(haircareData.getSeasonalEffects(), haircareData.getStressLevel()));

			// Set parameters
			stmt.setObject(1, haircareData.getUser_id());
			stmt.setString(2, hairType);
			stmt.setString(3, hairConcernsJson);
			stmt.setString(4, scalpConcern);
			stmt.setString(5, goalsJson);
			stmt.setString(6, currentRoutineJson);
			stmt.setString(7, allergiesJson);
			stmt.setString(8, habitsJson);
			stmt.setString(9, lifeFactors);

			// Execute update
			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0; // Return true if insertion was successful
		} catch (Exception e) {
			e.printStackTrace();
			return false; // Return false in case of an error
		}
	}

	public HairDetails getHairDetailsByUserId(String userId) {
		String query = "SELECT * FROM hair WHERE user_id = ?";
		Gson gson = new Gson();

		try (Connection con = getCon(); PreparedStatement stmt = con.prepareStatement(query)) {
			// Set the user ID parameter
			stmt.setString(1, userId);

			// Execute the query
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				HairDetails hairDetails = new HairDetails();

				hairDetails.setUser_id(rs.getString("user_id"));
				hairDetails.setHair_id(rs.getInt("hair_id"));

				HairType hairType = gson.fromJson(rs.getString("hair_type"), HairType.class);
				hairDetails.setHairType(hairType.hairType);
				hairDetails.setHairLength(hairType.hairLength);

				List<String> hairConcerns = gson.fromJson(rs.getString("hair_concerns"), List.class);
				hairDetails.setHairConcerns(hairConcerns);

				List<String> scalpConcerns = gson.fromJson(rs.getString("scalp_type"), List.class);
				hairDetails.setScalpConcerns(scalpConcerns);

				hairDetails.setGrowthGoals(gson.fromJson(rs.getString("goals"), String.class));

				CurrentRoutine currentRoutine = gson.fromJson(rs.getString("current_haircare_routine"),
						CurrentRoutine.class);
				hairDetails.setWashFrequency(currentRoutine.wash_frequency);
				hairDetails.setCurrentProducts(currentRoutine.products);

				Allergies allergies = gson.fromJson(rs.getString("allergies"), Allergies.class);
				if (allergies.hasAllergies) {
					hairDetails.setAllergies(List.of(allergies.allergyDetails));
				} else {
					hairDetails.setAllergies(List.of("No"));
				}

				StylingHabits stylingHabits = gson.fromJson(rs.getString("styling_habits"), StylingHabits.class);
				if (stylingHabits.chemicalTreatments) {
					hairDetails.setChemicalTreatments(List.of(stylingHabits.treatmentDetails));
				} else {
					hairDetails.setChemicalTreatments(List.of("No"));

				}

				LifeFactors lifeFactors = gson.fromJson(rs.getString("lifestyle_factors"), LifeFactors.class);
				hairDetails.setSeasonalEffects(lifeFactors.seasonalEffects);
				hairDetails.setStressLevel(lifeFactors.stress_level);

				return hairDetails;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	private static class HairType {
		private String hairType;
		private String hairLength;

		public HairType(String hairtype, String hairlength) {
			this.hairType = hairtype;
			this.hairLength = hairlength;
		}

	}

	private static class CurrentRoutine {
		private String wash_frequency;
		private List<String> products;

		public CurrentRoutine(String frequency, List<String> list) {
			this.wash_frequency = frequency;
			this.products = list;
		}
	}

	private static class Allergies {
		private boolean hasAllergies;
		private String allergyDetails;

		public Allergies(boolean hasAllergies, String details) {
			this.hasAllergies = hasAllergies;
			this.allergyDetails = details;
		}
	}

	private static class StylingHabits {
		private boolean chemicalTreatments;
		private String treatmentDetails;

		public StylingHabits(boolean chemicalTreatments, String treatmentDetails) {
			this.chemicalTreatments = chemicalTreatments;
			this.treatmentDetails = treatmentDetails;
		}
	}

	private static class LifeFactors {
		private String seasonalEffects;
		private String stress_level;

		public LifeFactors(String seasonalEffects, String stress_level) {
			this.seasonalEffects = seasonalEffects;
			this.stress_level = stress_level;
		}

	}

	public static void insertRoutineData(Map<String, Object> haircareRoutine, String userId) {
		try {

			Connection conn = HikariCPDataSource.getConnection();
			String update = "update routines set is_current=false where is_current=true and  routine_type='Haircare'";

			try (PreparedStatement stmt = conn.prepareStatement(update)) {
				int r = stmt.executeUpdate();
			}

			String sql = "INSERT INTO routines (user_id, routine_type, details, occurrence, start_date, end_date, is_current) "
					+ "VALUES (?, ?, ?, ?, ?, ?,?)";
			try (PreparedStatement stmt = conn.prepareStatement(sql)) {

				for (Map.Entry<String, Object> entry : (haircareRoutine).entrySet()) {
					String occurrence = entry.getKey();
					List<String> routineSteps = (List<String>) entry.getValue();

//					String details = String.join(" ", routineSteps);

					for(String details:routineSteps) {
					stmt.setObject(1, userId);
					stmt.setString(2, "Haircare");
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
		String sql = "SELECT * FROM routines WHERE user_id = ? AND is_current = TRUE AND routine_type = 'Haircare'";

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
