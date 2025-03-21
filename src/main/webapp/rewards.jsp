<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.*, com.pojo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rewards</title>
    <style>
    /* Reset and base styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
    min-height: 100vh;
    padding: 0;
    margin: 0;
}

.container {
    margin-left: 70px;
    padding: 2rem;
    min-height: 100vh;
    transition: margin-left 0.3s ease;
}

.sidebar:hover + .container {
    margin-left: 250px;
}

h1 {
    text-align: center;
    color: #2c3e50;
    font-size: 2.5rem;
    margin-bottom: 3rem;
    padding: 1.5rem;
    background: rgba(255, 255, 255, 0.9);
    border-radius: 15px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Main rewards grid */
.rewards-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin-bottom: 3rem;
}

.reward-section {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    padding: 2rem;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
}

.reward-section:hover {
    transform: translateY(-5px);
}

.reward-section h2 {
    color: #2c3e50;
    font-size: 1.8rem;
    margin-bottom: 1.5rem;
    text-align: center;
    border-bottom: 2px solid #e0e0e0;
    padding-bottom: 1rem;
}

.reward-details {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 1rem 0;
    padding: 1rem;
    background: rgba(236, 240, 241, 0.6);
    border-radius: 10px;
    transition: transform 0.2s ease;
}

.reward-details:hover {
    transform: scale(1.02);
    background: rgba(236, 240, 241, 0.8);
}

.reward-text {
    font-weight: bold;
    color: #e74c3c;
}

.message {
    text-align: center;
    color: #7f8c8d;
    font-style: italic;
    margin-top: 1.5rem;
    padding: 1rem;
    background: rgba(236, 240, 241, 0.4);
    border-radius: 10px;
}

/* Additional features */
.rewards-progress {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    padding: 2rem;
    margin: 3rem 0;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.progress-bars {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 2rem;
    margin-top: 1.5rem;
}

.progress-item {
    padding: 1rem;
    background: rgba(236, 240, 241, 0.6);
    border-radius: 10px;
}

.progress-bar {
    height: 10px;
    background: #ecf0f1;
    border-radius: 5px;
    margin-top: 0.5rem;
    overflow: hidden;
}

.progress {
    height: 100%;
    border-radius: 5px;
    transition: width 0.3s ease;
}

.haircare .progress { background: linear-gradient(90deg, #3498db, #2980b9); }
.skincare .progress { background: linear-gradient(90deg, #e74c3c, #c0392b); }
.habits .progress { background: linear-gradient(90deg, #2ecc71, #27ae60); }

/* Achievements showcase */
.achievements-showcase {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    padding: 2rem;
    margin: 3rem 0;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.badges-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 1.5rem;
    margin-top: 1.5rem;
}

.badge-item {
    text-align: center;
    padding: 1.5rem;
    background: rgba(236, 240, 241, 0.6);
    border-radius: 15px;
    transition: transform 0.3s ease;
}

.badge-item:hover {
    transform: scale(1.05);
}

.badge-icon {
    font-size: 2.5rem;
    margin-bottom: 1rem;
}

.badge-name {
    font-weight: bold;
    color: #2c3e50;
}

.upcoming-rewards {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 20px;
    padding: 2rem;
    margin: 3rem 0;
    color: white;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.reward-cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
    margin-top: 1.5rem;
}

.reward-card {
    background: rgba(255, 255, 255, 0.1);
    padding: 1.5rem;
    border-radius: 15px;
    backdrop-filter: blur(5px);
    transition: transform 0.3s ease;
}

.reward-card:hover {
    transform: translateY(-5px);
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

    </style>
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    
</head>
<body>
<%   UserDetails user = (UserDetails) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp"); // Redirect to login if user is not found
    return;
} %>
    <aside class="sidebar">
        <div class="sidebar-header">
            <h2><a href="dashboard.jsp">Dashboard</a></h2>
        </div>
        <nav class="sidebar-nav">
            <ul>
                <li><a href="profile.jsp"><i class="fas fa-user"></i><span class="sidebar-text">Profile</span></a></li>
                <li><a href="routine.jsp"><i class="fas fa-calendar-day"></i><span class="sidebar-text">Your Daily Routine</span></a></li>
                <li><a href="skincare.jsp"><i class="fas fa-spa"></i><span class="sidebar-text">Skincare</span></a></li>
                <li><a href="haircare.jsp"><i class="fas fa-user-tie"></i><span class="sidebar-text">Haircare</span></a></li>
                <li><a href="habits.jsp"><i class="fas fa-heartbeat"></i><span class="sidebar-text">Track Your Habits</span></a></li>
                <li><a href="todo.jsp"><i class="fas fa-list"></i><span class="sidebar-text">Your To-Do List</span></a></li>
                <li><a href="streak.jsp"><i class="fas fa-fire"></i><span class="sidebar-text">Your Streak</span></a></li>
                <li><a href="rewards.jsp"><i class="fas fa-trophy"></i><span class="sidebar-text">Your Rewards</span></a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i><span class="sidebar-text">Logout</span></a></li>
            </ul>
        </nav>
    </aside>
<div class="container">
    <h1>🏆 Rewards 🏆</h1>

    <!-- Progress Tracking -->
<div class="rewards-progress">
    <h2>🎯 Your Progress</h2>
    <div class="progress-bars">
        <div class="progress-item haircare">
            <h3>Haircare Progress</h3>
            <div class="progress-bar">
                <div class="progress" style="width: 70%"></div>
            </div>
            <p>21/30 days to next reward</p>
        </div>
        <div class="progress-item skincare">
            <h3>Skincare Progress</h3>
            <div class="progress-bar">
                <div class="progress" style="width: 85%"></div>
            </div>
            <p>25/30 days to next reward</p>
        </div>
        <div class="progress-item habits">
            <h3>Habits Progress</h3>
            <div class="progress-bar">
                <div class="progress" style="width: 60%"></div>
            </div>
            <p>18/30 days to next reward</p>
        </div>
    </div>
</div>

<!-- Achievements Showcase -->
<div class="achievements-showcase">
    <h2>🏅 Your Earned Badges</h2>
    <div class="badges-grid">
        <div class="badge-item">
            <div class="badge-icon">🌟</div>
            <div class="badge-name">Early Bird</div>
            <p>Complete morning routine 7 days in a row</p>
        </div>
        <div class="badge-item">
            <div class="badge-icon">💫</div>
            <div class="badge-name">Consistency King</div>
            <p>30-day streak achieved</p>
        </div>
        <div class="badge-item">
            <div class="badge-icon">🎯</div>
            <div class="badge-name">Goal Getter</div>
            <p>Complete all daily tasks for a week</p>
        </div>
        <div class="badge-item">
            <div class="badge-icon">⭐</div>
            <div class="badge-name">Perfect Week</div>
            <p>7 days of perfect completion</p>
        </div>
    </div>
</div>

<!-- Upcoming Rewards -->
<div class="upcoming-rewards">

    <h2>✨ Coming Soon</h2>
    <div class="reward-cards">
        <div class="reward-card">
            <h3>🎁 45-Day Milestone</h3>
            <p>Unlock exclusive premium features and personalized recommendations</p>
        </div>
        <div class="reward-card">
            <h3>🎨 60-Day Achievement</h3>
            <p>Custom theme pack and animated progress trackers</p>
        </div>
        <div class="reward-card">
            <h3>👑 90-Day Master</h3>
            <p>Special recognition and premium routine planning tools</p>
        </div>
    </div>
</div>

    <!-- Haircare Rewards -->
    <div class="reward-section haircare">
        <h2>💇 Haircare Rewards</h2>
        <div class="reward-details">
            <span>🎖 7-Day Streak:</span>
            <span class="reward-text">"Healthy Hair" Badge</span>
        </div>
        <div class="reward-details">
            <span>📜 14-Day Streak:</span>
            <span class="reward-text">Exclusive Haircare PDF Guide</span>
        </div>
        <div class="reward-details">
            <span>🎨 30-Day Streak:</span>
            <span class="reward-text">Custom Haircare Routine Wallpaper</span>
        </div>
        <p class="message">"Your hair is thriving! Keep it up!"</p>
    </div>

    <!-- Skincare Rewards -->
    <div class="reward-section skincare">
        <h2>💆 Skincare Rewards</h2>
        <div class="reward-details">
            <span>🎖 7-Day Streak:</span>
            <span class="reward-text">"Glowing Skin" Badge</span>
        </div>
        <div class="reward-details">
            <span>📜 14-Day Streak:</span>
            <span class="reward-text">Personalized Skincare Tips</span>
        </div>
        <div class="reward-details">
            <span>🎨 30-Day Streak:</span>
            <span class="reward-text">Relaxing Skincare Journal (PDF)</span>
        </div>
        <p class="message">"Your skin is glowing! Keep the streak alive!"</p>
    </div>

    <!-- Habit Tracker Rewards -->
    <div class="reward-section habits">
        <h2>📅 Habit Tracker Rewards</h2>
        <div class="reward-details">
            <span>🎖 7-Day Streak:</span>
            <span class="reward-text">"Consistency Master" Badge</span>
        </div>
        <div class="reward-details">
            <span>📜 14-Day Streak:</span>
            <span class="reward-text">Daily Planner Template</span>
        </div>
        <div class="reward-details">
            <span>🎨 30-Day Streak:</span>
            <span class="reward-text">Printable Motivation Quotes</span>
        </div>
        <p class="message">"Your habits are shaping your success! Keep going!"</p>
    </div>

</div>

</body>
</html>
