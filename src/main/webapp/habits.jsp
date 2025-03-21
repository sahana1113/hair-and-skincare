<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, javax.servlet.*, javax.servlet.http.*"%>
<%@ page import="com.dao.HabitDao, com.pojo.*"%>
<%@ page import="com.dao.HabitDao, com.pojo.Habits, com.pojo.HabitLog, com.pojo.HabitStreak, java.util.List, java.util.Map, java.util.Calendar, java.sql.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Habit Tracker</title>
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
	font-size: 20px;
}

.sidebar {
	width: 70px; /* Initially narrow */
	background-color: rgba(49, 85, 100, 0.9); /* Darker shade of blue */
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
	color: white;
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

/* Text hidden initially */
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

.container {
	margin-left: 90px;
	min-height: 100vh;
	padding: 30px;
	display: grid;
	grid-template-rows: auto 1fr auto;
	gap: 20px;
	max-width: none;
}

.page-header {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
	margin-bottom: 20px;
}

.page-header h2 {
	color: #5d4e6d;
	font-size: 2rem;
	margin-bottom: 10px;
}

.page-header p {
	color: #7c6990;
	font-size: 1.1rem;
}

.main-content {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 20px;
}

.habit-section {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.habit-table {
	width: 100%;
	margin: 0;
	background: transparent;
	box-shadow: none;
	padding: 0;
}

.habit-table th {
	padding: 15px;
	text-align: center;
	color: #7c6990;
	font-weight: 600;
	border-bottom: 2px solid #e0c1f4;
	font-size: 1.1rem;
}

.habit-table td {
	padding: 15px;
	text-align: center;
	color: #5d4e6d;
	border-bottom: 1px solid #f3e9f1;
}

.habit-table td:first-child {
	text-align: left;
	font-weight: 500;
	min-width: 200px;
}

.stats-section {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.stats-card {
	background: white;
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.stats-header {
	color: #5d4e6d;
	font-size: 1.2rem;
	margin-bottom: 15px;
	padding-bottom: 10px;
	border-bottom: 2px solid #e0c1f4;
}

.stat-item {
	display: flex;
	justify-content: space-between;
	padding: 10px 0;
	color: #7c6990;
}

.progress {
	margin: 0;
	background: white;
	padding: 25px;
	border-radius: 15px;
}

.progress h3 {
	color: #5d4e6d;
	margin-bottom: 15px;
	font-size: 1.2rem;
}


.reflection {
	margin: 0;
	background: white;
	padding: 100px 100px; /* Increased padding for more space */
	border-radius: 15px;
}

.reflection h3 {
	color: #5d4e6d;
	margin-bottom: 15px;
	font-size: 1.2rem;
}

.add-habit-btn {
	position: fixed;
	bottom: 30px;
	right: 30px;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	background: #c9a0dc;
	color: white;
	border: none;
	font-size: 24px;
	cursor: pointer;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

.add-habit-btn:hover {
	transform: scale(1.1);
}

.habits-overview {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
	gap: 15px;
	margin-top: 20px;
}

.overview-card {
	background: #f8f3fa;
	padding: 15px;
	border-radius: 10px;
	text-align: center;
}

.overview-number {
	font-size: 2rem;
	color: #c9a0dc;
	font-weight: bold;
}

.overview-label {
	color: #7c6990;
	margin-top: 5px;
	font-size: 0.9rem;
}

@media ( max-width : 1200px) {
	.main-content {
		grid-template-columns: 1fr;
	}
	.stats-section {
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	}
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

.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
}

.form-container {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff5e6;
	padding: 2rem;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	max-width: 500px;
	width: 90%;
}

.header {
	text-align: center;
	margin-bottom: 2rem;
}

.header img {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	margin-bottom: 1rem;
}

.header h1 {
	color: #315564;
	font-size: 1.8rem;
}

.form-group {
	margin-bottom: 1.5rem;
}

.form-group label {
	display: block;
	color: #315564;
	margin-bottom: 0.5rem;
}

.form-group input, .form-group textarea, .form-group select {
	width: 100%;
	padding: 0.8rem;
	border: 1px solid #90c9c8;
	border-radius: 5px;
	background-color: #fff;
}

.form-group textarea {
	height: 100px;
	resize: vertical;
}

button[type="submit"] {
	background-color: #90c9c8;
	color: white;
	padding: 1rem 2rem;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
	font-size: 1rem;
	transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
	background-color: #315564;
}

.close-btn {
	position: absolute;
	top: 1rem;
	right: 1rem;
	font-size: 1.5rem;
	color: #315564;
	cursor: pointer;
	background: none;
	border: none;
}

.reflection {
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
	margin-top: 20px;
}

.reflection h3 {
	color: #315564;
	margin-bottom: 15px;
	font-size: 1.2rem;
	padding-bottom: 10px;
	border-bottom: 2px solid #e0c1f4;;
}

.reflection textarea {
	width: 100%;
	height: 150px;
	padding: 15px;
	border: 1px solid #e0c1f4;;
	border-radius: 10px;
	background-color: #fff;
	resize: vertical;
	font-family: 'Poppins', sans-serif;
	font-size: 0.95rem;
	color: #315564;
	line-height: 1.5;
	margin-top: 10px;
}

.reflection textarea:focus {
	outline: none;
	border-color: #e0c1f4;;
	box-shadow: 0 0 5px rgba(245, 156, 170, 0.3);
}

.reflection textarea::placeholder {
	color: #e0c1f4;;
}

.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
}

.form-container {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 2rem;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	max-width: 500px;
	width: 90%;
}

.header {
	text-align: center;
	margin-bottom: 2rem;
}

.header img {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	margin-bottom: 1rem;
}

.header h1 {
	color: #5d4e6d;
	font-size: 1.8rem;
}

.form-group {
	margin-bottom: 1.5rem;
}

.form-group label {
	display: block;
	color: #5d4e6d;
	margin-bottom: 0.5rem;
}

.form-group input, .form-group textarea, .form-group select {
	width: 100%;
	padding: 0.8rem;
	border: 1px solid #e0c1f4;
	border-radius: 5px;
	background-color: #fff;
	color: #5d4e6d;
}

.form-group textarea {
	height: 100px;
	resize: vertical;
}

button[type="submit"] {
	background-color: #c9a0dc;
	color: white;
	padding: 1rem 2rem;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
	font-size: 1rem;
	transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
	background-color: #b78dcb;
}

.close-btn {
	position: absolute;
	top: 1rem;
	right: 1rem;
	font-size: 1.5rem;
	color: #5d4e6d;
	cursor: pointer;
	background: none;
	border: none;
}

/* Add styles for completed and skipped habits */
.completed {
	background-color: rgba(144, 238, 144, 0.5);
}

.skipped {
	background-color: rgba(255, 182, 193, 0.5);
}

.custom-checkbox {
	width: 20px;
	height: 20px;
	cursor: pointer;
}

/* Error message styles */
.error-message {
	color: #e74c3c;
	text-align: center;
	margin-bottom: 15px;
	padding: 10px;
	background-color: #fadbd8;
	border-radius: 5px;
}
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">
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
				<li><a href="${pageContext.request.contextPath}/logout"
					class="logout-btn"><i class="fas fa-sign-out-alt"></i><span
						class="sidebar-text">Logout</span></a></li>
			</ul>
		</nav>
	</aside>
  <div class="container">
        <div class="page-header">
            <h2>Habit Tracker</h2>
            <p>Track your daily habits and build a better routine</p>
        </div>

        <div class="main-content">
            <div class="habit-section">
                <table class="habit-table">
                    <thead>
                        <tr>
                            <th>Habit</th>
                            <th>Mon</th>
                            <th>Tue</th>
                            <th>Wed</th>
                            <th>Thu</th>
                            <th>Fri</th>
                            <th>Sat</th>
                            <th>Sun</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        // User validation
                        String userId = (String) session.getAttribute("user_id");
                        if (userId == null) {
                            response.sendRedirect("login.jsp");
                            return;
                        }
                        
                        try {
                            // Get current week dates
                            Calendar cal = Calendar.getInstance();
                            cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
                            Date startOfWeek = new Date(cal.getTimeInMillis());
                            
                            // Create array of week dates
                            Date[] weekDates = new Date[7];
                            for(int i = 0; i < 7; i++) {
                                weekDates[i] = new Date(cal.getTimeInMillis());
                                cal.add(Calendar.DAY_OF_MONTH, 1);
                            }
                            
                            // Get habits for user
                            HabitDao dao = new HabitDao();
                            List<Habits> habits = dao.getHabitsByUserId(userId);
                            
                            if(habits.isEmpty()) {
                                %>
                                <tr>
                                    <td colspan="8" class="no-habits">No habits found. Add a new habit to get started!</td>
                                </tr>
                                <%
                            } else {
                                for (Habits habit : habits) {
                                    String habitName = habit.getHabitName();
                                    int habitId = habit.getHabitId();
                                    
                                    // Get habit logs for this week
                                    List<HabitLog> habitLogs = dao.getHabitLogs(habitId, new java.sql.Date(startOfWeek.getTime()), new java.sql.Date((cal.getTimeInMillis())));
                                    
                                    // Create a map of completed dates
                                    Map<String, String> completedDates = new java.util.HashMap<>();
                                    for (HabitLog log : habitLogs) {
                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                        completedDates.put(sdf.format(log.getLogDate()), log.getStatus());
                                    }
                                    %>
                                    <tr class="habit-row" data-habit-id="<%= habitId %>">
                                        <td><%= habitName %></td>
                                        <%
                                        // Loop through days of the week
                                        for (int i = 0; i < 7; i++) {
                                            String dayOfWeek = "";
                                            switch(i) {
                                                case 0: dayOfWeek = "mon"; break;
                                                case 1: dayOfWeek = "tue"; break;
                                                case 2: dayOfWeek = "wed"; break;
                                                case 3: dayOfWeek = "thu"; break;
                                                case 4: dayOfWeek = "fri"; break;
                                                case 5: dayOfWeek = "sat"; break;
                                                case 6: dayOfWeek = "sun"; break;
                                            }
                                            
                                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                            String dateKey = sdf.format(weekDates[i]);
                                            boolean isCompleted = "Completed".equals(completedDates.get(dateKey));
                                            boolean isPast = weekDates[i].before(new Date(System.currentTimeMillis()));
                                            
                                            // Data attribute for tracking date
                                            String dateAttr = sdf.format(weekDates[i]);
                                            %>
                                            <td>
                                                <input type="checkbox" class="custom-checkbox" 
                                                    id="habit<%= habitId %>-<%= dayOfWeek %>" 
                                                    data-habit-id="<%= habitId %>" 
                                                    data-date="<%= dateAttr %>"
                                                    <%= isCompleted ? "checked" : "" %>
                                                    <%= isPast || isToday(weekDates[i]) ? "" : "disabled" %>>
                                            </td>
                                            <%
                                        }
                                        %>
                                    </tr>
                                    <%
                                }
                            }
                        } catch (Exception e) {
                            // Handle any exceptions
                            %>
                            <tr>
                                <td colspan="8" class="error-message">An error occurred while loading habits. Please try again later.</td>
                            </tr>
                            <%
                            e.printStackTrace();
                        }
                        %>
                    </tbody>
                </table>
                
                <%
                // Get weekly summary information
                HabitDao dao = new HabitDao();
                Map<String, Object> summary = dao.getWeeklySummary(Integer.parseInt(userId));
                
                // Default values in case of errors
                Object totalHabits = 0;
                Object completionRate = 0;
                Object longestStreak = 0;
                
                if (summary != null) {
                    totalHabits =  summary.getOrDefault("totalHabits", 0L);
                    completionRate =  summary.getOrDefault("completionRate", 0L);
                    longestStreak = summary.getOrDefault("longestStreak", 0L);
                }
                %>
                
                <div class="habits-overview">
                    <div class="overview-card">
                        <div class="overview-number"><%= totalHabits %></div>
                        <div class="overview-label">Active Habits</div>
                    </div>
                    <div class="overview-card">
                        <div class="overview-number"><%= completionRate %>%</div>
                        <div class="overview-label">Completion Rate</div>
                    </div>
                    <div class="overview-card">
                        <div class="overview-number"><%= longestStreak %></div>
                        <div class="overview-label">Day Streak</div>
                    </div>
                </div>
            </div>

            <div class="stats-section">
                <div class="stats-card">
                    <h3 class="stats-header">Weekly Summary</h3>
                    <div class="stat-item">
                        <span>Most Consistent</span>
                        <span><%= summary != null ? summary.getOrDefault("mostConsistent", "N/A") : "N/A" %></span>
                    </div>
                    <div class="stat-item">
                        <span>Needs Focus</span>
                        <span><%= summary != null ? summary.getOrDefault("needsFocus", "N/A") : "N/A" %></span>
                    </div>
                    <div class="stat-item">
                        <span>Best Day</span>
                        <span><%= summary != null ? summary.getOrDefault("bestDay", "N/A") : "N/A" %></span>
                    </div>
                </div>

                <!-- Streak Tracker and Progress Bar -->
                <div class="progress">
                    <h3>Weekly Progress</h3>
                    <div class="progress-bar">
                        <div class="streak" id="streak-progress" style="width: <%= completionRate %>%">
                            <span class="streak-text" id="streak-text">Streak: <%= longestStreak %> days</span>
                        </div>
                    </div>
                </div>

                <div class="reflection">
                    <h3>Weekly Reflection</h3>
                    <textarea placeholder="Write about your progress, challenges, or wins here..."></textarea>
                </div>
            </div>
        </div>
    </div>

    <button class="add-habit-btn" title="Add new habit">+</button>
    <div id="habitModal" class="modal">
        <section class="form-container">
            <button class="close-btn">&times;</button>
            <div class="header">
                <img src="images/habiticon.jpg" alt="Habit">
                <h1>Create New Habit</h1>
            </div>
            <form action="CreateHabitServlet" method="post">
                <div class="form-group">
                    <label for="habitName">Habit Name:</label>
                    <input type="text" id="habitName" name="habitName" required>
                </div>

                <div class="form-group">
                    <label for="habitDescription">Habit Description:</label>
                    <textarea id="habitDescription" name="habitDescription"></textarea>
                </div>

                <div class="form-group">
                    <label for="frequency">Frequency:</label>
                    <select id="frequency" name="frequency" required>
                        <option value="Daily">Daily</option>
                        <option value="Weekly">Weekly</option>
                        <option value="Custom">Custom</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" required>
                </div>

                <div class="form-group">
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate">
                </div>

                <button type="submit">Create Habit</button>
            </form>
        </section>
    </div>

    <script>
    // Get the modal
    const modal = document.getElementById('habitModal');
    const addHabitBtn = document.querySelector('.add-habit-btn');
    const closeBtn = document.querySelector('.close-btn');

    // Open modal when add habit button is clicked
    addHabitBtn.onclick = function() {
        modal.style.display = "block";
    }

    // Close modal when close button is clicked
    closeBtn.onclick = function() {
        modal.style.display = "none";
    }

    // Close modal when clicking outside
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // Set minimum date for start date as today
    document.getElementById('startDate').min = new Date().toISOString().split('T')[0];

    // Update end date minimum when start date changes
    document.getElementById('startDate').addEventListener('change', function() {
        document.getElementById('endDate').min = this.value;
    });

    // Handle checkbox clicks to log habit completion
    document.querySelectorAll('.custom-checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const habitId = this.getAttribute('data-habit-id');
            const date = this.getAttribute('data-date');
            const status = this.checked ? 'Completed' : 'Not Completed';
            
            // Send AJAX request to log habit completion
            fetch('LogHabitServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    'habitId': habitId,
                    'logDate': date,
                    'status': status
                }).toString()            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Update UI on success
                    updateStats();
                } else {
                    // Handle error
                    // Revert checkbox state
                    this.checked = !this.checked;
                }
            })
            .catch(error => {
                console.error('Error:', error);
                // Revert checkbox state
                this.checked = !this.checked;
            });
        });
    });

    // Function to update stats via AJAX
    function updateStats() {
        fetch('GetWeeklySummaryServlet')
        .then(response => response.json())
        .then(data => {
            // Update statistics
            document.querySelector('.overview-card:nth-child(1) .overview-number').textContent = data.totalHabits;
            document.querySelector('.overview-card:nth-child(2) .overview-number').textContent = data.completionRate + '%';
            document.querySelector('.overview-card:nth-child(3) .overview-number').textContent = data.longestStreak;
            
            // Update weekly summary
            document.querySelector('.stat-item:nth-child(1) span:nth-child(2)').textContent = data.mostConsistent || 'N/A';
            document.querySelector('.stat-item:nth-child(2) span:nth-child(2)').textContent = data.needsFocus || 'N/A';
            document.querySelector('.stat-item:nth-child(3) span:nth-child(2)').textContent = data.bestDay || 'N/A';
            
            // Update progress bar
            document.getElementById('streak-progress').style.width = data.completionRate + '%';
            document.getElementById('streak-text').textContent = 'Streak: ' + data.longestStreak + ' days';
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
    </script>
    
    <%!
    // Helper method to determine if a date is today
    private boolean isToday(Date date) {
        Calendar today = Calendar.getInstance();
        Calendar dateToCheck = Calendar.getInstance();
        dateToCheck.setTime(date);
        
        return today.get(Calendar.YEAR) == dateToCheck.get(Calendar.YEAR) &&
               today.get(Calendar.DAY_OF_YEAR) == dateToCheck.get(Calendar.DAY_OF_YEAR);
    }
    %>
</body>
</html>