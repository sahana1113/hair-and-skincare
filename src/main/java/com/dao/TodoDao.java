package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.config.HikariCPDataSource;
import com.pojo.HairDetails;
import com.pojo.Todo;

public class TodoDao {
	 private static final String SELECT_TODO_BY_ID = "SELECT * FROM todo_list WHERE todo_id = ?";
	    private static final String SELECT_ALL_TODOS_BY_USER = "SELECT * FROM todo_list WHERE user_id = ?";
	    private static final String DELETE_TODO_SQL = "DELETE FROM todo_list WHERE todo_id = ?";
	    private static final String UPDATE_TODO_SQL = "UPDATE todo_list SET task_name = ?, task_description = ?, due_date = ?, status = ? WHERE todo_id = ?";
	    private static final String UPDATE_TODO_STATUS = "UPDATE todo_list SET status = ? WHERE todo_id = ?";
	    
	    
	public Connection getCon() throws SQLException {
		return HikariCPDataSource.getConnection();
	}
    public boolean insertTodoData(Todo todo)
    {
    	String sql = "INSERT INTO todo_list (user_id, task_name, task_description, due_date, status) "
                + "VALUES (?, ?, ?, ?, ?)";

     try (Connection connection = getCon();
          PreparedStatement statement = connection.prepareStatement(sql)) {
         
         // Set parameters for the SQL query
         statement.setObject(1, todo.getUserId());
         statement.setString(2, todo.getTaskName());
         statement.setString(3, todo.getTaskDescription());
         statement.setDate(4, new java.sql.Date(todo.getDueDate().getTime()));
         statement.setString(5, todo.getStatus());

         // Execute the insert operation
         int rowsInserted = statement.executeUpdate();
         if (rowsInserted > 0) {
        	 return true;
         }
    } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
     return false;
    }
    
    public List<Todo> getTodosByUserId(String userId) {
        String query = "SELECT * FROM todo_list WHERE user_id = ?";
        List<Todo> todoList = new ArrayList<>();

        try (Connection con = getCon(); PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setString(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Todo todo = new Todo();
                todo.setTodoId(rs.getInt("todo_id"));
                todo.setUserId(rs.getString("user_id"));
                todo.setTaskName(rs.getString("task_name"));
                todo.setTaskDescription(rs.getString("task_description"));
                todo.setDueDate(rs.getDate("due_date"));
                todo.setStatus(rs.getString("status"));

                todoList.add(todo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return todoList;
    }
    
    public Todo getTodoById(int todoId) {
        Todo todo = null;
        try (Connection connection = getCon();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TODO_BY_ID)) {
            preparedStatement.setInt(1, todoId);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                String taskName = rs.getString("task_name");
                String taskDescription = rs.getString("task_description");
                Date dueDate = rs.getDate("due_date");
                String status = rs.getString("status");
                
                todo = new Todo();
                todo.setTodoId(todoId);
                todo.setUserId(String.valueOf(userId));
                todo.setTaskName(taskName);
                todo.setTaskDescription(taskDescription);
                todo.setDueDate(dueDate);
                todo.setStatus(status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return todo;
    }
    
    public boolean deleteTodo(int todoId) {
        boolean rowDeleted = false;
        try (Connection connection = getCon();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_TODO_SQL)) {
            preparedStatement.setInt(1, todoId);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
    
    public boolean updateTodo(Todo todo) {
        boolean rowUpdated = false;
        try (Connection connection = getCon();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TODO_SQL)) {
            preparedStatement.setString(1, todo.getTaskName());
            preparedStatement.setString(2, todo.getTaskDescription());
            
            if (todo.getDueDate() != null) {
                preparedStatement.setDate(3, java.sql.Date.valueOf(todo.getDueDate().toLocalDate()));
            } else {
                preparedStatement.setNull(3, java.sql.Types.DATE);
            }
            
            preparedStatement.setString(4, todo.getStatus());
            preparedStatement.setInt(5, todo.getTodoId());
            
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
    
    // Update Todo status only
    public boolean updateTodoStatus(int todoId, String status) {
        boolean rowUpdated = false;
        try (Connection connection = getCon();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TODO_STATUS)) {
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, todoId);
            
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
    
}
