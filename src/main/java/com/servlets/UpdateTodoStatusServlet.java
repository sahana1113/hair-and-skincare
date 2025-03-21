package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TodoDao;

@WebServlet("/UpdateTodoStatusServlet")
public class UpdateTodoStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TodoDao todoDao;
    
    public void init() {
        todoDao = new TodoDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get parameters from request
        String todoIdStr = request.getParameter("todoId");
        String status = request.getParameter("status");
        
        try {
            // Convert ID to integer
            int todoId = Integer.parseInt(todoIdStr);
            
            // Update todo status in the database
            todoDao.updateTodoStatus(todoId, status);
            
            // Return success response
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (NumberFormatException e) {
            // Handle parsing errors
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}