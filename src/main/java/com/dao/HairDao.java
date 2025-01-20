package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.config.HikariCPDataSource;
import com.google.gson.Gson;
import com.pojo.HairDetails;
import com.pojo.SkinDetails;

public class HairDao {
	public Connection getCon() throws SQLException {
		return HikariCPDataSource.getConnection();
	}
    public boolean insertHairData(HairDetails haircareData)
    {
    	 String query = "INSERT INTO hair (user_id, hair_type, hair_concerns,scalp_type, goals, current_haircare_routine, allergies, styling_habits,lifestyle_factors) "
                 + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    Gson gson = new Gson();

    try (Connection con = getCon(); 
			PreparedStatement stmt = con.prepareStatement(query)) {
        // Map data to JSON
        String hairConcernsJson = gson.toJson(haircareData.getHairConcerns());
        System.out.print(hairConcernsJson);
        String hairType = gson.toJson(new HairType(
        		haircareData.getHairType(),
        		haircareData.getHairLength(),
        		haircareData.getHairTexture()));
        String scalpConcern=gson.toJson(haircareData.getScalpConcerns());
        String goalsJson = gson.toJson(haircareData.getGrowthGoals());
        
        String currentRoutineJson = gson.toJson(new CurrentRoutine(
            haircareData.getWashFrequency(),
            haircareData.getCurrentProducts()
        ));
        boolean allergies= !(haircareData.getAllergies().contains("No") || haircareData.getAllergies().contains("Not sure"));

        String allergiesJson = gson.toJson(new Allergies(
        		allergies,
                allergies ? haircareData.getAllergies().get(haircareData.getAllergies().size() - 1)
                : null,
                haircareData.getNaturalProductPreference()
        ));
        boolean treatment=!(haircareData.getChemicalTreatments().contains("No"));
        
        String habitsJson = gson.toJson(new StylingHabits(
        	haircareData.getStylingToolsUsage(),	
            treatment,
            treatment ? haircareData.getChemicalTreatments().get(haircareData.getChemicalTreatments().size()-1):null
         ));
        
        String lifeFactors = gson.toJson(new LifeFactors(
        		haircareData.getSeasonalEffects(),
        		haircareData.getDiet(),
        		haircareData.getWaterIntake(),
        		haircareData.getStressLevel()));

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

    private static class HairType {
        private String hairType;
        private String hairLength;
        private String hairTexture;
		public HairType(String hairtype, String hairlength, String hairtexture) {
			this.hairType = hairtype;
			this.hairLength = hairlength;
			this.hairTexture = hairtexture;
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
    private String prefered_natural;

    public Allergies(boolean hasAllergies, String details,String prefered) {
        this.hasAllergies = hasAllergies;
        this.allergyDetails = details;
        this.prefered_natural=prefered;
    }
}

private static class StylingHabits {
    private String styling_tools;
    private boolean  chemicalTreatments;
    private String treatmentDetails;
    
	public StylingHabits(String styling_tools, boolean chemicalTreatments, String treatmentDetails) {
		this.styling_tools = styling_tools;
		this.chemicalTreatments = chemicalTreatments;
		this.treatmentDetails = treatmentDetails;
	}    
}

private static class LifeFactors{
	private String seasonalEffects;
	private String diet;
	private String water_intake;
	private String stress_level;
	
	public LifeFactors(String seasonalEffects, String diet, String water_intake, String stress_level) {
		this.seasonalEffects = seasonalEffects;
		this.diet = diet;
		this.water_intake = water_intake;
		this.stress_level = stress_level;
	}
	
	
}
}
