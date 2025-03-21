package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TodoDao;

@WebServlet("/DeleteTodoServlet")
public class DeleteTodoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TodoDao todoDao;
    
    public void init() {
        todoDao = new TodoDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get todo ID from request
        String todoIdStr = request.getParameter("todoId");
        
        try {
            // Convert ID to integer
            int todoId = Integer.parseInt(todoIdStr);
            
            // Delete todo from the database
            todoDao.deleteTodo(todoId);
            
            // Return success response
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (NumberFormatException e) {
            // Handle parsing errors
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}