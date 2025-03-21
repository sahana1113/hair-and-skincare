package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TodoDao;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.pojo.Todo;

@WebServlet("/GetTodoServlet")
public class GetTodoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TodoDao todoDao;
    
    public void init() {
        todoDao = new TodoDao();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get todo ID from request
        String todoIdStr = request.getParameter("todoId");
        
        try {
            // Convert ID to integer
            int todoId = Integer.parseInt(todoIdStr);
            
            // Get todo from the database
            Todo todo = todoDao.getTodoById(todoId);
            
            if (todo != null) {
                // Set response type to JSON
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                
                // Create JSON object with todo data
                JsonObject jsonTodo = new JsonObject();
                jsonTodo.addProperty("todoId", todo.getTodoId());
                jsonTodo.addProperty("userId", todo.getUserId());
                jsonTodo.addProperty("taskName", todo.getTaskName());
                jsonTodo.addProperty("taskDescription", todo.getTaskDescription());
                
                // Format due date if present
                if (todo.getDueDate() != null) {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    jsonTodo.addProperty("dueDate", dateFormat.format(todo.getDueDate()));
                } else {
                    jsonTodo.addProperty("dueDate", "");
                }
                
                jsonTodo.addProperty("status", todo.getStatus());
                
                // Write JSON response
                PrintWriter out = response.getWriter();
                out.print(jsonTodo.toString());
                out.flush();
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (NumberFormatException e) {
            // Handle parsing errors
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
