<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Skincare & Haircare App</title>
    <style>
/* Global Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    color: #444;
    line-height: 1.6;
    display: flex;
    min-height: 100vh;
    background: url('images/dashboard03.jpg') no-repeat center center fixed;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

a {
    text-decoration: none;
    color: #444;
}

button {
    cursor: pointer;
    padding: 10px 20px;
    font-size: 14px;
    background-color: #f4b8c7; /* Soft pink */
    color: #fff;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

button:hover {
    background-color: #f79eb6;
    transform: scale(1.05);
}

/* Profile Photo Styles */
.profile-photo {
    text-align: center;
    margin-bottom: 20px;
}

.profile-photo img {
    width: 220px;
    height: 220px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #f7d7e4;
}

.profile-photo input[type="file"] {
    display: none;
}

.profile-photo h2 {
    margin-top: 10px;
    font-size: 1.8rem;
    color: #6a6a8a;
}

.motivational-quote {
    margin-top: 10px;
    font-size: 1.2rem;
    color: #798899;
    font-style: italic;
}

.update-btn {
    background-color: #8ac6d1; /* Muted pastel teal */
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 1rem;
    font-weight: bold;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.update-btn:hover {
    background-color: #68b2c1;
    transform: scale(1.05);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* Sidebar Styles */
.sidebar {
    width: 70px;
    background-color: #f2b4d3; /* Slightly darker pastel pink */
    color: #5a5a5a;
    padding: 20px 10px;
    position: fixed;
    height: 100%;
    top: 0;
    left: 0;
    transition: width 0.3s ease;
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
    color: #5a5a5a;
    font-size: 1.5rem;
    padding: 10px;
    display: flex;
    align-items: center;
    transition: background-color 0.3s ease, padding-left 0.3s ease;
}

.sidebar-nav li a:hover {
    background-color: #e8c4d8;
}

.sidebar-nav li a i {
    margin-right: 10px;
}

.sidebar-nav li a .sidebar-text {
    display: none;
    margin-left: 10px;
    font-size: 1rem;
}

.sidebar:hover {
    width: 250px;
}

.sidebar:hover .sidebar-nav li a .sidebar-text {
    display: inline;
}

.logout-btn {
    margin-top: 30px;
    background-color: #e74c3c;
    color: white;
    text-align: center;
    padding: 10px;
    border-radius: 5px;
    transition: transform 0.3s ease;
}

.logout-btn:hover {
    background-color: #c0392b;
    transform: scale(1.1);
}

/* Main Content Styles */
.content {
    margin-left: 80px;
    padding: 20px;
    width: 100%;
    transition: margin-left 0.3s ease;
}

.sidebar:hover ~ .content {
    margin-left: 250px;
}

.header {
    text-align: center;
    margin-bottom: 20px;
}

.main-content {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

/* Section Styles */
section {
    background-color: rgba(255, 255, 255, 0.8);
    color: #4a4a4a;
    border-radius: 8px;
    padding: 50px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

h2 {
    font-size: 1.5rem;
    margin-bottom: 10px;
}

.routine-tasks ul {
    list-style: none;
    padding: 0;
}

.routine-tasks li {
    margin: 10px 0;
    display: flex;
    align-items: center;
}

.routine-tasks input[type="checkbox"] {
    appearance: none;
    width: 20px;
    height: 20px;
    border: 2px solid #f4b8c7;
    border-radius: 4px;
    margin-right: 10px;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.routine-tasks input[type="checkbox"]:checked {
    background-color: #f79eb6;
    transform: scale(1.1);
}

.routine-tasks input[type="checkbox"]:focus {
    outline: none;
    box-shadow: 0 0 5px #f79eb6;
}

/* Smooth Transitions */
* {
    transition: all 0.3s ease;
}

    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="script.js"></script>
</head>
<body>
    <!-- Sidebar Section -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <h2>Dashboard</h2>
        </div>
        <nav class="sidebar-nav">
            <ul>
                <li><a href="#profile"><i class="fas fa-user"></i><span class="sidebar-text">Profile & Goals</span></a></li>
                <li><a href="#routine"><i class="fas fa-calendar-day"></i><span class="sidebar-text">Your Daily Routine</span></a></li>
                <li><a href="#skincare"><i class="fas fa-spa"></i><span class="sidebar-text">Skincare</span></a></li>
                <li><a href="#haircare"><i class="fas fa-user-tie"></i><span class="sidebar-text">Haircare</span></a></li>
                <li><a href="#habits"><i class="fas fa-heartbeat"></i><span class="sidebar-text">Track Your Habits</span></a></li>
                <li><a href="#todo"><i class="fas fa-list"></i><span class="sidebar-text">Your To-Do List</span></a></li>
                <li><a href="#streak"><i class="fas fa-fire"></i><span class="sidebar-text">Your Streak</span></a></li>
                <li><a href="#rewards"><i class="fas fa-trophy"></i><span class="sidebar-text">Your Rewards</span></a></li>
                <li><a href="#logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i><span class="sidebar-text">Logout</span></a></li>
            </ul>
        </nav>
    </aside>

    <!-- Main Content Section -->
    <div class="content">
        <main class="main-content">
            <!-- Profile Section -->
            <section id="profile" class="profile-goals">
                <div class="profile-photo">
                    <img src="images/girluser1.jpg" alt="Profile Picture">
                    <h2>Welcome, [User Name]!</h2>
                    <p class="motivational-quote">"Small steps every day lead to big changes tomorrow. Glow, grow, and thrive in every way."</p>
                    <button class="update-btn" onclick="openModal()">Revise Profile</button>
                </div>
            </section>

            <!-- Daily Routine Section -->
            <section id="routine" class="routine-overview">
                <h2>Your Daily Routine</h2>
                <div class="routine-tasks">
                    <h3>Skincare Routine:</h3>
                    <div class="custom-checkbox">
                        <input type="checkbox" id="morning-skincare">
                        <label for="morning-skincare">Morning Skincare</label>
                    </div>
                    <div class="custom-checkbox">
                        <input type="checkbox" id="night-skincare">
                        <label for="night-skincare">Night Skincare</label>
                    </div>
                </div>
                <div class="routine-tasks">
                    <h3>Haircare Routine:</h3>
                    <div class="custom-checkbox">
                        <input type="checkbox" id="haircare">
                        <label for="haircare">Haircare Routine</label>
                    </div>
                </div>
                <button class="generate-recommendations" onclick="generateSkincareRecommendations()">Generate Skincare Recommendations</button>
                <button class="generate-recommendations" onclick="generateHaircareRecommendations()">Generate Haircare Recommendations</button>
            </section>

            <!-- Habits Tracker Section -->
            <section id="habits" class="habits-tracker">
                <h2>Track Your Habits</h2>
                <div class="custom-checkbox">
                    <input type="checkbox" id="water-intake">
                    <label for="water-intake">Drink 8 glasses of water</label>
                </div>
                <div class="custom-checkbox">
                    <input type="checkbox" id="sleep">
                    <label for="sleep">Sleep 8 hours</label>
                </div>
                <div class="custom-checkbox">
                    <input type="checkbox" id="exercise">
                    <label for="exercise">Exercise</label>
                </div>
            </section>

            <!-- To-Do List Section -->
            <section id="todo" class="to-do-list">
                <h2>Your To-Do List</h2>
                <div class="custom-checkbox">
                    <input type="checkbox" id="buy-shampoo">
                    <label for="buy-shampoo">Buy New Shampoo</label>
                </div>
                <div class="custom-checkbox">
                    <input type="checkbox" id="consult-dermatologist">
                    <label for="consult-dermatologist">Consult Dermatologist</label>
                </div>
            </section>

            <!-- Streak Tracker Section -->
            <section id="streak" class="streak-tracker">
                <h2>Your Streak</h2>
                <p>Current Streak: <span id="current-streak">5</span> days</p>
                <p>Milestone Achieved: 30-Day Streak!</p>
            </section>

            <!-- Rewards Section -->
            <section id="rewards" class="rewards">
                <h2>Your Rewards</h2>
                <div class="reward">
                    <p>Earned: Skincare Tips Badge</p>
                </div>
                <div class="reward">
                    <p>Earned: Haircare Expert Badge</p>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
