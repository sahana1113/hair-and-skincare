<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.dao.*" %>
<%@ page import="com.pojo.*" %>
<%@ page import="java.util.*" %>
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
    color: #444; /* Neutral, softer tone for text */
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

/* List Modernization */
.main-content ul {
    list-style-type: none;
    padding: 0;
}

.main-content li {
    display: flex;
    align-items: center;
    gap: 10px;
}

.main-content li::before {
    content: '\f00c'; /* FontAwesome check-circle icon */
    font-family: 'Font Awesome 6 Free';
    font-weight: 900;
    color: #3e6b7e
    font-size: 1.2rem;
}
button {
    cursor: pointer;
    padding: 10px 20px;
    font-size: 19px;
    background-color: #87c9c8; /* Soft pink */
    color: #fff;
    border: none;
    border-radius: 5px;
        transition: transform 0.3s ease, background-color 0.3s ease;
}

button:hover {
    background-color: #f79eb6;
     transform: scale(1.1);
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
    color: black
}

.motivational-quote {
	margin-top: 10px;
	font-size: 1.2rem;
	color:black;
	font-style: italic;
}

.update-btn {
	background-color: #87c9c8;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 1rem;
	font-weight: bold;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.update-btn:hover {
	background-color: #2980b9;
	transform: scale(1.05);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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

/* Main Content Styles */
.content {
    margin-left: 80px; /* Offset the sidebar */
    padding: 20px;
    width: 100%;
    transition: margin-left 0.3s ease;
    
}

.sidebar:hover ~ .content {
    margin-left: 250px; /* Matches expanded sidebar width */
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
    background-color: rgba(250, 240, 230, 0.8); /* Semi-transparent white */
    color: black; /* Neutral text */
    border-radius: 8px;
	padding: 45px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
    animation: fadeIn 1s ease forwards;
    opacity: 0;
    font-size:25px;
}

h2 {
            color: #856c6c;
            margin-bottom: 20px;
            font-size: 1.8rem;
            border-bottom: 2px solid #f3d7d7;
            padding-bottom: 10px;
}

h3 {
    font-size: 1.2rem;
    margin-bottom: 10px;
}

/* Routine Tasks */
.routine-tasks ul {
    list-style-type: none;
}

.routine-tasks li {
    margin: 10px 0;
}

input[type="checkbox"] {
    margin-right: 10px;
}

/* Streak Tracker */
.streak-tracker {
    background-color:#feca81;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.streak-tracker p {
    font-size: 1rem;
    font-weight: bold;
}

/* Rewards Section */
.rewards {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.streak {
    background-color: rgba(255,255,255,0.8);
    color: black;
    padding: 10px;
    border-radius: 5px;
    font-weight: bold;
}

.reward {
    background-color: #fd9baa;
    color: white;
    padding: 10px;
    border-radius: 5px;
    font-weight: bold;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    max-width: 500px;
    margin: 0 auto;
}

.close-btn {
    font-size: 30px;
    color: #333;
    cursor: pointer;
    position: absolute;
    top: 10px;
    right: 10px;
}
input[type="checkbox"] {
    appearance: none;
    -webkit-appearance: none;
    width: 20px;
    height: 20px;
    border: 2px solid #87c9c8;
    border-radius: 5px;
    cursor: pointer;
    outline: none;
    transition: all 0.3s ease;
    position: relative;
    background-color: transparent;
}

input[type="checkbox"]:checked {
    background-color: #3e6b7e;
    border-color: #3e6b7e;
}

input[type="checkbox"]:checked::after {
    content: '\2713'; /* Checkmark */
    color: white;
    font-size: 14px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}



@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive Layout */
@media (max-width: 768px) {
    .sidebar {
        width: 200px;
    }

    .content {
        margin-left: 0;
    }

    .main-content {
        grid-template-columns: 1fr;
    }
}

    </style>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="script.js"></script> <!-- Link to your JavaScript file -->
</head>
<body>
    <!-- Sidebar Section -->
     <aside class="sidebar">
        <div class="sidebar-header">
           <h2><a href="dashboard.jsp">Dashboard</a></h2>
        </div>
        <nav class="sidebar-nav">
            <ul>
                <li><a href="profile.jsp"><i class="fas fa-user"></i><span class="sidebar-text">Profile</span></a></li>
                <li><a href="routine.jsp"><i class="fas fa-calendar-day"></i><span class="sidebar-text">Your Daily Routine</span></a></li>
                <li><a href="skincare.jsp"><i class="fas fa-spa"></i></i><span class="sidebar-text">Skincare</span></a></li>
                <li><a href="haircare.jsp"><i class="fas fa-user-tie"></i><span class="sidebar-text">Haircare</span></a></li>
                <li><a href="habits.jsp"><i class="fas fa-heartbeat"></i><span class="sidebar-text">Track Your Habits</span></a></li>
                <li><a href="todo.jsp"><i class="fas fa-list"></i><span class="sidebar-text">Your To-Do List</span></a></li>
                <li><a href="streak.jsp"><i class="fas fa-fire"></i><span class="sidebar-text">Your Streak</span></a></li>
                <li><a href="rewards.jsp"><i class="fas fa-trophy"></i><span class="sidebar-text">Your Rewards</span></a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i><span class="sidebar-text">Logout</span></a></li>
            </ul>
        </nav>
    </aside>
    <!-- Main Content Section -->
    <div class="content">
         <%
    UserDetails user = (UserDetails) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if user is not found
        return;
    }String userId = (String) session.getAttribute("user_id");
    HabitDao hdao=new HabitDao();
    List<Habits> habits = hdao.getHabitsByUserId(userId);
    TodoDao dao=new TodoDao();
    List<Todo> todos = dao.getTodosByUserId(userId);

    %>

        <main class="main-content">
            <!-- Profile & Goals Section -->
            <section id="profile" class="profile-goals" onclick="window.location.href='profile.jsp';" style="cursor: pointer;">
				<div class="profile-info">
					<!-- Profile Picture -->
					<div class="profile-photo">
						<img id="profile-img" src="images/girluser1.jpg"
							alt="Profile Picture" />
						<div>
							<h2>Welcome, <%= user.getUsername() %>!</h2>
							<p class="motivational-quote">"Small steps every day lead to
								big changes tomorrow. Glow, grow, and thrive in every way."</p>
						</div>
						<!-- Update Profile Details Button -->
						<a href="profile.jsp">
  <button id="update-profile-btn" class="update-btn">Revise Profile</button>
</a>
					</div>
				</div>
			</section>

            <!-- Routine Overview Section -->
            <section id="routine" class="routine-overview" onclick="window.location.href='routine.jsp';" style="cursor: pointer;">
                <h2>Your Daily Routine</h2>
                <div class="routine-tasks">
                    <h3>Skincare Routine:</h3>
                    <ul>
                        <li>Morning Skincare</li>
                        <li> Night Skincare</li>
                    </ul>
                </div>
<a href="routine.jsp?tab=skin">
  <button class="generate-recommendations">View</button>
</a>
                <div class="routine-tasks">
                    <h3>Haircare Routine:</h3>
                    <ul>
                        <li>Weekly Routine</li>
                    </ul>
                </div>
               <a href="routine.jsp?tab=hair">
  <button class="generate-recommendations">View</button>
</a>
               
            </section>

            <!-- Habits Tracker Section -->
            <section id="habits" class="habits-tracker" onclick="window.location.href='habits.jsp';" style="cursor: pointer;">
                <h2>Track Your Habits</h2>
                <ul>
                <% if (habits != null && !habits.isEmpty()) {
                	for (Habits habit : habits) {
                    String habitName = habit.getHabitName();
                    int habitId = habit.getHabitId();
            %>
                    <li><%= habitName %></li>
                 <% } %>
                </ul>
             <%    } else { %>
                    <p>No habits created yet<p>
                <% } %>
                <a href="habits.jsp">
                <button class="view-btn">Manage Habits</button>
            </a>
                
            </section>

            <!-- To-Do List Section -->
            <section id="todo" class="to-do-list" onclick="window.location.href='todo.jsp';" style="cursor: pointer;">
                <h2>Your To-Do List</h2>
                <ul>
                <% if (todos != null && !todos.isEmpty()) { 
                for (int i=0;i<todos.size();i++) {
                        String todoName =todos.get(i).getTaskName();
                        int todoId = todos.get(i).getTodoId();
                %>
                    <li><%= todoName %></li>
                    <% } 
                } else { %>
                    <p>No tasks added yet<p>
                <% } %>
            </ul>
            <a href="todo.jsp">
                <button class="view-btn">Manage Tasks</button>
            </a>
                </ul>
            </section>

            <!-- Streak Tracker Section -->
            <section id="streak" class="streak-tracker" onclick="window.location.href='streak.jsp';" style="cursor: pointer;">
                <h2>Your Streak</h2>
                <div class="streak">
                <p>Current Streak: <span id="current-streak">5</span> days</p>
                </div>
                <div class="streak">
                <p>Milestone Achieved: 30-Day Streak!</p>
                </div>
            </section>

            <!-- Rewards Section -->
            <section id="rewards" class="rewards" onclick="window.location.href='rewards.jsp';" style="cursor: pointer;">
                <h2>Your Rewards</h2>
                <div class="reward">
                    <p>Earned: Early Bird</p>
                </div>
                <div class="reward">
                    <p>Earned: Consistency</p>
                </div>
            </section>
        </main>
    </div>

    <link href="https://cdn.jsdelivr.net/npm/@n8n/chat/dist/style.css" rel="stylesheet" />
<script type="module">
	import { createChat } from 'https://cdn.jsdelivr.net/npm/@n8n/chat/dist/chat.bundle.es.js';

createChat({
	webhookUrl: 'https://trialaccountaii.app.n8n.cloud/webhook/cf842d52-e93a-41b0-90fb-a2b81bd8b24e/chat',
	webhookConfig: {
		method: 'POST',
		headers: {}
	},
	target: '#n8n-chat',
	mode: 'window',
	chatInputKey: 'chatInput',
	chatSessionKey: 'sessionId',
	metadata: {},
	showWelcomeScreen: false,
	defaultLanguage: 'en',
	initialMessages: [
   		 'I\'m CareBot.',
    	 'I\'m here to listen. How are you feeling right now?'
	]
});

</script>
</body>
</html>
