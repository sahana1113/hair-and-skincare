package com.generator;

import com.pojo.SkinDetails;
import com.pojo.UserDetails;

public class SkinPrompt {
	public final static String constant = "Based on the following skincare profile, provide a concise personalized skincare routine in points and product recommendations (without mentioning specific brands). Consider the user's concerns, goals, and preferences while ensuring scientific accuracy. Additionally, provide tips for long-term skin health. Each step should be short and to the point.Also avoid using any symbols like asterisks or others for separation. The skincare profile is as follows:";
	
	public final static String responseFormat = "Expected Response Format:"
            + "1. Morning Routine "
            + "2. Evening Routine "
            + "3. Weekly Treatments "
            + "4. General Skincare Tips "
            + "5. Scientific Explanation (Why these products and steps are beneficial for the given skin type and concerns)"
            + "Please make sure to follow the above format exactly, using proper JSON notation and ensuring all the requested points are included.";
	
	public static String prompt(SkinDetails skin, UserDetails user) {
		StringBuilder skinPrompt = new StringBuilder(constant);
		
		skinPrompt.append("User Skincare Profile: ");
		skinPrompt.append("- Gender: "+ user.getGender());
		skinPrompt.append("-Age: "+user.getAge());
		skinPrompt.append("-Location: "+user.getLocation());
		skinPrompt.append("-Skin type: "+skin.getSkinType());
		skinPrompt.append("-Skin concerns: "+skin.getSkinConcerns().toString());
		skinPrompt.append("-Goals: "+skin.getGoals().toString());
		skinPrompt.append("-Skincare frequency: "+skin.getSkincareFrequency());
		skinPrompt.append("-Current Products: "+skin.getCurrentProducts().toString());
		skinPrompt.append("-Allergies: "+skin.getAllergies().toString());
		skinPrompt.append("-Sun exposure: "+skin.getSunExposure());
		skinPrompt.append("-Skin texture: "+skin.getSkinTexture());
		skinPrompt.append("-Water intake: "+skin.getWaterIntake());
		
		skinPrompt.append(responseFormat);
		
		return skinPrompt.toString();
		
	}

}
