package com.generator;

import com.pojo.HairDetails;
import com.pojo.UserDetails;

public class HairPrompt {
    public final static String constant = "Based on the following hair profile, provide a concise personalized hair care routine in bullet points and product recommendations (without mentioning specific brands). Consider the user's concerns, goals, and preferences while ensuring scientific accuracy. Additionally, provide tips for long-term hair health. Each step should be short and to the point. Also avoid using any symbols like asterisks or others for separation. The hair profile is as follows:";
    
    public final static String responseFormat = "Expected Response Format:"
    		+ "1. Morning Routine "
            + "2. Evening Routine "
            + "3. Weekly Treatments "
            + "4. General Skincare Tips "
            + "5. Scientific Explanation (Why these products and steps are beneficial for the given hair type and concerns)"
            + "Please make sure to follow the above format exactly, using proper JSON notation and ensuring all the requested points are included.";
    
    public static String prompt(HairDetails hair, UserDetails user) {
        StringBuilder hairPrompt = new StringBuilder(constant);

        hairPrompt.append("User Hair Profile: ");
        hairPrompt.append("- Gender: " + user.getGender());
        hairPrompt.append("- Age: " + user.getAge());
        hairPrompt.append("- Location: " + user.getLocation());
        hairPrompt.append("- Hair type: " + hair.getHairType());
        hairPrompt.append("- Hair concerns: " + hair.getHairConcerns().toString());
        hairPrompt.append("- Scalp concerns: " + hair.getScalpConcerns().toString());
        hairPrompt.append("- Hair length: " + hair.getHairLength());
        hairPrompt.append("- Wash frequency: " + hair.getWashFrequency());
        hairPrompt.append("- Current Products: " + hair.getCurrentProducts().toString());
        hairPrompt.append("- Chemical treatments: " + hair.getChemicalTreatments().toString());
        hairPrompt.append("- Seasonal effects: " + hair.getSeasonalEffects());
        hairPrompt.append("- Growth goals: " + hair.getGrowthGoals());
        hairPrompt.append("- Stress level: " + hair.getStressLevel());
        hairPrompt.append("- Allergies: " + hair.getAllergies()!=null?hair.getAllergies().toString():"  ");
        
        hairPrompt.append(responseFormat);
        
        return hairPrompt.toString();
    }
}
