package com.servlets;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.pojo.UserDetails;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user input from the login form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Creating a User object (this will be passed to the DAO for login verification)
        UserDetails loginUser = new UserDetails();
        loginUser.setUsermail(email);
        loginUser.setPassword(password);

        // Use DAO to verify user credentials
        UserDao userDAO = new UserDao();
        int isLoggedIn = userDAO.validateUser(loginUser);

        if (isLoggedIn!=0) {
            // User is successfully logged in, start a session
            HttpSession session = request.getSession();
            session.setAttribute("user_id",String.valueOf(isLoggedIn));
			response.sendRedirect("dashboard.jsp");
            // Redirect to the dashboard or a welcome page
            response.getWriter().println("Login successful!");
        } else {
            // Invalid credentials, show error message
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
