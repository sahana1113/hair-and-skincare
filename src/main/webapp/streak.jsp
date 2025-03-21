<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.sidebar:hover+.container {
	margin-left: 250px;
}

/* Sidebar Styles */
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

@media ( max-width : 768px) {
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
@
keyframes pulse { 0% {
	transform: scale(1);
}

50




%
{
transform




:




scale


(




1


.05




)


;
}
100




%
{
transform




:




scale


(




1




)


;
}
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

/* Challenge Styles */
.challenges-container {
	margin-top: 3rem;
}

.challenges-header {
	text-align: center;
	color: #2c3e50;
	font-size: 2.2rem;
	margin-bottom: 2rem;
	padding: 1rem;
	background: rgba(255, 255, 255, 0.9);
	border-radius: 15px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.challenge-categories {
	display: flex;
	justify-content: center;
	margin-bottom: 2rem;
}

.challenge-tab {
	padding: 0.8rem 1.5rem;
	background: rgba(255, 255, 255, 0.5);
	border-radius: 10px;
	margin: 0 0.5rem;
	cursor: pointer;
	transition: all 0.3s ease;
	font-weight: bold;
	color: #555;
}

.challenge-tab.active {
	background: #3498db;
	color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.challenge-tab:hover {
	transform: translateY(-3px);
}

.challenge-content {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
	gap: 1.5rem;
}

.challenge-card {
	background: white;
	border-radius: 15px;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.challenge-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.challenge-banner {
	height: 120px;
	position: relative;
	overflow: hidden;
}

.challenge-banner img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.challenge-banner .challenge-level {
	position: absolute;
	top: 10px;
	right: 10px;
	padding: 5px 10px;
	background: rgba(0, 0, 0, 0.7);
	color: white;
	border-radius: 20px;
	font-size: 0.8rem;
}

.challenge-info {
	padding: 1.5rem;
}

.challenge-info h3 {
	font-size: 1.3rem;
	margin-bottom: 0.5rem;
	color: #2c3e50;
}

.challenge-info p {
	color: #7f8c8d;
	font-size: 0.9rem;
	margin-bottom: 1rem;
}

.challenge-details {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 1rem;
	padding-top: 1rem;
	border-top: 1px solid #f1f1f1;
}

.challenge-progress {
	display: flex;
	align-items: center;
}

.progress-circle {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: #f1f1f1;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	color: #3498db;
	margin-right: 0.5rem;
}

.challenge-rewards {
	font-size: 0.9rem;
	color: #e74c3c;
}

.join-challenge {
	display: block;
	text-align: center;
	background: #3498db;
	color: white;
	padding: 0.8rem;
	border-radius: 5px;
	margin-top: 1rem;
	transition: background 0.3s ease;
}

.join-challenge:hover {
	background: #2980b9;
}

.challenge-filter {
	display: flex;
	justify-content: space-between;
	margin-bottom: 1.5rem;
	padding: 0 1rem;
}

.filter-options {
	display: flex;
}

.filter-option {
	margin-right: 1rem;
	padding: 0.5rem 1rem;
	background: rgba(255, 255, 255, 0.8);
	border-radius: 20px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.filter-option:hover {
	background: rgba(52, 152, 219, 0.1);
}

.filter-option.active {
	background: rgba(52, 152, 219, 0.2);
	color: #2980b9;
	font-weight: bold;
}

.filter-search {
	position: relative;
	width: 250px;
}

.filter-search input {
	width: 100%;
	padding: 0.6rem 1rem;
	border-radius: 20px;
	border: none;
	background: rgba(255, 255, 255, 0.8);
	outline: none;
	transition: all 0.3s ease;
}

.filter-search input:focus {
	background: white;
	box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.3);
}

.filter-search i {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #95a5a6;
}

/* Skincare specific styles */
.skincare-challenge {
	border-left: 4px solid #e74c3c;
}

/* Haircare specific styles */
.haircare-challenge {
	border-left: 4px solid #3498db;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
				<li><a href="${pageContext.request.contextPath}/logout" class="logout-btn"><i
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
					<span>🔥 Current Streak:</span> <span class="streak-value">7
						Days</span>
				</div>
				<div class="progress-bar">
					<div class="progress" style="width: 50%;"></div>
				</div>
				<div class="streak-details">
					<span>🏆 Best Streak:</span> <span class="streak-value">14
						Days</span>
				</div>
				<p class="message">"Keep up the good work! Your hair is thanking
					you!"</p>
			</div>

			<!-- Skincare Streak -->
			<div class="streak-section skincare">
				<h2>💆 Skincare Streak</h2>
				<div class="streak-details">
					<span>🔥 Current Streak:</span> <span class="streak-value">5
						Days</span>
				</div>
				<div class="progress-bar">
					<div class="progress" style="width: 50%;"></div>
				</div>
				<div class="streak-details">
					<span>🏆 Best Streak:</span> <span class="streak-value">10
						Days</span>
				</div>
				<p class="message">"Consistency is key! Your skin is glowing!"</p>
			</div>

			<!-- Habit Tracker Streak -->
			<div class="streak-section habits">
				<h2>📅 Habit Tracker Streak</h2>
				<div class="streak-details">
					<span>🔥 Current Streak:</span> <span class="streak-value">12
						Days</span>
				</div>
				<div class="progress-bar">
					<div class="progress" style="width: 80%;"></div>
				</div>
				<div class="streak-details">
					<span>🏆 Best Streak:</span> <span class="streak-value">20
						Days</span>
				</div>
				<p class="message">"Great job! Your daily habits are shaping
					your future!"</p>
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

			<!-- Challenges Section -->
			<div class="challenges-container">
				<h2 class="challenges-header">🏆 Skincare & Haircare Challenges</h2>

				<div class="challenge-categories">
					<div class="challenge-tab active" data-category="all">All
						Challenges</div>
					<div class="challenge-tab" data-category="skincare">Skincare</div>
					<div class="challenge-tab" data-category="haircare">Haircare</div>
				</div>

				<div class="challenge-filter">
					<div class="filter-options">
						<div class="filter-option active">All Levels</div>
						<div class="filter-option">Beginner</div>
						<div class="filter-option">Intermediate</div>
						<div class="filter-option">Advanced</div>
					</div>
					<div class="filter-search">
						<input type="text" placeholder="Search challenges..."> <i
							class="fas fa-search"></i>
					</div>
				</div>

				<div class="challenge-content">
					<!-- Skincare Challenge 1 -->
					<div class="challenge-card skincare-challenge"
						data-category="skincare">
						<div class="challenge-banner">
							<img
								src="images/hydration.jpg"
								alt="Hydration Challenge"> <span class="challenge-level">Beginner</span>
						</div>
						<div class="challenge-info">
							<h3>30-Day Hydration Challenge</h3>
							<p>Drink 8 glasses of water daily and follow a complete
								skincare routine for 30 days to improve your skin's hydration.</p>
							<div class="challenge-details">
								<div class="challenge-progress">
									<div class="progress-circle">12%</div>
									<span>4/30 days</span>
								</div>
								<div class="challenge-rewards">
									<i class="fas fa-award"></i> 500 points
								</div>
							</div>
							<a href="#" class="join-challenge">Continue Challenge</a>
						</div>
					</div>

					<!-- Haircare Challenge 1 -->
					<div class="challenge-card haircare-challenge"
						data-category="haircare">
						<div class="challenge-banner">
							<img
								src="https://images.unsplash.com/photo-1560707303-4e980ce876ad?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&h=120&q=80"
								alt="No Heat Challenge"> <span class="challenge-level">Intermediate</span>
						</div>
						<div class="challenge-info">
							<h3>14-Day No Heat Challenge</h3>
							<p>Give your hair a break from heat styling tools for 14 days
								and discover heat-free styling alternatives.</p>
							<div class="challenge-details">
								<div class="challenge-progress">
									<div class="progress-circle">50%</div>
									<span>7/14 days</span>
								</div>
								<div class="challenge-rewards">
									<i class="fas fa-award"></i> 300 points
								</div>
							</div>
							<a href="#" class="join-challenge">Continue Challenge</a>
						</div>
					</div>

					<!-- Skincare Challenge 2 -->
					<div class="challenge-card skincare-challenge"
						data-category="skincare">
						<div class="challenge-banner">
							<img src="images/realskin1.jpg" alt="Haircare"> <span class="challenge-level">Beginner</span>
						</div>
						<div class="challenge-info">
							<h3>21-Day Sunscreen Challenge</h3>
							<p>Apply sunscreen daily, even on cloudy days, to protect
								your skin from harmful UV rays and prevent premature aging.</p>
							<div class="challenge-details">
								<div class="challenge-progress">
									<div class="progress-circle">33%</div>
									<span>7/21 days</span>
								</div>
								<div class="challenge-rewards">
									<i class="fas fa-award"></i> 400 points
								</div>
							</div>
							<a href="#" class="join-challenge">Continue Challenge</a>
						</div>
					</div>

					<!-- Haircare Challenge 2 -->
					<div class="challenge-card haircare-challenge"
						data-category="haircare">
						<div class="challenge-banner">
							<img
								src="https://images.unsplash.com/photo-1527799820374-dcf8d9d4a388?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&h=120&q=80"
								alt="Deep Conditioning Challenge"><span
								class="challenge-level">Advanced</span>
						</div>
						<div class="challenge-info">
							<h3>4-Week Deep Conditioning</h3>
							<p>Use a deep conditioning hair mask once a week for 4 weeks
								to revitalize damaged hair and restore shine.</p>
							<div class="challenge-details">
								<div class="challenge-progress">
									<div class="progress-circle">25%</div>
									<span>1/4 weeks</span>
								</div>
								<div class="challenge-rewards">
									<i class="fas fa-award"></i> 350 points
								</div>
							</div>
							<a href="#" class="join-challenge">Join Challenge</a>
						</div>
					</div>
				</div>
			</div>

			<script>
  // JavaScript for challenge filtering
  document.addEventListener('DOMContentLoaded', function() {
    const challengeTabs = document.querySelectorAll('.challenge-tab');
    const challengeCards = document.querySelectorAll('.challenge-card');
    const filterOptions = document.querySelectorAll('.filter-option');
    const searchInput = document.querySelector('.filter-search input');
    
    // Tab filtering
    challengeTabs.forEach(tab => {
      tab.addEventListener('click', function() {
        // Remove active class from all tabs
        challengeTabs.forEach(t => t.classList.remove('active'));
        // Add active class to clicked tab
        this.classList.add('active');
        
        const category = this.getAttribute('data-category');
        
        // Show/hide challenge cards based on category
        challengeCards.forEach(card => {
          if (category === 'all' || card.getAttribute('data-category') === category) {
            card.style.display = 'block';
          } else {
            card.style.display = 'none';
          }
        });
      });
    });
    
    // Filter options
    filterOptions.forEach(option => {
      option.addEventListener('click', function() {
        filterOptions.forEach(o => o.classList.remove('active'));
        this.classList.add('active');
        // You can add actual filtering logic here
      });
    });
    
    // Search functionality
    searchInput.addEventListener('input', function() {
      const searchTerm = this.value.toLowerCase();
      
      challengeCards.forEach(card => {
        const title = card.querySelector('h3').textContent.toLowerCase();
        const description = card.querySelector('p').textContent.toLowerCase();
        
        if (title.includes(searchTerm) || description.includes(searchTerm)) {
          card.style.display = 'block';
        } else {
          card.style.display = 'none';
        }
      });
    });
  });
</script>
			<!-- Tips Section -->
			<div class="tips-section">
				<h2>💡 Daily Tips</h2>
				<div class="tips-carousel">

					<div class="tip-card">
						<h3>Don't Break the Chain</h3>
						<p>Visualize your streak as a chain of successful days. Your
							goal is to not break that chain.</p>
					</div>
					<div class="tip-card">
						<h3>Celebrate Small Wins</h3>
						<p>Acknowledge and celebrate each day you maintain your
							streak. Small wins lead to big results.</p>
						<div class="tip-card"
							style="background: rgba(255, 255, 255, 0.2);">
							<h3>"We are what we repeatedly do. Excellence, then, is not
								an act, but a habit."</h3>
							<p>- Aristotle</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
    // JavaScript for the tips carousel
    document.addEventListener('DOMContentLoaded', function() {
        const tipCards = document.querySelectorAll('.tip-card');
        let currentTip = 0;
        
        // Hide all tip cards except the first one
        for (let i = 1; i < tipCards.length; i++) {
            tipCards[i].style.display = 'none';
        }
        
        // Function to show the next tip
        function showNextTip() {
            tipCards[currentTip].style.display = 'none';
            currentTip = (currentTip + 1) % tipCards.length;
            tipCards[currentTip].style.display = 'block';
        }
        
        // Change tip every 5 seconds
        setInterval(showNextTip, 5000);
    });
    
    // Function to update the streak progress bars
    function updateProgressBars() {
        const progressBars = document.querySelectorAll('.progress');
        progressBars.forEach(bar => {
            const currentWidth = parseInt(bar.style.width);
            const randomIncrement = Math.floor(Math.random() * 5) + 1;
            if (currentWidth < 100) {
                bar.style.width = Math.min(currentWidth + randomIncrement, 100) + '%';
            } else {
                bar.style.width = '0%';
            }
        });
    }
    
    // Calculate remaining days for challenges
    function updateChallengeTimers() {
        const timers = document.querySelectorAll('.timer-value');
        timers.forEach(timer => {
            let days = parseInt(timer.textContent);
            if (days > 0) {
                days--;
                timer.textContent = days + ' days';
            } else {
                timer.textContent = 'Completed!';
                timer.style.color = '#2ecc71';
            }
        });
    }
    
    // Update streak counters periodically for visual effect
    function pulseStreakValues() {
        const streakValues = document.querySelectorAll('.streak-value');
        streakValues.forEach(value => {
            value.style.animation = 'none';
            setTimeout(() => {
                value.style.animation = 'pulse 2s infinite';
            }, 10);
        });
    }
    
    // Call these functions periodically for interactive effects
    setInterval(pulseStreakValues, 10000);
    
    // Add event listeners for challenge cards
    const challengeCards = document.querySelectorAll('.challenge-card');
    challengeCards.forEach(card => {
        card.addEventListener('click', function() {
            // Here you would typically redirect to a detailed challenge page
            // For now, we'll just add a visual effect
            this.style.transform = 'scale(1.05)';
            setTimeout(() => {
                this.style.transform = '';
            }, 300);
        });
    });
</script>
</body>
</html>