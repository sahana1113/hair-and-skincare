<!DOCTYPE html>
<html>
<head>
    <title>Create New Habit</title>
    <style>

/* Global Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background: linear-gradient(135deg, #ffd6cc 0%, #e6fff2 100%);
    min-height: 100vh;
    color: #4a4a4a;
}
.sidebar h2 {
            color: #856c6c;
            margin-bottom: 20px;
            font-size: 1.8rem;
            border-bottom: 2px solid #f3d7d7;
            padding-bottom: 10px;
}


/* Main Content Styles */
main {
    margin-left: 70px; /* Match sidebar width */
    min-height: 100vh;
    padding: 2rem;
    transition: margin-left 0.3s ease;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #ffd6cc 0%, #e6fff2 100%);
}

.sidebar:hover + main {
    margin-left: 250px; /* Match expanded sidebar width */
}

.form-container {
    width: 100%;
    max-width: 800px;
    background: rgba(255, 255, 255, 0.95);
    padding: 2rem;
    border-radius: 20px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(10px);
}

.header {
    display: flex;
    align-items: center;
    gap: 1.5rem;
    margin-bottom: 2rem;
    padding-bottom: 1rem;
    border-bottom: 2px solid #e6e6e6;
}

.header img {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    object-fit: cover;
}

.header h1 {
    font-size: 2rem;
    color: #2e4c5a;
    font-weight: 600;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: #4a4a4a;
}

.form-group input[type="text"],
.form-group input[type="date"],
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 0.75rem;
    border: 2px solid #e6e6e6;
    border-radius: 8px;
    font-size: 1rem;
    transition: border-color 0.3s ease;
    background: white;
}

.form-group textarea {
    min-height: 120px;
    resize: vertical;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
    outline: none;
    border-color: #87c9c8;
    box-shadow: 0 0 0 3px rgba(135, 201, 200, 0.2);
}

button[type="submit"] {
    width: 100%;
    padding: 1rem;
    background: #2e4c5a;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 1.1rem;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-top: 1rem;
}

button[type="submit"]:hover {
    background: #87c9c8;
}

/* Decorative Elements */
.form-container::before {
    content: '';
    position: absolute;
    top: -10px;
    right: -10px;
    width: 20px;
    height: 20px;
    background: #87c9c8;
    border-radius: 50%;
    opacity: 0.5;
}

.form-container::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: -10px;
    width: 20px;
    height: 20px;
    background: #ffd6cc;
    border-radius: 50%;
    opacity: 0.5;
}

/* Responsive Design */
@media (max-width: 768px) {
    main {
        padding: 1rem;
    }
    
    .form-container {
        padding: 1.5rem;
    }
    
    .header {
        flex-direction: column;
        text-align: center;
    }
    
    .header h1 {
        font-size: 1.75rem;
    }
}

/* Animation for form elements */
.form-group {
    opacity: 0;
    transform: translateY(20px);
    animation: fadeInUp 0.5s forwards;
}

@keyframes fadeInUp {
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.form-group:nth-child(1) { animation-delay: 0.1s; }
.form-group:nth-child(2) { animation-delay: 0.2s; }
.form-group:nth-child(3) { animation-delay: 0.3s; }
.form-group:nth-child(4) { animation-delay: 0.4s; }
.form-group:nth-child(5) { animation-delay: 0.5s; }

.sidebar-header {
    text-align: center;
    padding: 20px;
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
    margin: 15px 0;
}

.sidebar-nav li a {
    color: #ffffff;
    text-decoration: none;
    font-size: 1.2rem;
    padding: 10px;
    display: flex;
    align-items: center;
    transition: all 0.3s ease;
    border-radius: 8px;
}

.sidebar-nav li a:hover {
    background-color: rgba(255, 255, 255, 0.1);
    padding-left: 20px;
}

.sidebar-nav li a i {
    min-width: 30px;
}

.sidebar-text {
    margin-left: 10px;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.sidebar:hover .sidebar-text {
    opacity: 1;
}

.logout-btn {
    background-color: rgba(255, 107, 107, 0.8);
    margin-top: 30px;
    border-radius: 8px;
}

.logout-btn:hover {
    background-color: rgba(255, 107, 107, 1);
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
    <main>
        <section class="form-container">
         <div class="header">
            <img src="images/habiticon.jpg" alt="Skincare">
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
    </main>
</body>
</html>
