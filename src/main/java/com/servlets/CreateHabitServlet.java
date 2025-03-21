package com.servlets;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneOffset;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.HabitDao;
import com.pojo.Habits;

@WebServlet("/CreateHabitServlet")
public class CreateHabitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get form data
        String habitName = request.getParameter("habitName");
        String habitDescription = request.getParameter("habitDescription");
        String frequency = request.getParameter("frequency");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String userId = ((String) request.getSession().getAttribute("user_id"));
        
        Habits habit=new Habits();
        habit.setUserId(userId);
        habit.setHabitName(habitName);
        habit.setHabitDescription(habitDescription);
        habit.setFrequency(frequency);
        habit.setStartDate(java.sql.Date.valueOf(startDate));
        habit.setEndDate(java.sql.Date.valueOf(endDate));
        HabitDao dao=new HabitDao();
        boolean isInserted;
		try {
			isInserted = dao.insertHabitData(habit);
			if (isInserted) {
				response.sendRedirect("habits.jsp");
			} else {
				request.setAttribute("errorMessage", "Registration failed. Please try again.");
				request.getRequestDispatcher("habitCreation.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
    }
}
