package com.generator;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.config.HikariCPDataSource;
import com.dao.SkinDao;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class SkinRecommendations {
	private static final String API_URL = "https://api.groq.com/openai/v1/chat/completions";
    private static final String API_KEY = "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";

    public static String generator(String prompt,String userId) {
        try {
        	System.out.println(prompt);
            HttpClient client = HttpClient.newHttpClient();

            String requestBody = "{"
                    + "\"model\": \"llama-3.3-70b-versatile\","
                    + "\"messages\": [{"
                    + "\"role\": \"user\","
                    + "\"content\": \"" + prompt + "\""
                    + "}],"
                    + "\"temperature\": 0.7"
                    + "}";

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .header("Authorization", "Bearer " + API_KEY)
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(requestBody))
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            String responseBody = response.body();
            String content = extractContent(responseBody);
            if(content!=null)
            {
                Map<String, Object> skincareRoutine = parseSkincareRoutine(content);
                SkinDao.insertRoutineData(skincareRoutine,userId);
            }

            return content;
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
    }

    private static String extractContent(String json) {
        try {
            int contentStart = json.indexOf("\"content\":\"") + "\"content\":\"".length();
            int contentEnd = json.indexOf("\"", contentStart);
            return json.substring(contentStart, contentEnd).replace("\\n", "\n").replace("\\\"", "\"");
        } catch (Exception e) {
            return "Failed to extract content.";
        }
    }
    
    private static Map<String, Object> parseSkincareRoutine(String input) {
        Map<String, Object> skincareRoutine = new HashMap<>();
        
        String[] sections = input.split("\n\\d+\\.\\s*");  
        
        String[] titles = {
            "Morning",
            "Evening",
            "Weekly",
            "General Tips",
            "Explanation"
        };
        
        int titleIndex = 0;
        
        for (String section : sections) {
            if (section.trim().isEmpty()) continue;
            String[] lines = section.trim().split("\n");

            List<String> list = new ArrayList<>();
            
            for (int i=1;i<lines.length;i++) {
            	String s = lines[i].substring(0, 1).toUpperCase() + lines[i].substring(1);
                list.add(s);
            }
            
            skincareRoutine.put(titles[titleIndex], list);
            titleIndex++;
        }
        
        return skincareRoutine;
    }
    
   
}
