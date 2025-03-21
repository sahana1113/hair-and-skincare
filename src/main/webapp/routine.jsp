<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.pojo.*"%>
<%@ page import="com.utils.*"%>
<%@ page import="java.text.DecimalFormat"%>

<!-- Replace with your actual package path -->
<%@ page import="com.dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Personal Care Dashboard</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Arial', sans-serif;
	background: linear-gradient(135deg, #fff5e6, #f8f9d2);
	color: #315564;
	min-height: 100vh;
	display: flex;
	font-size: 20px;
}

a {
	text-decoration: none;
	color: #444;
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

.container {
	margin-left: 80px;
	flex-grow: 1;
	padding: 20px;
	transition: margin-left 0.3s ease;
}

.sidebar:hover ~ .container {
	margin-left: 250px;
}

.header {
	background-color: #90c9c8;
	padding: 20px;
	border-radius: 15px;
	margin-bottom: 20px;
	color: #315564;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	background-image: linear-gradient(to right, #90c9c8, #a1d2d0);
	position: relative;
	overflow: hidden;
}

.header::before {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	width: 100px;
	height: 100%;
	background-image:
		url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><path fill="%23ffffff20" d="M0 0 L100 0 L100 100 Z"/></svg>');
	background-size: cover;
}

.section-title {
	font-size: 1.8em;
	margin: 30px 0 20px 0;
	position: relative;
	padding-left: 15px;
	color: #315564;
}

.section-title::before {
	content: '';
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	width: 5px;
	height: 30px;
	background-color: #f59caa;
	border-radius: 3px;
}

.routines-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 20px;
	margin-bottom: 20px;
}

.routine-card {
	background: rgba(255, 255, 255, 0.9);
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	border-left: 5px solid #f59caa;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.routine-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
}

.skin-card {
	border-left: 5px solid #f59caa;
}

.hair-card {
	border-left: 5px solid #87c9c8;
}

.supplementary-info {
	display: grid;
	grid-template-columns: 1fr;
	gap: 20px;
	margin-top: 20px;
}

.info-card {
	background: rgba(255, 255, 255, 0.9);
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	border-left: 5px solid #90c9c8;
	transition: transform 0.3s ease;
}

.info-card:hover {
	transform: translateY(-3px);
}

.skin-info {
	border-left: 5px solid #f59caa;
}

.hair-info {
	border-left: 5px solid #87c9c8;
}

h1 {
	font-size: 2em;
	margin-bottom: 10px;
}

h2 {
	color: #315564;
	margin-bottom: 15px;
	font-size: 1.5em;
	display: flex;
	align-items: center;
}

h2 i {
	margin-right: 10px;
	color: #f59caa;
}

.hair-heading i {
	color: #87c9c8;
}

.sidebar h2 {
	color: #856c6c;
	margin-bottom: 20px;
	font-size: 1.8rem;
	border-bottom: 2px solid #f3d7d7;
	padding-bottom: 10px;
}

h3 {
	color: #f59caa;
	margin: 15px 0 10px 0;
}

.routine-list {
	list-style: none;
}

.routine-list li {
	padding: 8px 0;
	padding-left: 25px;
	position: relative;
	cursor: pointer;
	transition: color 0.3s ease, transform 0.2s ease;
}

.routine-list li:before {
	content: '•';
	color: #90c9c8;
	position: absolute;
	left: 10px;
	font-size: 1.2em;
}

.skin-list li:before {
	color: #f59caa;
}

.hair-list li:before {
	color: #87c9c8;
}

.routine-list li:hover {
	transform: translateX(5px);
}

.routine-list li.completed {
	color: #90c9c8;
	text-decoration: line-through;
}

.progress-bar {
	width: 100%;
	height: 8px;
	background: #f0f0f0;
	border-radius: 4px;
	margin-top: 10px;
	overflow: hidden;
}

.progress {
	height: 100%;
	background: linear-gradient(to right, #f59caa, #ffb8c6);
	width: 0%;
	transition: width 0.3s ease;
}

.skin-tag {
	background: #f59caa;
}

.hair-tag {
	background: #87c9c8;
}

.stats-container {
	background: #fff;
	border-radius: 15px;
	padding: 20px;
	margin: 20px 0;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 15px;
}

.stat-card {
	text-align: center;
	padding: 15px;
	background: rgba(144, 201, 200, 0.1);
	border-radius: 10px;
	transition: transform 0.3s ease;
}

.stat-card:hover {
	transform: translateY(-5px);
	background: rgba(144, 201, 200, 0.2);
}

.stat-number {
	font-size: 2em;
	color: #f59caa;
	margin: 5px 0;
}

.tab-container {
	margin: 30px 0;
}

.tab-buttons {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
}

.tab-button {
	padding: 10px 20px;
	background: #f0f0f0;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-size: 1em;
	transition: all 0.3s ease;
}

.tab-button.active {
	background: #90c9c8;
	color: white;
}

.tab-button:hover:not(.active) {
	background: #e0e0e0;
}

.skin-tab-button.active {
	background: #f59caa;
}

.hair-tab-button.active {
	background: #87c9c8;
}

.tab-content {
	display: none;
}

.tab-content.active {
	display: block;
	animation: fadeIn 0.5s ease;
}
/* Modal Styles */
.modal-container {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	justify-content: center;
	align-items: center;
}

.modal-content {
	background: white;
	border-radius: 15px;
	padding: 30px;
	width: 80%;
	max-width: 700px;
	max-height: 80vh;
	overflow-y: auto;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
	position: relative;
	animation: modalFadeIn 0.3s ease;
}

@
keyframes modalFadeIn {from { opacity:0;
	transform: translateY(-30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.close-button {
	position: absolute;
	top: 15px;
	right: 15px;
	font-size: 24px;
	cursor: pointer;
	color: #315564;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background: #f0f0f0;
	display: flex;
	justify-content: center;
	align-items: center;
	transition: all 0.2s ease;
}

.close-button:hover {
	background: #e0e0e0;
	transform: scale(1.1);
}

#modalTitle {
	color: #315564;
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 2px solid #f0f0f0;
	font-size: 1.5em;
}

.clickable-card {
	cursor: pointer;
	transition: all 0.3s ease;
}

.clickable-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.click-prompt {
	margin-top: 10px;
	color: #90c9c8;
	font-size: 0.9em;
	text-align: center;
	font-style: italic;
}

.skin-info .click-prompt {
	color: #f59caa;
}

.hair-info .click-prompt {
	color: #87c9c8;
}

/* Empty state styling */
.no-routine {
	color: #777;
	font-style: italic;
	padding: 15px 0 !important;
	text-align: center;
}

.no-routine a {
	color: #f59caa;
	text-decoration: underline;
	font-weight: 500;
}

.hair-list .no-routine a {
	color: #87c9c8;
}

/* For completely empty tab states */
.empty-tab-message {
	text-align: center;
	padding: 40px 20px;
	background: rgba(255, 255, 255, 0.9);
	border-radius: 15px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	margin: 20px 0;
}

.empty-tab-message i {
	font-size: 3em;
	color: #ddd;
	margin-bottom: 15px;
	display: block;
}

.empty-tab-message h3 {
	margin-bottom: 10px;
}

.empty-tab-message p {
	color: #777;
	margin-bottom: 20px;
}

.create-routine-btn {
	display: inline-block;
	background: #90c9c8;
	color: white;
	padding: 10px 20px;
	border-radius: 25px;
	font-weight: 500;
	transition: all 0.3s ease;
}

.create-routine-btn:hover {
	background: #7ab9b8;
	transform: translateY(-2px);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@media ( max-width : 768px) {
	.routines-grid {
		grid-template-columns: 1fr;
	}
	.stats-container {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 480px) {
	.stats-container {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>
	<%
	UserDetails user = (UserDetails) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	int userId = user.getUserId();

	double dailyTasksPercentage = RoutineStatsCalculator.calculateDailyTaskCompletion(userId);
	int currentStreak = RoutineStatsCalculator.calculateCurrentStreak(userId);
	int challengesCompleted = RoutineStatsCalculator.calculateChallengesCompleted(userId);
	double routineRating = RoutineStatsCalculator.calculateRoutineRating(userId);

	DecimalFormat df = new DecimalFormat("0.0");
	String formattedPercentage = df.format(dailyTasksPercentage);
	String formattedRating = df.format(routineRating);

	List<Routine> morningSkinRoutines = new ArrayList<>();
	List<Routine> eveningSkinRoutines = new ArrayList<>();
	List<Routine> weeklySkinRoutines = new ArrayList<>();
	List<Routine> generalSkinTips = new ArrayList<>();
	List<Routine> explanationSkin = new ArrayList<>();

	List<Routine> morningHairRoutines = new ArrayList<>();
	List<Routine> eveningHairRoutines = new ArrayList<>();
	List<Routine> weeklyHairRoutines = new ArrayList<>();
	List<Routine> generalHairTips = new ArrayList<>();
	List<Routine> explanationHair = new ArrayList<>();

	SkinDao skinDao = new SkinDao();
	List<Routine> skinRoutine = skinDao.getCurrentRoutinesByUserId(user.getUserId());

	if (skinRoutine != null && !skinRoutine.isEmpty()) {
		for (Routine routine : skinRoutine) {
		switch (routine.getOccurence()) {
        case "Morning":
            morningSkinRoutines.add(routine);
            break;
        case "Evening":
            eveningSkinRoutines.add(routine);
            break;
        case "Weekly":
            weeklySkinRoutines.add(routine);
            break;
        case "General Tips":
            generalSkinTips.add(routine);
            break;
        case "Explanation":
            explanationSkin.add(routine); 
            break;
        default:
            System.out.println("Unrecognized occurrence type: " + routine.getOccurence());
            break;
		}
    }
	}    

	// Get hair routines if they exist
	HairDao hairDao = new HairDao();
	List<Routine> hairRoutine = hairDao.getCurrentRoutinesByUserId(user.getUserId());
	if (hairRoutine != null && !hairRoutine.isEmpty()) {
		for (Routine routine : hairRoutine) {
		    switch (routine.getOccurence()) {
		        case "Morning":
		            morningHairRoutines.add(routine);
		            break;
		        case "Evening":
		            eveningHairRoutines.add(routine);  
		            break;
		        case "Weekly":
		            weeklyHairRoutines.add(routine);  
		            break;
		        case "General Tips":
		            generalHairTips.add(routine);  
		            break;
		        case "Explanation":
		            explanationHair.add(routine);  
		            break;
		        default:
		            System.out.println("Unrecognized occurrence type: " + routine.getOccurence());
		            break;
		    }
		}

	}
	%>

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
				<li><a href="skincare.jsp"><i class="fas fa-spa"></i><span
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
		<div class="header">
			<h1>Your Personal Care Journey</h1>
			<p>Track your progress and achieve your beauty goals</p>
		</div>

		<div class="stats-container">
			<div class="stat-card">
				<i class="fas fa-check-circle"></i>
				<div class="stat-number"><%=formattedPercentage%>%
				</div>
				<div>Daily Tasks Completed</div>
			</div>
			<div class="stat-card">
				<i class="fas fa-fire"></i>
				<div class="stat-number"><%=currentStreak%></div>
				<div>Day Streak</div>
			</div>
			<div class="stat-card">
				<i class="fas fa-trophy"></i>
				<div class="stat-number"><%=challengesCompleted%></div>
				<div>Challenges Completed</div>
			</div>
			<div class="stat-card">
				<i class="fas fa-star"></i>
				<div class="stat-number"><%=formattedRating%></div>
				<div>Routine Rating</div>
			</div>
		</div>

		<div class="tab-container">
			<div class="tab-buttons">
				<button class="tab-button skin-tab-button active"
					onclick="openTab('skin-tab')">Skincare Routines</button>
				<button class="tab-button hair-tab-button"
					onclick="openTab('hair-tab')">Haircare Routines</button>
			</div>

			<!-- Skincare Tab Content -->
			<div id="skin-tab" class="tab-content active">
				<h2 class="section-title">Your Skincare Routines</h2>
				<div class="routines-grid">
					<!-- Morning Routine Card -->
					<div class="routine-card skin-card">
						<h2>
							<i class="fas fa-sun"></i> Morning Routine
						</h2>
						<div>
							<ul class="routine-list skin-list">
								<%
								if (morningSkinRoutines != null && !morningSkinRoutines.isEmpty()) {
									for (Routine detail : morningSkinRoutines) {
								%>
								<li data-routine-id="<%=detail.getRoutine_id() %>"><%=detail.getDetails() %></li>
								<%
								}
								} else {
								%>
								<li class="no-routine">No morning routine created yet. <a
									href="skincare_question.jsp">Create one now</a>.
								</li>
								<%
								}
								%>
							</ul>
						</div>
					</div>

					<div class="routine-card skin-card">
						<h2>
							<i class="fas fa-moon"></i> Evening Routine
						</h2>
						<div>
							<ul class="routine-list skin-list">
								<%
								if (eveningSkinRoutines != null && !eveningSkinRoutines.isEmpty()) {
									for (Routine detail : eveningSkinRoutines) {
								%>
								<li data-routine-id="<%=detail.getRoutine_id() %>"><%=detail.getDetails() %></li>
								<%
								}
								} else {
								%>
								<li class="no-routine">No evening routine created yet. <a
									href="skincare_question.jsp">Create one now</a>.
								</li>
								<%
								}
								%>
							</ul>
						</div>
					</div>
				</div>

				<!-- Weekly Routine Section -->
				<div class="supplementary-info">
					<div class="info-card skin-info">
						<h2>
							<i class="fas fa-calendar-week"></i> Weekly Routine
						</h2>
						<div>
							<ul class="routine-list skin-list">
								<%
								if (weeklySkinRoutines != null && !weeklySkinRoutines.isEmpty()) {
									for (Routine detail : weeklySkinRoutines) {
								%>
								<li data-routine-id="<%=detail.getRoutine_id() %>"><%=detail.getDetails() %></li>
								<%
								}
								} else {
								%>
								<li class="no-routine">No weekly routine created yet. <a
									href="skincare_question.jsp">Create one now</a>.
								</li>
								<%
								}
								%>

							</ul>
						</div>
					</div>

					<div class="routines-grid">
						<div class="info-card skin-info clickable-card"
							onclick="openModal('General Skin Tips', 'skinTipsContent')">
							<h2>
								<i class="fas fa-lightbulb"></i> General Tips
							</h2>
							<p class="click-prompt">Click to view details</p>
						</div>

						<!-- Hidden container for skin tips content -->
						<div id="skinTipsContent" style="display: none;">
							<ul class="routine-list skin-list">
								<%
								if (generalSkinTips != null && !generalSkinTips.isEmpty()) {
									for (Routine detail : generalSkinTips) {
								%>
								<li><%=detail.getDetails() %></li>
								<%
								}
								} else {
								%>
								<li class="no-routine">No general tips found. <a
									href="skincare_question.jsp">Create one now</a>.
								</li>
								<%
								}
								%>

							</ul>
						</div>

						<!-- For Skin Explanation -->
						<div class="info-card skin-info clickable-card"
							onclick="openModal('Why This Routine Works For You', 'skinExplanationContent')">
							<h2>
								<i class="fas fa-info-circle"></i> Why This Routine Works For
								You
							</h2>
							<p class="click-prompt">Click to view details</p>
						</div>

						<!-- Hidden container for skin explanation content -->
						<div id="skinExplanationContent" style="display: none;">
							<ul class="routine-list skin-list">
								<%
								if (explanationSkin != null && !explanationSkin.isEmpty()) {
									for (Routine detail : explanationSkin) {
								%>
								<li><%=detail.getDetails() %></li>
								<%
								}
								} else {
								%>
								<li class="no-routine">No explanation found. <a
									href="skincare_question.jsp">Create one now</a>.
								</li>
								<%
								}
								%>

							</ul>
						</div>
					</div>
				</div>
			</div>

			<!-- Haircare Tab Content -->
			<div id="hair-tab" class="tab-content">
				<h2 class="section-title">Your Haircare Routines</h2>
				<div class="routines-grid">
					<!-- Morning Hair Routine Card -->
					<div class="routine-card hair-card">
						<h2 class="hair-heading">
							<i class="fas fa-sun"></i> Morning Routine
						</h2>
						<div>
							<ul class="routine-list hair-list">
								<%
								if (morningHairRoutines != null && !morningHairRoutines.isEmpty()) {
									for (Routine detail : morningHairRoutines) {
								%>
								<li data-routine-id="<%=detail.getRoutine_id() %>"><%=detail.getDetails() %></li>
								<%
								}
								} else {
								%>
								<li class="no-routine">No morning routine created yet. <a
									href="haircare_question.jsp">Create one now</a>.
								</li>
								<%
								}
								%>
							</ul>
						</div>
					</div>

					<div class="routine-card hair-card">
						<h2 class="hair-heading">
							<i class="fas fa-moon"></i> Evening Routine
						</h2>
						<div>
							<ul class="routine-list hair-list">
								<%
								if (eveningHairRoutines != null && !eveningHairRoutines.isEmpty()) {
									for (Routine detail : eveningHairRoutines) {
								%>
								<li data-routine-id="<%=detail.getRoutine_id() %>"><%=detail.getDetails() %></li>
								<%
								}
								} else {
								%>
								<li class="no-routine">No evening routine created yet. <a
									href="haircare_question.jsp">Create one now</a>.
								</li>
								<%
								}
								%>
							</ul>
						</div>
					</div>
				</div>

				<!-- Weekly Hair Routine Section -->
				<div class="supplementary-info">
					<div class="info-card hair-info">
						<h2 class="hair-heading">
							<i class="fas fa-calendar-week"></i> Weekly Routine
						</h2>
						<div>
							<ul class="routine-list hair-list">
								<%
								if (weeklyHairRoutines != null && !weeklyHairRoutines.isEmpty()) {
									for (Routine detail : weeklyHairRoutines) {
								%>
								<li data-routine-id="<%=detail.getRoutine_id() %>"><%=detail.getDetails() %></li>
								<%
								}
								} else {
								%>
								<li class="no-routine">No weekly routine created yet. <a
									href="haircare_question.jsp">Create one now</a>.
								</li>
								<%
								}
								%>
							</ul>
						</div>
					</div>

					<div class="routines-grid">
						<!-- For Hair General Tips -->
						<div class="info-card hair-info clickable-card"
							onclick="openModal('General Hair Tips', 'hairTipsContent')">
							<h2 class="hair-heading">
								<i class="fas fa-lightbulb"></i> General Tips
							</h2>
							<p class="click-prompt">Click to view details</p>
						</div>

						<!-- Hidden container for hair tips content -->
						<div id="hairTipsContent" style="display: none;">
							<ul class="routine-list hair-list">
								<%
								if (generalHairTips != null && !generalHairTips.isEmpty()) {
									for (Routine detail : generalHairTips) {
								%>
								<li><%=detail.getDetails() %></li>
								<%
								}
								} else {
								%>
								<li class="no-routine">No general tips found. <a
									href="haircare_question.jsp">Create one now</a>.
								</li>
								<%
								}
								%>
							</ul>
						</div>

						<!-- For Hair Explanation -->
						<div class="info-card hair-info clickable-card"
							onclick="openModal('Why This Routine Works For You', 'hairExplanationContent')">
							<h2 class="hair-heading">
								<i class="fas fa-info-circle"></i> Why This Routine Works For
								You
							</h2>
							<p class="click-prompt">Click to view details</p>
						</div>

						<!-- Hidden container for hair explanation content -->
						<div id="hairExplanationContent" style="display: none;">
							<ul class="routine-list hair-list">
								<%
								if (explanationHair != null && !explanationHair.isEmpty()) {
									for (Routine detail : explanationHair) {
								%>
								<li><%=detail.getDetails() %></li>
								<%
								}
								} else {
								%>
								<li class="no-routine">No explanation found. <a
									href="haircare_question.jsp">Create one now</a>.
								</li>
								<%
								}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="modalContainer" class="modal-container">
			<div class="modal-content">
				<span class="close-button">&times;</span>
				<h2 id="modalTitle"></h2>
				<div id="modalBody"></div>
			</div>
		</div>
	</div>

	<script>

	document.querySelectorAll('.routine-list li').forEach(item => {
	    item.addEventListener('click', () => {
	        if (!item.classList.contains('no-routine')) {
	            item.classList.toggle('completed');
	            
	            const routineId = item.getAttribute('data-routine-id');
	            
	            if (item.classList.contains('completed')) {
	                completeRoutine(routineId, item);
	            }
	        }
	    });
	});
        
        function openTab(tabId) {
            // Hide all tab contents
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.classList.remove('active');
            });
            
            // Deactivate all tab buttons
            document.querySelectorAll('.tab-button').forEach(button => {
                button.classList.remove('active');
            });
            
            // Show the selected tab content
            document.getElementById(tabId).classList.add('active');
            
            // Activate the clicked button
            if (tabId === 'skin-tab') {
                document.querySelector('.skin-tab-button').classList.add('active');
            } else {
                document.querySelector('.hair-tab-button').classList.add('active');
            }
        }
        
        function openModal(title, contentId) {
            const modal = document.getElementById('modalContainer');
            const modalTitle = document.getElementById('modalTitle');
            const modalBody = document.getElementById('modalBody');
            const content = document.getElementById(contentId);
            
            // Set modal content
            modalTitle.textContent = title;
            modalBody.innerHTML = content.innerHTML;
            
            // Show modal
            modal.style.display = 'flex';
            document.body.style.overflow = 'hidden'; // Prevent scrolling
        }
        
        // Close modal when clicking X button
        document.querySelector('.close-button').addEventListener('click', function() {
            document.getElementById('modalContainer').style.display = 'none';
            document.body.style.overflow = 'auto'; // Re-enable scrolling
        });
        
        // Close modal when clicking outside
        window.addEventListener('click', function(event) {
            const modal = document.getElementById('modalContainer');
            if (event.target === modal) {
                modal.style.display = 'none';
                document.body.style.overflow = 'auto'; // Re-enable scrolling
            }
        });
        
        // Function to check if any routines exist and show empty state if needed
        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const tabParam = urlParams.get('tab');
            
            // If parameter is 'hair', switch to hair tab
            if (tabParam === 'hair') {
                openTab('hair-tab');
            }
            
            if (tabParam === 'skin') {
                openTab('skin-tab');
            }
            // Check if skin routines exist
            const hasSkinRoutines = <%=(morningSkinRoutines != null && !morningSkinRoutines.isEmpty())
		|| (eveningSkinRoutines != null && !eveningSkinRoutines.isEmpty())
		|| (weeklySkinRoutines != null && !weeklySkinRoutines.isEmpty())%>;
            
            // Check if hair routines exist
            const hasHairRoutines = <%=(morningHairRoutines != null && !morningHairRoutines.isEmpty())
		|| (eveningHairRoutines != null && !eveningHairRoutines.isEmpty())
		|| (weeklyHairRoutines != null && !weeklyHairRoutines.isEmpty())%>;
            
            // Handle completely empty tabs
            if (!hasSkinRoutines) {
                document.getElementById('skin-tab').innerHTML = `
                    <h2 class="section-title">Your Skincare Routines</h2>
                    <div class="empty-tab-message">
                        <i class="fas fa-spa"></i>
                        <h3>No Skincare Routines Yet</h3>
                        <p>You haven't created any skincare routines. Start your personal care journey today!</p>
                        <a href="skincare_question.jsp" class="create-routine-btn">Create Skincare Routine</a>
                    </div>
                `;
            }
            
            if (!hasHairRoutines) {
                document.getElementById('hair-tab').innerHTML = `
                    <h2 class="section-title">Your Haircare Routines</h2>
                    <div class="empty-tab-message">
                        <i class="fas fa-user-tie"></i>
                        <h3>No Haircare Routines Yet</h3>
                        <p>You haven't created any haircare routines. Start your personal care journey today!</p>
                        <a href="haircare_question.jsp" class="create-routine-btn">Create Haircare Routine</a>
                    </div>
                `;
            }
            
            loadCompletedRoutines();
            
            // Clean up old completed routines
            cleanupOldCompletedRoutines();
            
            // Add event listeners to all routine items
            document.querySelectorAll('.routine-list li[data-routine-id]').forEach(item => {
                item.addEventListener('click', () => {
                    if (!item.classList.contains('no-routine')) {
                        item.classList.toggle('completed');
                        
                        const routineId = item.getAttribute('data-routine-id');
                        
                        if (item.classList.contains('completed')) {
                            completeRoutine(routineId, item);
                        }
                    }
                });
            });
        });
        
        function completeRoutine(routineId, listItem) {
            // Disable the item while the request is processing
            listItem.style.pointerEvents = 'none';
            // Send AJAX request to update the database
            fetch('completeRoutine', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    'routineId': routineId
                }).toString()            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    // Success - update stats without page reload
                    updateStats();
                    
                    // Re-enable the item
                    listItem.style.pointerEvents = 'auto';
                    
                    // Add checkmark icon if not already present
                    if (!listItem.querySelector('.check-icon')) {
                        const checkIcon = document.createElement('i');
                        checkIcon.className = 'fas fa-check check-icon';
                        listItem.appendChild(checkIcon);
                    }
                } else {
                    // Error - revert visual changes
                    console.error('Error completing routine:', data.message);
                    listItem.classList.remove('completed');
                    listItem.style.pointerEvents = 'auto';
                    alert('Failed to mark routine as complete. Please try again.');
                }
                saveCompletedRoutine(routineId);
            })
            .catch(error => {
                console.error('Error:', error);
                listItem.classList.remove('completed');
                listItem.style.pointerEvents = 'auto';
                alert('An error occurred. Please try again.');
            });
        }

        // Function to update the stats container without page reload
        function updateStats() {
            fetch('getStats', {
                method: 'GET'
            })
            .then(response => response.json())
            .then(data => {
                // Update each stat in the UI
                document.querySelector('.stat-card:nth-child(1) .stat-number').textContent = data.dailyTasksPercentage + '%';
                document.querySelector('.stat-card:nth-child(2) .stat-number').textContent = data.currentStreak;
                document.querySelector('.stat-card:nth-child(3) .stat-number').textContent = data.challengesCompleted;
                document.querySelector('.stat-card:nth-child(4) .stat-number').textContent = data.routineRating;
                
                // Add animation to highlight updated stats
                document.querySelectorAll('.stat-card').forEach(card => {
                    card.classList.add('stat-updated');
                    setTimeout(() => {
                        card.classList.remove('stat-updated');
                    }, 1000);
                });
            })
            .catch(error => {
                console.error('Error updating stats:', error);
            });
        }

        // Add checkbox listeners when document loads
        document.addEventListener('DOMContentLoaded', function() {
            // Find all routine checkboxes and add event listeners
            const routineCheckboxes = document.querySelectorAll('.routine-checkbox');
            routineCheckboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    if (this.checked) {
                        const routineId = this.getAttribute('data-routine-id');
                        completeRoutine(routineId);
                    }
                });
            });
        });
        
     // Save completed routine to localStorage
        function saveCompletedRoutine(routineId) {
            const today = new Date().toISOString().split('T')[0]; // Get today's date in YYYY-MM-DD format
            let completedRoutines = JSON.parse(localStorage.getItem('completedRoutines')) || {};
            
            // Initialize today's entry if it doesn't exist
            if (!completedRoutines[today]) {
                completedRoutines[today] = [];
            }
            
            // Add routineId to today's completed routines if not already there
            if (!completedRoutines[today].includes(routineId)) {
                completedRoutines[today].push(routineId);
            }
            
            // Save back to localStorage
            localStorage.setItem('completedRoutines', JSON.stringify(completedRoutines));
        }

        // Load completed routines from localStorage and update UI
        function loadCompletedRoutines() {
            const today = new Date().toISOString().split('T')[0]; // Get today's date in YYYY-MM-DD format
            const completedRoutines = JSON.parse(localStorage.getItem('completedRoutines')) || {};
            const todaysCompletedRoutines = completedRoutines[today] || [];
            
            // Apply completed status to routines
            document.querySelectorAll('.routine-list li[data-routine-id]').forEach(item => {
                const routineId = item.getAttribute('data-routine-id');
                if (todaysCompletedRoutines.includes(routineId)) {
                    item.classList.add('completed');
                    
                    // Add checkmark icon if not already present
                    if (!item.querySelector('.check-icon')) {
                        const checkIcon = document.createElement('i');
                        checkIcon.className = 'fas fa-check check-icon';
                        item.appendChild(checkIcon);
                    }
                }
            });
        }

        // Clean up old completed routines (optional, to prevent localStorage from growing too large)
        function cleanupOldCompletedRoutines() {
            const completedRoutines = JSON.parse(localStorage.getItem('completedRoutines')) || {};
            const today = new Date().toISOString().split('T')[0];
            
            // Keep only the last 30 days of data
            const thirtyDaysAgo = new Date();
            thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
            const thirtyDaysAgoStr = thirtyDaysAgo.toISOString().split('T')[0];
            
            for (const date in completedRoutines) {
                if (date < thirtyDaysAgoStr) {
                    delete completedRoutines[date];
                }
            }
            
            localStorage.setItem('completedRoutines', JSON.stringify(completedRoutines));
        }
        
    </script>
</body>
</html>