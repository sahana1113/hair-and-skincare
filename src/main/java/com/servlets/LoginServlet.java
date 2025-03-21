package com.servlets;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.pojo.UserDetails;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDetails loginUser = new UserDetails();
        loginUser.setUsermail(email);
        loginUser.setPassword(password);

        UserDao userDAO = new UserDao();
        UserDetails user = userDAO.validateUser(loginUser);

        if (user!=null) {
            HttpSession session = request.getSession();
            session.setAttribute("user_id",String.valueOf(user.getUserId()));
            session.setAttribute("user", user);
			response.sendRedirect("dashboard.jsp");
            response.getWriter().println("Login successful!");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
