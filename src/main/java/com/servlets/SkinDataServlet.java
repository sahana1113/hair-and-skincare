package com.servlets;
import com.dao.SkinDao;
import com.generator.SkinPrompt;
import com.generator.SkinRecommendations;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.pojo.SkinDetails;
import com.pojo.UserDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/SaveSkincareDataServlet")
public class SkinDataServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        Gson gson = new Gson();
        SkinDetails skincareData = gson.fromJson(request.getReader(), SkinDetails.class);

        String userId = ((String) request.getSession().getAttribute("user_id"));
        UserDetails user = (UserDetails) request.getSession().getAttribute("user");
        skincareData.setUser_id(userId);
        System.out.println("Parsed Skincare Data: " + skincareData);
        String prompt = SkinPrompt.prompt(skincareData, user);
        SkinRecommendations.generator(prompt,userId);
        
        SkinDao dao=new SkinDao();
        boolean success = false;
		try {
			success = dao.insertSkinData(skincareData);
		} catch (Exception e) {
			e.printStackTrace();
		}

        if (success) {
            response.sendRedirect("skincare.jsp");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"message\": \"Failed to save data.\"}");
        }
        
    }


}
