package com.pojo;
import com.google.gson.annotations.SerializedName;
import java.util.List;

public class SkinDetails {
	private String user_id;
	private int skin_id;
    
    @SerializedName("skin_type")
    private String skinType;

    @SerializedName("skin_concerns")
    private List<String> skinConcerns;

    @SerializedName("skin_goals")
    private List<String> goals;

    @SerializedName("skincare_frequency")
    private String skincareFrequency;

    @SerializedName("current_products")
    private List<String> currentProducts;

    @SerializedName("allergies")
    private List<String> allergies;

    @SerializedName("sun_exposure")
    private String sunExposure;

    @SerializedName("skin_texture")
    private String skinTexture;

    @SerializedName("regular_experiences")
    private List<String> regularExperiences;

    @SerializedName("water_intake")
    private String waterIntake;

    @SerializedName("product_preference")
    private List<String> productPreference;

    @SerializedName("skin_treatment")
    private List<String> skinTreatment;

    // Getters and Setters
    
    public String getSkinType() {
        return skinType;
    }

    public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getSkin_id() {
		return skin_id;
	}

	public void setSkin_id(int skin_id) {
		this.skin_id = skin_id;
	}

	public void setSkinType(String skinType) {
        this.skinType = skinType;
    }

    public List<String> getSkinConcerns() {
        return skinConcerns;
    }

    public void setSkinConcerns(List<String> skinConcerns) {
        this.skinConcerns = skinConcerns;
    }

    public List<String> getGoals() {
        return goals;
    }

    public void setGoals(List<String> goals) {
        this.goals = goals;
    }

    public String getSkincareFrequency() {
        return skincareFrequency;
    }

    public void setSkincareFrequency(String skincareFrequency) {
        this.skincareFrequency = skincareFrequency;
    }

    public List<String> getCurrentProducts() {
        return currentProducts;
    }

    public void setCurrentProducts(List<String> currentProducts) {
        this.currentProducts = currentProducts;
    }

    public List<String> getAllergies() {
        return allergies;
    }

    public void setAllergies(List<String> allergies) {
        this.allergies = allergies;
    }

    public String getSunExposure() {
        return sunExposure;
    }

    public void setSunExposure(String sunExposure) {
        this.sunExposure = sunExposure;
    }

    public String getSkinTexture() {
        return skinTexture;
    }

    public void setSkinTexture(String skinTexture) {
        this.skinTexture = skinTexture;
    }

    public List<String> getRegularExperiences() {
        return regularExperiences;
    }

    public void setRegularExperiences(List<String> regularExperiences) {
        this.regularExperiences = regularExperiences;
    }

    public String getWaterIntake() {
        return waterIntake;
    }

    public void setWaterIntake(String waterIntake) {
        this.waterIntake = waterIntake;
    }

    public List<String> getProductPreference() {
        return productPreference;
    }

    public void setProductPreference(List<String> productPreference) {
        this.productPreference = productPreference;
    }

    public List<String> getSkinTreatment() {
        return skinTreatment;
    }

    public void setSkinTreatment(List<String> skinTreatment) {
        this.skinTreatment = skinTreatment;
    }

	@Override
	public String toString() {
		return "SkinDetails [user_id=" + user_id + ", skin_id=" + skin_id + ", skinType=" + skinType + ", skinConcerns="
				+ skinConcerns.toString() + ", goals=" + goals.toString() + ", skincareFrequency=" + skincareFrequency + ", currentProducts="
				+ currentProducts.toString() + ", allergies=" + allergies.toString() + ", sunExposure=" + sunExposure + ", skinTexture="
				+ skinTexture + ", regularExperiences=" + regularExperiences.toString() + ", waterIntake=" + waterIntake
				+ ", productPreference=" + productPreference.toString() +  "]";
	}
    

}
