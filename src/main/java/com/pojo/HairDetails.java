package com.pojo;

import com.google.gson.annotations.SerializedName;
import java.util.List;

public class HairDetails {
    private String user_id;
    private int hair_id;

    @SerializedName("hair_type")
    private String hairType;

    @SerializedName("hair_concern")
    private List<String> hairConcerns;

    @SerializedName("scalp_concern")
    private List<String> scalpConcerns;

    @SerializedName("hair_length")
    private String hairLength;

    @SerializedName("wash_frequency")
    private String washFrequency;

    @SerializedName("current_products")
    private List<String> currentProducts;

    @SerializedName("chemical_treatments")
    private List<String> chemicalTreatments;

    @SerializedName("seasonal_effects")
    private String seasonalEffects;

    @SerializedName("growth_goals")
    private String growthGoals;

    @SerializedName("stress_level")
    private String stressLevel;
    
    @SerializedName("allergies")
    private List<String> allergies;

    // Getters and Setters

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getHair_id() {
        return hair_id;
    }

    public void setHair_id(int hair_id) {
        this.hair_id = hair_id;
    }

    public String getHairType() {
        return hairType;
    }

    public void setHairType(String hairType) {
        this.hairType = hairType;
    }

    public List<String> getHairConcerns() {
        return hairConcerns;
    }

    public void setHairConcerns(List<String> hairConcerns) {
        this.hairConcerns = hairConcerns;
    }

    public List<String> getScalpConcerns() {
        return scalpConcerns;
    }

    public void setScalpConcerns(List<String> scalpConcerns) {
        this.scalpConcerns = scalpConcerns;
    }

    public String getHairLength() {
        return hairLength;
    }

    public void setHairLength(String hairLength) {
        this.hairLength = hairLength;
    }

    public String getWashFrequency() {
        return washFrequency;
    }

    public void setWashFrequency(String washFrequency) {
        this.washFrequency = washFrequency;
    }

    public List<String> getCurrentProducts() {
        return currentProducts;
    }

    public void setCurrentProducts(List<String> currentProducts) {
        this.currentProducts = currentProducts;
    }

    public List<String> getChemicalTreatments() {
        return chemicalTreatments;
    }

    public void setChemicalTreatments(List<String> chemicalTreatments) {
        this.chemicalTreatments = chemicalTreatments;
    }

    public String getSeasonalEffects() {
        return seasonalEffects;
    }

    public void setSeasonalEffects(String seasonalEffects) {
        this.seasonalEffects = seasonalEffects;
    }

    public String getGrowthGoals() {
        return growthGoals;
    }

    public void setGrowthGoals(String growthGoals) {
        this.growthGoals = growthGoals;
    }

    public String getStressLevel() {
        return stressLevel;
    }

    public void setStressLevel(String stressLevel) {
        this.stressLevel = stressLevel;
    }

    
    public List<String> getAllergies() {
        return allergies;
    }

    public void setAllergies(List<String> allergies) {
        this.allergies = allergies;
    }

	@Override
	public String toString() {
		return "HairDetails [user_id=" + user_id + ", hair_id=" + hair_id + ", hairType=" + hairType + ", hairConcerns="
				+ hairConcerns.toString() + ", scalpConcerns=" + scalpConcerns.toString() + ", hairLength=" + hairLength + ", washFrequency="
				+ washFrequency + ", currentProducts=" + currentProducts.toString() + ", chemicalTreatments=" + chemicalTreatments.toString()
				+ ", seasonalEffects=" + seasonalEffects + ", growthGoals=" + growthGoals + ", stressLevel="
				+ stressLevel + ", allergies=" + allergies + "]";
	}
    
    
}
