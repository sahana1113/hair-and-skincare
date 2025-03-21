<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.dao.*, com.pojo.*" %>
<%@ page import=" javax.servlet.*, javax.servlet.http.*, java.time.*, java.sql.Date ,java.util.List, java.util.ArrayList"%>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do List</title>
    <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
 body {
    height: 100%;
    width: 100%;
    overflow-x: hidden;
    background-color: #f3e9f1;
   font-size:25px;
}

.container {
    margin-left: 90px;
    min-height: 100vh;
    padding: 30px;
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: auto 1fr auto;
    gap: 20px;
    
}

.page-header {
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    margin-bottom: 20px;
}

.page-header h2 {
    color: #5d4e6d;
    font-size: 2rem;
    margin-bottom: 10px;
}

.todo-sections {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    margin-bottom: 20px;
    font-size:25px;
}

.todo-section {
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.section-header {
    color: #7c6990;
    font-size: 1.2rem;
    margin-bottom: 15px;
    padding-bottom: 10px;
    border-bottom: 2px solid #e0c1f4;
}

.todo-item {
    background: #f8f3fa;
    margin: 10px 0;
    padding: 15px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    transition: transform 0.2s ease;
}

.todo-item:hover {
    transform: translateX(5px);
}

.todo-item label {
    display: flex;
    align-items: center;
    color: #5d4e6d;
    font-size: 1rem;
    cursor: pointer;
    width: 100%;
}

.checkbox {
    appearance: none;
    width: 20px;
    height: 20px;
    border: 2px solid #e0c1f4;
    border-radius: 6px;
    margin-right: 15px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.checkbox:checked {
    background-color: #c9a0dc;
    border-color: #c9a0dc;
    position: relative;
}

.checkbox:checked::after {
    content: '✓';
    position: absolute;
    color: white;
    font-size: 14px;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}

.checkbox:checked + span {
    text-decoration: line-through;
    color: #a094ab;
}

.add-todo {
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    margin-top: 20px;
}

.add-todo-form {
    display: flex;
    gap: 10px;
}

.add-todo input[type="text"] {
    flex: 1;
    padding: 12px;
    border: 2px solid #e0c1f4;
    border-radius: 10px;
    font-size: 1rem;
    color: #5d4e6d;
}

.add-todo input[type="text"]:focus {
    outline: none;
    border-color: #c9a0dc;
}

.add-btn {
    padding: 12px 24px;
    background: #c9a0dc;
    border: none;
    border-radius: 10px;
    color: white;
    cursor: pointer;
    transition: background 0.3s ease;
}

.add-btn:hover {
    background: #b78ed0;
}

.todo-summary {
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    margin-top: 20px;
}

.summary-stats {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    text-align: center;
}

.stat-item {
    padding: 15px;
    background: #f8f3fa;
    border-radius: 10px;
}

.stat-number {
    font-size: 2rem;
    color: #7c6990;
    font-weight: bold;
}

.stat-label {
    color: #5d4e6d;
    margin-top: 5px;
}


.sidebar {
    width: 70px; /* Initially narrow */
    background-color: rgba(49,85,100,0.9); /* Darker shade of blue */
    color: #ffffff; /* White text for better contrast */
    padding: 20px 10px;
    position: fixed;
    height: 100%;
    top: 0;
    left: 0;
    transition: width 0.3s ease; /* Smooth transition for width */
    overflow: hidden;
    z-index: 100;
}

.sidebar-header {
    text-align: center;
    padding: 20px;
    font-size: 1.8rem;
    opacity: 0;
    transition: opacity 0.3s ease;
}
.sidebar-header a {
    text-decoration: none;
    color:white;
}

.sidebar:hover .sidebar-header {
    opacity: 1;
}

.sidebar-nav ul {
    list-style: none;
    margin-top: 20px;
}

.sidebar-nav li {
    margin: 20px 0;
}

.sidebar-nav li a {
    color: #ffffff; /* White text color */
    font-size: 1.5rem;
    padding: 10px;
    display: flex;
    align-items: center;
    transition: background-color 0.3s ease, padding-left 0.3s ease;
}

/* Icons */
.sidebar-nav li a i {
    margin-right: 10px;
}

.sidebar-nav li a .sidebar-text {
    display: none;
    margin-left: 10px;
    font-size: 1rem;
}

.sidebar:hover {
    width: 250px; /* Expands on hover */
    background-color: #2e4c5a; /* Darker shade on hover */
}

.sidebar:hover .sidebar-nav li a .sidebar-text {
    display: inline; /* Show text when hovered */
}

.sidebar-nav li a:hover {
    padding-left: 20px; /* Smooth padding effect */
    background-color: #87c9c8; /* Lighter shade of blue on hover */
    color: black; /* Ensure text remains white on hover */
}

.sidebar-nav li a:hover .sidebar-text {
    display: inline; /* Ensure text is shown on hover */
}

.logout-btn {
    margin-top: 30px;
    background-color: #e74c3c;
    color: white;
    text-align: center;
    padding: 10px;
    border-radius: 5px;
}

.logout-btn:hover {
    background-color: #c0392b;
}
.sidebar h2 {
    color: #856c6c;
    margin-bottom: 20px;
    font-size: 1.8rem;
    border-bottom: 2px solid #f3d7d7;
    padding-bottom: 10px;
}

a {
    text-decoration: none;
    color: #444;
}
.container {
    margin-left: 80px;
    flex-grow: 1;
    padding: 20px;
    transition: margin-left 0.3s ease;
}

.sidebar:hover ~ .container {
    margin-left: 250px;
}

/* Modal styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 60%;
    max-width: 500px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    color: #5d4e6d;
    font-size: 1rem;
}

.form-group input[type="text"],
.form-group input[type="date"],
.form-group textarea,
.form-group select {
    width: 100%;
    padding: 10px;
    border: 2px solid #e0c1f4;
    border-radius: 8px;
    font-size: 1rem;
}

.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus {
    outline: none;
    border-color: #c9a0dc;
}

.form-group textarea {
    height: 100px;
    resize: vertical;
}

.modal-form-btn {
    padding: 12px 24px;
    background: #c9a0dc;
    border: none;
    border-radius: 10px;
    color: white;
    cursor: pointer;
    transition: background 0.3s ease;
    font-size: 1rem;
    margin-top: 10px;
}

.modal-form-btn:hover {
    background: #b78ed0;
}

.empty-list {
    text-align: center;
    padding: 30px;
    background: #f8f3fa;
    border-radius: 10px;
    color: #7c6990;
}

.empty-list i {
    font-size: 3rem;
    margin-bottom: 10px;
    color: #c9a0dc;
}

.empty-list p {
    font-size: 1.2rem;
    margin-bottom: 20px;
}

.todo-item .task-details {
    display: flex;
    justify-content: space-between;
    width: 100%;
    align-items: center;
}

.todo-item .task-info {
    flex-grow: 1;
}

.todo-item .task-meta {
    font-size: 0.8rem;
    color: #7c6990;
    margin-top: 5px;
}

.todo-item .task-actions {
    display: flex;
    gap: 10px;
}

.action-btn {
    background: none;
    border: none;
    cursor: pointer;
    color: #7c6990;
    font-size: 1rem;
    transition: color 0.3s ease;
}

.action-btn:hover {
    color: #5d4e6d;
}

.todo-item.completed {
    background-color: #f0f8f0;
    border-left: 4px solid #7cc07c;
}

.todo-item.overdue {
    background-color: #fff0f0;
    border-left: 4px solid #e08080;
}

.status-indicator {
    display: inline-block;
    width: 10px;
    height: 10px;
    border-radius: 50%;
    margin-right: 5px;
}

.status-pending {
    background-color: #ffc107;
}

.status-completed {
    background-color: #28a745;
}

.status-overdue {
    background-color: #dc3545;
}
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<aside class="sidebar">
    <div class="sidebar-header">
        <h2>
            <a href="dashboard.jsp">Dashboard</a>
        </h2>
    </div>
    <nav class="sidebar-nav">
        <ul>
            <li><a href="profile.jsp"><i class="fas fa-user"></i><span
                    class="sidebar-text">Profile</span></a></li>
            <li><a href="routine.jsp"><i class="fas fa-calendar-day"></i><span
                    class="sidebar-text">Your Daily Routine</span></a></li>
            <li><a href="skincare.jsp"><i class="fas fa-spa"></i></i><span
                    class="sidebar-text">Skincare</span></a></li>
            <li><a href="haircare.jsp"><i class="fas fa-user-tie"></i><span
                    class="sidebar-text">Haircare</span></a></li>
            <li><a href="habits.jsp"><i class="fas fa-heartbeat"></i><span
                    class="sidebar-text">Track Your Habits</span></a></li>
            <li><a href="todo.jsp"><i class="fas fa-list"></i><span
                    class="sidebar-text">Your To-Do List</span></a></li>
            <li><a href="streak.jsp"><i class="fas fa-fire"></i><span
                    class="sidebar-text">Your Streak</span></a></li>
            <li><a href="rewards.jsp"><i class="fas fa-trophy"></i><span
                    class="sidebar-text">Your Rewards</span></a></li>
            <li><a href="/logout" class="logout-btn"><i
                    class="fas fa-sign-out-alt"></i><span class="sidebar-text">Logout</span></a></li>
        </ul>
    </nav>
</aside>

<%
    UserDetails user = (UserDetails) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if user is not found
        return;
    }
    String userId = (String) session.getAttribute("user_id");
    TodoDao dao = new TodoDao();
    List<Todo> todos = dao.getTodosByUserId(userId);
    
    // Get current date
    LocalDate today = LocalDate.now();
    
    // Filter tasks for today and upcoming
    List<Todo> todayTasks = new ArrayList<>();
    List<Todo> upcomingTasks = new ArrayList<>();
    
    for (Todo todo : todos) {
        // Assuming your Todo class has a method to get due date as java.time.LocalDate
        // If it's a string or java.util.Date, you'll need to convert it
        LocalDate dueDate = null;
        if (todo.getDueDate() != null) {
            // Convert your date format to LocalDate
            // This is an example assuming getDueDate() returns java.sql.Date
            dueDate = todo.getDueDate().toLocalDate();
        }
        
        if (dueDate == null || dueDate.equals(today)) {
            todayTasks.add(todo);
        } else if (dueDate.isAfter(today)) {
            upcomingTasks.add(todo);
        }
    }
    
    // Count completed tasks
    int totalTasks = todos.size();
    int completedTasks = 0;
    for (Todo todo : todos) {
        if ("Completed".equals(todo.getStatus())) {
            completedTasks++;
        }
    }
    int pendingTasks = totalTasks - completedTasks;
%>

<div class="container">
    <div class="page-header">
        <h2>To-Do List</h2>
        <p>Organize your tasks and boost productivity</p>
    </div>
    
    <div class="todo-sections">
        <div class="todo-section">
            <h3 class="section-header">Today's Tasks</h3>
            <% if (todayTasks.isEmpty()) { %>
                <div class="empty-list">
                    <i class="fas fa-clipboard-list"></i>
                    <p>No tasks for today. Add a new task to get started!</p>
                </div>
            <% } else { 
                for (Todo todo : todayTasks) {
                    String todoName = todo.getTaskName();
                    int todoId = todo.getTodoId();
                    String status = todo.getStatus();
                    String description = todo.getTaskDescription();
                    String statusClass = "Completed".equals(status) ? "completed" : 
                                         "Overdue".equals(status) ? "overdue" : "";
                    String statusIndicator = "Completed".equals(status) ? "status-completed" : 
                                             "Overdue".equals(status) ? "status-overdue" : "status-pending";
            %>
            <div class="todo-item <%= statusClass %>">
                <div class="task-details">
                    <div class="task-info">
                        <label>
                            <input type="checkbox" class="checkbox" data-id="<%= todoId %>" 
                                  <%= "Completed".equals(status) ? "checked" : "" %>>
                            <span><%= todoName %></span>
                        </label>
                        <% if (description != null && !description.isEmpty()) { %>
                            <div class="task-meta"><%= description %></div>
                        <% } %>
                        <div class="task-meta">
                            <span class="status-indicator <%= statusIndicator %>"></span>
                            <%= status %>
                        </div>
                    </div>
                    <div class="task-actions">
                        <button class="action-btn edit-btn" data-id="<%= todoId %>">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button class="action-btn delete-btn" data-id="<%= todoId %>">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </div>
                </div>
            </div>
            <% } 
            } %>
        </div>

        <div class="todo-section">
            <h3 class="section-header">Upcoming Tasks</h3>
            <% if (upcomingTasks.isEmpty()) { %>
                <div class="empty-list">
                    <i class="fas fa-calendar-plus"></i>
                    <p>No upcoming tasks. Plan ahead by adding tasks!</p>
                </div>
            <% } else { 
                for (Todo todo : upcomingTasks) {
                    String todoName = todo.getTaskName();
                    int todoId = todo.getTodoId();
                    String status = todo.getStatus();
                    String description = todo.getTaskDescription();
                    String dueDate = todo.getDueDate() != null ? todo.getDueDate().toString() : "";
                    String statusClass = "Completed".equals(status) ? "completed" : 
                                         "Overdue".equals(status) ? "overdue" : "";
                    String statusIndicator = "Completed".equals(status) ? "status-completed" : 
                                             "Overdue".equals(status) ? "status-overdue" : "status-pending";
            %>
            <div class="todo-item <%= statusClass %>">
                <div class="task-details">
                    <div class="task-info">
                        <label>
                            <input type="checkbox" class="checkbox" data-id="<%= todoId %>" 
                                  <%= "Completed".equals(status) ? "checked" : "" %>>
                            <span><%= todoName %></span>
                        </label>
                        <% if (description != null && !description.isEmpty()) { %>
                            <div class="task-meta"><%= description %></div>
                        <% } %>
                        <div class="task-meta">
                            <span class="status-indicator <%= statusIndicator %>"></span>
                            <%= status %> 
                            <% if (!dueDate.isEmpty()) { %>
                                - Due: <%= dueDate %>
                            <% } %>
                        </div>
                    </div>
                    <div class="task-actions">
                        <button class="action-btn edit-btn" data-id="<%= todoId %>">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button class="action-btn delete-btn" data-id="<%= todoId %>">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </div>
                </div>
            </div>
            <% } 
            } %>
        </div>
    </div>

    <div class="add-todo">
        <div class="add-todo-form">
            <input type="text" placeholder="Add a new task...">
            <button type="button" class="add-btn" id="openModalBtn">Add Task</button>
        </div>
    </div>

    <div class="todo-summary">
        <div class="summary-stats">
            <div class="stat-item">
                <div class="stat-number"><%= totalTasks %></div>
                <div class="stat-label">Total Tasks</div>
            </div>
            <div class="stat-item">
                <div class="stat-number"><%= completedTasks %></div>
                <div class="stat-label">Completed</div>
            </div>
            <div class="stat-item">
                <div class="stat-number"><%= pendingTasks %></div>
                <div class="stat-label">Pending</div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for adding new task -->
<div id="addTaskModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h3>Add New Task</h3>
        <form action="CreateTodoServlet" method="post">
            <div class="form-group">
                <label for="taskName">Task Name:</label>
                <input type="text" id="taskName" name="taskName" required>
            </div>
            
            <div class="form-group">
                <label for="taskDescription">Task Description:</label>
                <textarea id="taskDescription" name="taskDescription"></textarea>
            </div>
            
            <div class="form-group">
                <label for="dueDate">Due Date:</label>
                <input type="date" id="dueDate" name="dueDate">
            </div>
            
            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status" required>
                    <option value="Pending">Pending</option>
                    <option value="Completed">Completed</option>
                    <option value="Overdue">Overdue</option>
                </select>
            </div>
            
            <input type="hidden" name="userId" value="<%= userId %>">
            <button type="submit" class="modal-form-btn">Create To-Do</button>
        </form>
    </div>
</div>

<!-- Edit task modal -->
<div id="editTaskModal" class="modal">
    <div class="modal-content">
        <span class="close edit-close">&times;</span>
        <h3>Edit Task</h3>
        <form action="UpdateTodoServlet" method="post">
            <input type="hidden" id="editTodoId" name="todoId">
            
            <div class="form-group">
                <label for="editTaskName">Task Name:</label>
                <input type="text" id="editTaskName" name="taskName" required>
            </div>
            
            <div class="form-group">
                <label for="editTaskDescription">Task Description:</label>
                <textarea id="editTaskDescription" name="taskDescription"></textarea>
            </div>
            
            <div class="form-group">
                <label for="editDueDate">Due Date:</label>
                <input type="date" id="editDueDate" name="dueDate">
            </div>
            
            <div class="form-group">
                <label for="editStatus">Status:</label>
                <select id="editStatus" name="status" required>
                    <option value="Pending">Pending</option>
                    <option value="Completed">Completed</option>
                    <option value="Overdue">Overdue</option>
                </select>
            </div>
            
            <input type="hidden" name="userId" value="<%= userId %>">
            <button type="submit" class="modal-form-btn">Update Task</button>
        </form>
    </div>
</div>

<script>
    // Get the modals
    var addModal = document.getElementById("addTaskModal");
    var editModal = document.getElementById("editTaskModal");
    
    // Get the buttons that open the modals
    var addBtn = document.getElementById("openModalBtn");
    
    // Get the <span> elements that close the modals
    var addSpan = document.getElementsByClassName("close")[0];
    var editSpan = document.getElementsByClassName("edit-close")[0];
    
    // When the user clicks the button, open the modal 
    addBtn.onclick = function() {
        addModal.style.display = "block";
    }
    
    // When the user clicks on <span> (x), close the modal
    addSpan.onclick = function() {
        addModal.style.display = "none";
    }
    
    editSpan.onclick = function() {
        editModal.style.display = "none";
    }
    
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == addModal) {
            addModal.style.display = "none";
        }
        if (event.target == editModal) {
            editModal.style.display = "none";
        }
    }
    
    // Handle checkbox state changes for task completion
    document.querySelectorAll('.checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const todoId = this.getAttribute('data-id');
            const isCompleted = this.checked;
            
            // Send AJAX request to update task status
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'UpdateTodoStatusServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
                if (xhr.status === 200) {
                    // Refresh page to show updated stats
                    location.reload();
                }
            };
            xhr.send('todoId=' + todoId + '&status=' + (isCompleted ? 'Completed' : 'Pending'));
        });
    });
    
    // Handle edit button clicks
    document.querySelectorAll('.edit-btn').forEach(button => {
        button.addEventListener('click', function() {
            const todoId = this.getAttribute('data-id');
            
            // Send AJAX request to get task details
            const xhr = new XMLHttpRequest();
            xhr.open('GET', 'GetTodoServlet?todoId=' + todoId, true);
            xhr.onload = function() {
                if (xhr.status === 200) {
                    const todoData = JSON.parse(xhr.responseText);
                    
                    // Populate edit form
                    document.getElementById('editTodoId').value = todoData.todoId;
                    document.getElementById('editTaskName').value = todoData.taskName;
                    document.getElementById('editTaskDescription').value = todoData.taskDescription || '';
                    document.getElementById('editDueDate').value = todoData.dueDate || '';
                    document.getElementById('editStatus').value = todoData.status;
                    
                    // Show edit modal
                    editModal.style.display = "block";
                }
            };
            xhr.send();
        });
    });
    
    // Handle delete button clicks
    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function() {
            if (confirm('Are you sure you want to delete this task?')) {
                const todoId = this.getAttribute('data-id');
                
                // Send AJAX request to delete task
                const xhr = new XMLHttpRequest();
                xhr.open('POST', 'DeleteTodoServlet', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        // Refresh page to show updated task list
                        location.reload();
                    }
                };
                xhr.send('todoId=' + todoId);
            }
        });
    });
</script>
</body>
</html>