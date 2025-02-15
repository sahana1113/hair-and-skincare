<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="com.dao.HabitDao, com.pojo.*" %>

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

html, body {
    height: 100%;
    width: 100%;
    overflow-x: hidden;
    background-color: #f3e9f1;
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

.progress-bar {
    height: 25px;
    margin: 10px 0;
}

.streak {
    background: linear-gradient(45deg, #c9a0dc, #e0c1f4);
}

.reflection {
    margin: 0;
    background: white;
    padding: 25px;
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

@media (max-width: 1200px) {
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
				<li><a href="logout.jsp" class="logout-btn"><i
						class="fas fa-sign-out-alt"></i><span class="sidebar-text">Logout</span></a></li>
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
                    // Retrieve habits from request
                    String userId = (String) session.getAttribute("user_id");
                    HabitDao dao=new HabitDao();
                    List<Habits> habits = dao.getHabitsByUserId(userId);
                    for (Habits habit : habits) {
                        String habitName = habit.getHabitName();
                        int habitId = habit.getHabitId();
                %>
                <tr class="habit-row">
                    <td><%= habitName %></td>
                    <td><input type="checkbox" class="custom-checkbox" class="custom-checkbox" id="habit<%= habitId %>-mon"></td>
                    <td><input type="checkbox" class="custom-checkbox" id="habit<%= habitId %>-tue"></td>
                    <td><input type="checkbox" class="custom-checkbox" id="habit<%= habitId %>-wed"></td>
                    <td><input type="checkbox" class="custom-checkbox" id="habit<%= habitId %>-thu"></td>
                    <td><input type="checkbox" class="custom-checkbox" id="habit<%= habitId %>-fri"></td>
                    <td><input type="checkbox" class="custom-checkbox" id="habit<%= habitId %>-sat"></td>
                    <td><input type="checkbox" class="custom-checkbox" id="habit<%= habitId %>-sun"></td>
                </tr>
                <% } %>
            </tbody>
        </table>
         <div class="habits-overview">
                <div class="overview-card">
                    <div class="overview-number">5</div>
                    <div class="overview-label">Active Habits</div>
                </div>
                <div class="overview-card">
                    <div class="overview-number">80%</div>
                    <div class="overview-label">Completion Rate</div>
                </div>
                <div class="overview-card">
                    <div class="overview-number">12</div>
                    <div class="overview-label">Day Streak</div>
                </div>
            </div>
        </div>

        <div class="stats-section">
            <div class="stats-card">
                <h3 class="stats-header">Weekly Summary</h3>
                <div class="stat-item">
                    <span>Most Consistent</span>
                    <span>Exercise</span>
                </div>
                <div class="stat-item">
                    <span>Needs Focus</span>
                    <span>Reading</span>
                </div>
                <div class="stat-item">
                    <span>Best Day</span>
                    <span>Monday</span>
                </div>
            </div>
            

        <!-- Streak Tracker and Progress Bar -->
  <div class="progress">
            <h3 style="color: #464B6A; margin-bottom: 10px;">Weekly Progress</h3>
            <div class="progress-bar">
                <div class="streak" id="streak-progress">
                    <span class="streak-text" id="streak-text">Streak: 0 days</span>
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
</div>

    <script>
        // Function to update streak and progress bar
        function updateStreak() {
            const habits = document.querySelectorAll('.habit-row');
            let totalStreak = 0;

            habits.forEach(habitRow => {
                let streak = 0;
                for (let day = 1; day <= 7; day++) {
                    const checkbox = habitRow.querySelector(`#habit-${day}`);
                    if (checkbox && checkbox.checked) {
                        streak++;
                    }
                }
                totalStreak += streak;
            });

            const streakPercentage = (totalStreak / (habits.length * 7)) * 100;
            document.getElementById('streak-progress').style.width = `${streakPercentage}%`;
            document.getElementById('streak-text').textContent = `Streak: ${totalStreak} days`;
        }

        // Event listeners to update streak on checkbox change
        document.querySelectorAll('input[type="checkbox"]').forEach(input => {
            input.addEventListener('change', updateStreak);
        });

        // Initial call to update streak
        updateStreak();
    </script>
</body>
</html>
