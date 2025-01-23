package com.pojo;

import java.util.Date;

public class Todo {
    private int todoId;
    private String userId;
    private String taskName;
    private String taskDescription;
    private long dueDate;
    private String status;

    // Constructor
    public Todo(int todoId, String userId, String taskName, String taskDescription, long dueDate, String status) {
        this.todoId = todoId;
        this.userId = userId;
        this.taskName = taskName;
        this.taskDescription = taskDescription;
        this.dueDate = dueDate;
        this.status = status;
    }

    public Todo() {
		// TODO Auto-generated constructor stub
	}

	// Getters and Setters
    public int getTodoId() {
        return todoId;
    }

    public void setTodoId(int todoId) {
        this.todoId = todoId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    public long getDueDate() {
        return dueDate;
    }

    public void setDueDate(long l) {
        this.dueDate = l;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "TodoItem{" +
                "todoId=" + todoId +
                ", userId=" + userId +
                ", taskName='" + taskName + '\'' +
                ", taskDescription='" + taskDescription + '\'' +
                ", dueDate=" + dueDate +
                ", status=" + status +
                '}';
    }
}

