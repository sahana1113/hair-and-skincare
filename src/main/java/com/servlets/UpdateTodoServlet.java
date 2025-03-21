package com.servlets;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TodoDao;
import com.pojo.Todo;

@WebServlet("/UpdateTodoServlet")
public class UpdateTodoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TodoDao todoDao;
    
    public void init() {
        todoDao = new TodoDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get parameters from request
        String taskName = request.getParameter("taskName");
        String taskDescription = request.getParameter("taskDescription");
        String dueDateStr = request.getParameter("dueDate");
        String status = request.getParameter("status");
        String todoIdStr = request.getParameter("todoId");
        String userIdStr = request.getParameter("userId");
        
        try {
            // Convert IDs to integers
            int todoId = Integer.parseInt(todoIdStr);
            int userId = Integer.parseInt(userIdStr);
            
            // Get existing todo
            Todo todo = todoDao.getTodoById(todoId);
            
            // Update fields
            todo.setTaskName(taskName);
            todo.setTaskDescription(taskDescription);
            todo.setStatus(status);
            
            // Parse and set due date if provided
            if (dueDateStr != null && !dueDateStr.isEmpty()) {
                Date dueDate = Date.valueOf(dueDateStr);
                todo.setDueDate(dueDate);
            } else {
                todo.setDueDate(null);
            }
            
            // Update todo in the database
            todoDao.updateTodo(todo);
            
            // Redirect back to home page
            response.sendRedirect("todo.jsp");
        } catch (NumberFormatException e) {
            // Handle parsing errors
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}