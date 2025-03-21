<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.SkinDao, com.pojo.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Skincare Details</title>
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

.container {
	margin-left: 70px;
	flex-grow: 1;
	padding: 20px;
	transition: margin-left 0.3s ease;
}

.sidebar:hover ~ .container {
	margin-left: 250px;
}

.sidebar h2 {
	color: #856c6c;
	margin-bottom: 20px;
	font-size: 1.8rem;
	border-bottom: 2px solid #f3d7d7;
	padding-bottom: 10px;
}

.section {
	background-color: #fff;
	border-radius: 15px;
	padding: 25px;
	margin-bottom: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
	transition: transform 0.3s ease;
}

.section:hover {
	transform: translateY(-5px);
}

.header {
	background-color: #90c9c8;
	padding: 20px;
	border-radius: 15px;
	margin-bottom: 20px;
	color: #315564;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 2em;
	margin-bottom: 10px;
}

.content-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
	margin-bottom: 20px;
}

.section {
	background: rgba(255, 255, 255, 0.9);
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	border-left: 5px solid #f59caa;
}

.section h2 {
	color: #315564;
	margin-bottom: 15px;
	padding-bottom: 10px;
	border-bottom: 2px solid #90c9c8;
}

.section ul {
	list-style: none;
}

.section li {
	padding: 10px;
	margin: 5px 0;
	background: rgba(144, 201, 200, 0.1);
	border-radius: 8px;
	transition: background-color 0.3s ease;
}

.section li:hover {
	background: rgba(245, 156, 170, 0.1);
}

.full-width {
	grid-column: 1/-1;
}

.stats-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 15px;
	margin-bottom: 20px;
}

.stat-card {
	background: white;
	padding: 15px;
	border-radius: 10px;
	text-align: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.stat-number {
	font-size: 1.8em;
	color: #f59caa;
	margin: 5px 0;
}

button {
	background-color: #90c9c8;
	color: white;
	border: none;
	padding: 12px 25px;
	border-radius: 8px;
	cursor: pointer;
	font-size: 1rem;
	transition: all 0.3s ease;
}

button:hover {
	background-color: #f59caa;
	transform: scale(1.05);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 15px;
	background: white;
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid #90c9c8;
}

th {
	background-color: #90c9c8;
	color: white;
}

tr:hover {
	background-color: rgba(144, 201, 200, 0.1);
}

/* Responsive Design */
@media ( max-width : 768px) {
	.content-grid {
		grid-template-columns: 1fr;
	}
	.container {
		padding: 10px;
	}
	.stats-grid {
		grid-template-columns: 1fr 1fr;
	}
}

.recommendation-actions {
	margin-top: 20px;
	padding-top: 15px;
	border-top: 1px solid rgba(144, 201, 200, 0.2);
}

.view-details-btn {
	background-color: #315564;
	color: white;
	padding: 12px 20px;
	border-radius: 8px;
	display: flex;
	align-items: center;
	gap: 10px;
	transition: all 0.3s ease;
	width: 100%;
	justify-content: center;
}

.view-details-btn:hover {
	background-color: #90c9c8;
	transform: translateY(-2px);
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.view-details-btn i {
	font-size: 1.1em;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
	<!-- Sidebar -->
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

	<!-- Main Content -->
	<div class="container">
		<div class="header">
			<h1>Your Skincare Journey</h1>
			<p>Track and optimize your skincare routine for better results</p>
		</div>
		<%
		UserDetails user = (UserDetails) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		// Retrieve user ID from session
		String userId = (String) session.getAttribute("user_id");
		SkinDao skinDao = new SkinDao();
		SkinDetails skinDetails = skinDao.getSkinDetailsByUserId(userId);
		if (skinDetails != null) {
		%>
		<!-- Current Routine Based on AI Recommendation -->
		<div class="content-grid">
			<div class="section">
				<h2>
					<i class="fas fa-robot"></i> AI Recommendation
				</h2>
				<ul>
					<li>Morning Routine</li>
					<li>Evening Routine</li>
				</ul>
				<div class="recommendation-actions">
					<button class="view-details-btn"
						onclick="window.location.href='routine.jsp?tab=skin'">
						<i class="fas fa-list-ul"></i> View Detailed Recommendation
					</button>
				</div>
			</div>

			<!-- Skincare Details -->
			<div class="section">
				<h2>
					<i class="fas fa-info-circle"></i> Skin Profile
				</h2>
				<ul>
					<li><strong>Skin Type:</strong> <%=skinDetails.getSkinType() != null ? skinDetails.getSkinType() : "Not provided"%></li>
					<li><strong>Main Concerns:</strong> <%
 List<String> concerns = skinDetails.getSkinConcerns();
 if (concerns != null && !concerns.isEmpty()) {
 	for (String concern : concerns) {
 %> <%=concern%>, <%
 }
 } else {
 %>
					<li>No concerns available</li>
					<%
					}
					%></li>
					<li><strong>Sensitivity Level:</strong> Moderate</li>
					<li><strong>Current Status:</strong> Improving</li>
				</ul>
			</div>



			<div class="section">
				<h2>
					<i class="fas fa-bullseye"></i> Goals
				</h2>
				<ul>
					<%
					List<String> goals = skinDetails.getGoals();
					if (goals != null && !goals.isEmpty()) {
						for (String goal : goals) {
					%>
					<li><%=goal%></li>
					<%
					}
					} else {
					%>
					<li>No goals available</li>
					<%
					}
					%>
				</ul>
			</div>

			<div class="section">
				<h2>
					<i class="fas fa-clock"></i> Current Routine
				</h2>
				<p>
					<strong>Frequency:</strong>
					<%=skinDetails.getSkincareFrequency() != null ? skinDetails.getSkincareFrequency() : "Not provided"%></p>
				<ul>
					<%
					List<String> products = skinDetails.getCurrentProducts();
					if (products != null && !products.isEmpty()) {
						for (String product : products) {
					%>
					<li><%=product%></li>
					<%
					}
					} else {
					%>
					<li>No products listed</li>
					<%
					}
					%>
				</ul>
			</div>

			<div class="section">
				<h2>Allergies</h2>
				<ul>
					<li><p>
							<strong>Has Allergies:</strong>
							<%=skinDetails.getAllergies() != null && !skinDetails.getAllergies().contains("No") ? "Yes" : "No"%></p></li>
					<%
					if (skinDetails.getAllergies() != null && !skinDetails.getAllergies().contains("No")) {
					%>
					<li><p>
							<strong>Details:</strong>
							<%=skinDetails.getAllergies().get(0) != null ? skinDetails.getAllergies().get(0) : "No allergy details"%></p></li>
					<%
					}
					%>
				</ul>
			</div>

			<div class="section">
				<h2>Habits</h2>
				<ul>
					<li><p>
							<strong>Sun Exposure:</strong>
							<%=skinDetails.getSunExposure() != null ? skinDetails.getSunExposure() : "Not provided"%></p></li>
					<li><p>
							<strong>Water Intake:</strong>
							<%=skinDetails.getWaterIntake() != null ? skinDetails.getWaterIntake() : "Not provided"%></p></li>
				</ul>

				<h3>Skin Treatments</h3>
				<ul>
					<%
					List<String> treatments = skinDetails.getSkinTreatment();
					if (treatments != null && !treatments.isEmpty()) {
						for (String treatment : treatments) {
					%>
					<li><%=treatment%></li>
					<%
					}
					} else {
					%>
					<li>No treatments listed</li>
					<%
					}
					%>
				</ul>
			</div>

		</div>
		<!-- Generate New Recommendation -->
		<div class="section">
			<h2>
				<i class="fas fa-sync-alt"></i> Generate a New Recommendation
			</h2>
			<form action="skincare_question.jsp" method="post">
				<input type="hidden" name="user_id" value="<%=userId%>">
				<button type="submit">Generate New Recommendation</button>
			</form>
		</div>

		<!-- Past Recommendations -->
		<div class="section">
			<h2>
				<i class="fas fa-history"></i> Past Recommendations
			</h2>
			<div class="table-container">
				<table>
					<thead>
						<tr>
							<th>Date</th>
							<th>Recommendation</th>
						</tr>
					</thead>
					<tbody>
						<%
						// Example: Replace with actual past recommendations from DAO
						List<String> pastRecommendations = null;
						if (pastRecommendations != null && !pastRecommendations.isEmpty()) {
							for (String recommendation : pastRecommendations) {
						%>
						<tr>
							<td>2025-01-20</td>
							<td><%=recommendation%></td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="2">No past recommendations found.</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>

		<%
		} else {
		%>
		<div class="section full-width">
			<h2><i class="fas fa-exclamation-circle"></i> No Skincare Profile Found</h2>
			<p>You haven't created a skincare profile yet. Create one to get personalized recommendations!</p>
			<div class="recommendation-actions">
				<button class="view-details-btn" onclick="window.location.href='skincare_question.jsp'">
					<i class="fas fa-plus-circle"></i> Create Skincare Profile
				</button>
			</div>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>
