package com.pojo;
import java.util.*;
public class Habits {
    String sunExposure;
    String waterIntake;
    List<String> preferences;
    
	public String getSunExposure() {
		return sunExposure;
	}
	public void setSunExposure(String sunExposure) {
		this.sunExposure = sunExposure;
	}
	public String getWaterIntake() {
		return waterIntake;
	}
	public void setWaterIntake(String waterIntake) {
		this.waterIntake = waterIntake;
	}
	public List<String> getPreferences() {
		return preferences;
	}
	public void setPreferences(List<String> preferences) {
		this.preferences = preferences;
	}
    public String listToString() {
    	return preferences.toString();
    }
    
}
