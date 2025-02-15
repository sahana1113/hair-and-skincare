<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Streak Tracker</title>
    <style>
    /* Reset and base styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    min-height: 100vh;
    padding: 0;
    margin: 0;
}
a {
    text-decoration: none;
    color: #444;
}

.container {
    margin-left: 70px; /* Match sidebar width */
    padding: 2rem;
    min-height: 100vh;
    transition: margin-left 0.3s ease;
}

/* When sidebar is hovered */
.sidebar:hover + .container {
    margin-left: 250px;
}

/* Sidebar Styles */
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

/* Sidebar expands on hover */
.sidebar:hover {
    width: 250px; /* Expands on hover */
    background-color: #2e4c5a; /* Darker shade on hover */
}

.sidebar:hover .sidebar-nav li a .sidebar-text {
    display: inline; /* Show text when hovered */
}

/* Hover effect on navigation links */
.sidebar-nav li a:hover {
    padding-left: 20px; /* Smooth padding effect */
    background-color: #87c9c8; /* Lighter shade of blue on hover */
    color: black; /* Ensure text remains white on hover */
}

.sidebar-nav li a:hover .sidebar-text {
    display: inline; /* Ensure text is shown on hover */
}

/* Logout Button */
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

h1 {
    text-align: center;
    color: #2c3e50;
    font-size: 2.5rem;
    margin-bottom: 3rem;
    padding: 1rem;
    background: rgba(255, 255, 255, 0.9);
    border-radius: 15px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.streak-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    padding: 1rem;
    margin-top: 2rem;
}

.streak-section {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    padding: 2rem;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 300px;
}

.streak-section:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
}

.streak-section h2 {
    color: #2c3e50;
    font-size: 1.8rem;
    margin-bottom: 1.5rem;
    text-align: center;
    border-bottom: 2px solid #e0e0e0;
    padding-bottom: 1rem;
}

.streak-details {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 1rem 0;
    padding: 1rem;
    background: rgba(236, 240, 241, 0.6);
    border-radius: 10px;
    font-size: 1.1rem;
}

.streak-value {
    font-weight: bold;
    color: #e74c3c;
    font-size: 1.2rem;
}

.message {
    text-align: center;
    color: #7f8c8d;
    font-style: italic;
    margin-top: auto;
    padding: 1rem;
    background: rgba(236, 240, 241, 0.4);
    border-radius: 10px;
}

.haircare {
    border-top: 5px solid #3498db;
}

.skincare {
    border-top: 5px solid #e74c3c;
}

.habits {
    border-top: 5px solid #2ecc71;
}

@media (max-width: 768px) {
    .container {
        margin-left: 70px;
        padding: 1rem;
    }
    
    .streak-section {
        min-height: 250px;
    }
    
    h1 {
        font-size: 2rem;
        margin-bottom: 2rem;
    }
}

/* Animation for streak values */
@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}

.streak-value {
    animation: pulse 2s infinite;
}

/* Progress indicators */
.progress-bar {
    height: 8px;
    background: #ecf0f1;
    border-radius: 4px;
    margin-top: 1rem;
    overflow: hidden;
}

.progress {
    height: 100%;
    background: linear-gradient(90deg, #f1c40f, #e74c3c);
    border-radius: 4px;
    transition: width 0.3s ease;
}
/* Previous styles remain the same */
/* ... (previous CSS content) ... */

.additional-features {
    margin-top: 3rem;
    padding: 2rem;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
}

.stat-card {
    background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
    padding: 1.5rem;
    border-radius: 15px;
    text-align: center;
    color: white;
    transition: transform 0.3s ease;
}

.stat-card:hover {
    transform: translateY(-5px);
}

.stat-card h3 {
    font-size: 1.2rem;
    margin-bottom: 0.5rem;
}

.stat-card .value {
    font-size: 2rem;
    font-weight: bold;
}

.achievements-section {
    margin-top: 2rem;
    padding: 2rem;
    background: rgba(236, 240, 241, 0.6);
    border-radius: 15px;
}

.achievements-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
    margin-top: 1rem;
}

.achievement-card {
    background: white;
    padding: 1rem;
    border-radius: 10px;
    text-align: center;
    transition: transform 0.3s ease;
    border: 2px solid transparent;
}

.achievement-card:hover {
    transform: scale(1.05);
    border-color: #3498db;
}

.achievement-card.locked {
    opacity: 0.7;
    filter: grayscale(1);
}

.achievement-icon {
    font-size: 2rem;
    margin-bottom: 0.5rem;
}

.streak-calendar {
    margin-top: 2rem;
    padding: 1rem;
    background: white;
    border-radius: 15px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.calendar-grid {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 0.5rem;
    margin-top: 1rem;
}

.calendar-day {
    aspect-ratio: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f5f6fa;
    border-radius: 8px;
    font-size: 0.9rem;
    transition: background-color 0.3s ease;
}

.calendar-day.completed {
    background: #2ecc71;
    color: white;
}

.calendar-day.missed {
    background: #e74c3c;
    color: white;
}

.tips-section {
    margin-top: 2rem;
    padding: 2rem;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 15px;
    color: white;
}

.tips-carousel {
    position: relative;
    padding: 1rem;
    text-align: center;
}

.tip-card {
    background: rgba(255, 255, 255, 0.1);
    padding: 1.5rem;
    border-radius: 10px;
    backdrop-filter: blur(5px);
    margin: 1rem 0;
}
.sidebar h2 {
            color: #856c6c;
            margin-bottom: 20px;
            font-size: 1.8rem;
            border-bottom: 2px solid #f3d7d7;
            padding-bottom: 10px;
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
				<li><a href="logout.jsp" class="logout-btn"><i
						class="fas fa-sign-out-alt"></i><span class="sidebar-text">Logout</span></a></li>
			</ul>
		</nav>
	</aside>
<div class="container">
    <h1>🔥 Streak Tracker 🔥</h1>
        <div class="streak-container">
    <!-- Haircare Streak -->
    <div class="streak-section haircare">
        <h2>💇 Haircare Streak</h2>
        <div class="streak-details">
            <span>🔥 Current Streak:</span>
            <span class="streak-value">7 Days</span>
        </div>
            <div class="progress-bar">
        <div class="progress" style="width: 50%;"></div>
    </div>
        <div class="streak-details">
            <span>🏆 Best Streak:</span>
            <span class="streak-value">14 Days</span>
        </div>
        <p class="message">"Keep up the good work! Your hair is thanking you!"</p>
    </div>

    <!-- Skincare Streak -->
    <div class="streak-section skincare">
        <h2>💆 Skincare Streak</h2>
        <div class="streak-details">
            <span>🔥 Current Streak:</span>
            <span class="streak-value">5 Days</span>
        </div>
            <div class="progress-bar">
        <div class="progress" style="width: 50%;"></div>
    </div>
        <div class="streak-details">
            <span>🏆 Best Streak:</span>
            <span class="streak-value">10 Days</span>
        </div>
        <p class="message">"Consistency is key! Your skin is glowing!"</p>
    </div>

    <!-- Habit Tracker Streak -->
    <div class="streak-section habits">
        <h2>📅 Habit Tracker Streak</h2>
        <div class="streak-details">
            <span>🔥 Current Streak:</span>
            <span class="streak-value">12 Days</span>
        </div>
            <div class="progress-bar">
        <div class="progress" style="width: 50%;"></div>
    </div>
        <div class="streak-details">
            <span>🏆 Best Streak:</span>
            <span class="streak-value">20 Days</span>
        </div>
        <p class="message">"Great job! Your daily habits are shaping your future!"</p>
    </div>
   </div>
   <div class="additional-features">
    <!-- Quick Stats -->
    <div class="stats-grid">
        <div class="stat-card">
            <h3>Total Days Active</h3>
            <div class="value">45</div>
        </div>
        <div class="stat-card">
            <h3>Habits Completed</h3>
            <div class="value">167</div>
        </div>
        <div class="stat-card">
            <h3>Current Points</h3>
            <div class="value">2,450</div>
        </div>
        <div class="stat-card">
            <h3>Achievement Rate</h3>
            <div class="value">89%</div>
        </div>
    </div>

    <!-- Achievements Section -->
    <div class="achievements-section">
        <h2>Recent Achievements</h2>
        <div class="achievements-grid">
            <div class="achievement-card">
                <div class="achievement-icon">🌟</div>
                <h3>Perfect Week</h3>
                <p>Complete all tasks for 7 days</p>
            </div>
            <div class="achievement-card">
                <div class="achievement-icon">💪</div>
                <h3>Habit Master</h3>
                <p>30-day streak on any habit</p>
            </div>
            <div class="achievement-card locked">
                <div class="achievement-icon">🎯</div>
                <h3>Goal Crusher</h3>
                <p>Complete 50 tasks</p>
            </div>
            <div class="achievement-card locked">
                <div class="achievement-icon">🏆</div>
                <h3>Champion</h3>
                <p>Maintain streak for 100 days</p>
            </div>
        </div>
    </div>

    <!-- Monthly Calendar -->
    <div class="streak-calendar">
        <h2>This Month's Progress</h2>
        <div class="calendar-grid">
            <!-- Generate 28-31 days dynamically in your JSP -->
            <div class="calendar-day completed">1</div>
            <div class="calendar-day completed">2</div>
            <div class="calendar-day completed">3</div>
            <div class="calendar-day missed">4</div>
            <div class="calendar-day completed">5</div>
            <!-- ... more days ... -->
        </div>
    </div>

    <!-- Tips Section -->
    <div class="tips-section">
        <h2>💡 Daily Tips</h2>
        <div class="tips-carousel">
            <div class="tip-card">
                <h3>Consistency is Key</h3>
                <p>Try to complete your routines at the same time each day to build stronger habits.</p>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>
