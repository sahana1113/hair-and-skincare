package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.config.HikariCPDataSource;
import com.pojo.HairDetails;
import com.pojo.Todo;

public class TodoDao {
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
         statement.setLong(4, todo.getDueDate());
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
}
