package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.config.HikariCPDataSource;
import com.google.gson.Gson;
import com.pojo.SkinDetails;

public class SkinDao {
	public Connection getCon() throws SQLException {
		return HikariCPDataSource.getConnection();
	}
    public boolean insertSkinData(SkinDetails skincareData)
    {
    	 String query = "INSERT INTO skin (user_id, skin_type, skin_concerns, goals, current_routine, allergies, habits) "
                 + "VALUES (?, ?, ?, ?, ?, ?, ?)";
    Gson gson = new Gson();

    try (Connection con = getCon(); 
			PreparedStatement stmt = con.prepareStatement(query)) {
        // Map data to JSON
        String skinConcernsJson = gson.toJson(skincareData.getSkinConcerns());
        String goalsJson = gson.toJson(skincareData.getGoals());
        String currentRoutineJson = gson.toJson(new CurrentRoutine(
            skincareData.getSkincareFrequency(),
            skincareData.getCurrentProducts()
        ));
        boolean allergies= !(skincareData.getAllergies().contains("No") || skincareData.getAllergies().contains("Not sure"));

        String allergiesJson = gson.toJson(new Allergies(
        		allergies,
                allergies ? skincareData.getAllergies().get(skincareData.getAllergies().size() - 1)
                : null
        ));
        String habitsJson = gson.toJson(new Habits(
            skincareData.getSunExposure(),
            skincareData.getWaterIntake(),
            skincareData.getProductPreference(),
            skincareData.getSkinTreatment()
        ));

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

// Inner classes to structure JSON data
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
    private List<String> preferences;
    private List<String> skinTreatment;

    public Habits(String sunExposure, String waterIntake, List<String> string,List<String> pastMedications) {
        this.sunExposure = sunExposure;
        this.waterIntake = waterIntake;
        this.preferences = string;
        this.skinTreatment=pastMedications;
    }
}
}
