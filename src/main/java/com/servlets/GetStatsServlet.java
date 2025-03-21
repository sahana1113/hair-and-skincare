package com.servlets;

/**
 * GetStatsServlet.java
 * Servlet to provide updated stats via AJAX
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.UserDetails;
import com.utils.RoutineStatsCalculator;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import java.text.DecimalFormat;

@WebServlet("/getStats")
public class GetStatsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        UserDetails user = (UserDetails) session.getAttribute("user");
        
        if (user == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }
        
        try {
            int userId = user.getUserId();
            
            // Calculate stats
            double dailyTasksPercentage = RoutineStatsCalculator.calculateDailyTaskCompletion(userId);
            int currentStreak = RoutineStatsCalculator.calculateCurrentStreak(userId);
            int challengesCompleted = RoutineStatsCalculator.calculateChallengesCompleted(userId);
            double routineRating = RoutineStatsCalculator.calculateRoutineRating(userId);
            
            // Format numbers
            DecimalFormat df = new DecimalFormat("0.0");
            
            // Prepare response data
            Map<String, String> statsData = new HashMap<>();
            statsData.put("dailyTasksPercentage", df.format(dailyTasksPercentage));
            statsData.put("currentStreak", String.valueOf(currentStreak));
            statsData.put("challengesCompleted", String.valueOf(challengesCompleted));
            statsData.put("routineRating", df.format(routineRating));
            
            // Convert to JSON and send response
            Gson gson = new Gson();
            response.setContentType("application/json");
            response.getWriter().write(gson.toJson(statsData));
            
        } catch (Exception e) {
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"" + e.getMessage() + "\"}");
        }
    }
}