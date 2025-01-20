package com.servlets;

import java.io.*;
import java.time.LocalDate;
import java.time.ZoneOffset;

import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.pojo.UserDetails;

import java.util.*;

public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDetails user=new UserDetails();

		user.setUsername(request.getParameter("fullName"));
		user.setUsermail(request.getParameter("email"));
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		user.setGender(request.getParameter("gender"));		
		String dob = request.getParameter("dob");
		LocalDate birthday = LocalDate.parse(dob);
		user.setAge(birthday.atStartOfDay(ZoneOffset.UTC).toEpochSecond());
		user.setPhoneNumber(request.getParameter("phone"));
		user.setLocation(request.getParameter("address"));
		
		if (!password.equals(confirmPassword)) {
			request.setAttribute("errorMessage", "Passwords do not match.");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return;
		}
		user.setPassword(confirmPassword);
        UserDao dao=new UserDao();
        boolean isRegistered=dao.userRegister(user);
		if (isRegistered) {
			response.sendRedirect("selectOption.jsp");
		} else {
			// Registration failed (e.g., email already exists)
			request.setAttribute("errorMessage", "Registration failed. Please try again.");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
	}
}
