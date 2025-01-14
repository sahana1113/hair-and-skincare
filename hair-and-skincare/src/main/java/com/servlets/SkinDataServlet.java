package com.servlets;
import com.dao.SkinDao;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.pojo.SkinDetails;

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
        // Set response type to JSON
        response.setContentType("application/json");
        Gson gson = new Gson();
        SkinDetails skincareData = gson.fromJson(request.getReader(), SkinDetails.class);

        String userId = ((String) request.getSession().getAttribute("user_id"));
        skincareData.setUser_id(userId);
        // Debug: Print parsed data (optional)
        System.out.println("Parsed Skincare Data: " + skincareData);
        SkinDao dao=new SkinDao();
        boolean success = false;
		try {
			success = dao.insertSkinData(skincareData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        if (success) {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"message\": \"Data saved successfully.\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"message\": \"Failed to save data.\"}");
        }
        
    }


}
