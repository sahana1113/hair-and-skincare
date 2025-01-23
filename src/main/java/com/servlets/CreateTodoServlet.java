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
import com.dao.TodoDao;
import com.pojo.Todo;

@WebServlet("/CreateTodoServlet")
public class CreateTodoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form data
        String taskName = request.getParameter("taskName");
        String taskDescription = request.getParameter("taskDescription");
        String dueDate = request.getParameter("dueDate");
        String status = request.getParameter("status");
        String userId = ((String) request.getSession().getAttribute("user_id"));
        
        Todo todo=new Todo();
        todo.setTaskName(taskName);
        todo.setTaskDescription(taskDescription);
        todo.setDueDate(LocalDate.parse(dueDate).atStartOfDay(ZoneOffset.UTC).toEpochSecond());
        todo.setUserId(userId);
        todo.setStatus(status);

        TodoDao dao=new TodoDao();
        boolean isInserted;
		isInserted = dao.insertTodoData(todo);
		if (isInserted) {
			response.sendRedirect("dashboard.jsp");
		} else {
			request.setAttribute("errorMessage", "Registration failed. Please try again.");
			request.getRequestDispatcher("habitCreation.jsp").forward(request, response);
		}
    }
}

