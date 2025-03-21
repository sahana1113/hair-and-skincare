package com.servlets;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.pojo.UserDetails;


@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String usermail = request.getParameter("usermail");
        String phonenumber = request.getParameter("phonenumber");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String location = request.getParameter("location");

        HttpSession session = request.getSession();
        UserDetails user = (UserDetails) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        user.setUsername(username);
        user.setUsermail(usermail);
        user.setPhoneNumber(phonenumber);
        user.setAge(Integer.parseInt(age));
        user.setGender(gender);
        user.setLocation(location);
        
        try {
           int rowsUpdated = UserDao.updateUserDetails(user);

            if (rowsUpdated > 0) {

                session.setAttribute("user", user);

                response.sendRedirect("dashboard.jsp?success=Profile Updated Successfully");
            } else {
                response.sendRedirect("profile.jsp?error=Update Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("profile.jsp?error=Database Error");
        }
    }
}

