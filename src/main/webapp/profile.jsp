<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.pojo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Skincare & Haircare App</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
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
            background-color: #f9f5f7;
            font-size: 20px;
            background-image: linear-gradient(to bottom right, rgba(135, 201, 200, 0.1), rgba(49, 85, 100, 0.05));
        }
        
        a {
            text-decoration: none;
            color: #444;
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
            box-shadow: 3px 0 10px rgba(0,0,0,0.1);
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
            border-radius: 8px;
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

        .sidebar h2 {
            color: #856c6c;
            margin-bottom: 20px;
            font-size: 1.8rem;
            border-bottom: 2px solid #f3d7d7;
            padding-bottom: 10px;
        }

        /* Content Layout */
        .content {
            margin-left: 70px;
            width: calc(100% - 70px);
            padding: 0;
            display: grid;
            grid-template-columns: 1fr minmax(auto, 800px) 1fr;
            gap: 20px;
            background-color: transparent;
        }

        /* Enhanced Side Panels */
        .side-panel {
            padding: 20px;
            height: fit-content;
            position: sticky;
            top: 20px;
        }

        .stats-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            position: relative;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-top: 5px solid #87c9c8;
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .stats-card::before {
            content: '';
            position: absolute;
            top: -50px;
            right: -50px;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: rgba(135, 201, 200, 0.1);
            z-index: 0;
        }

        .stats-card h3 {
            color: #315564;
            margin-bottom: 20px;
            font-size: 1.3rem;
            position: relative;
            padding-bottom: 12px;
            font-weight: 600;
        }

        .stats-card h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: #87c9c8;
        }

        .stat-item {
            display: flex;
            align-items: center;
            margin: 15px 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 10px;
            transition: all 0.3s ease;
            position: relative;
            z-index: 1;
            border-left: 4px solid transparent;
        }

        .stat-item:hover {
            border-left: 4px solid #87c9c8;
            transform: translateX(5px);
            background: linear-gradient(to right, #f8f9fa, #ffffff);
        }

        .stat-item i {
            color: #87c9c8;
            margin-right: 15px;
            font-size: 1.4rem;
        }

        /* Activity visualization in right panel */
        .activity-chart {
            width: 100%;
            height: 4px;
            background-color: #f0f0f0;
            border-radius: 2px;
            margin-top: 8px;
            overflow: hidden;
        }

        .activity-progress {
            height: 100%;
            background-color: #87c9c8;
            width: 0;
            transition: width 1s ease;
        }

        .right-panel .stat-item:nth-child(1) .activity-progress {
            width: 85%;
        }

        .right-panel .stat-item:nth-child(2) .activity-progress {
            width: 65%;
        }

        .right-panel .stat-item:nth-child(3) .activity-progress {
            width: 95%;
        }

        /* Date indicator for activity */
        .activity-date {
            font-size: 0.7rem;
            color: #999;
            margin-top: 5px;
            text-align: right;
        }

        /* Main Profile Section */
        .profile-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            padding: 35px;
            margin: 20px 0;
            grid-column: 2;
            position: relative;
            overflow: hidden;
        }

        .profile-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(to right, #87c9c8, #315564);
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 30px;
            margin-bottom: 35px;
            padding-bottom: 25px;
            border-bottom: 2px solid #f0f0f0;
        }

        .profile-photo {
            position: relative;
        }

        .profile-photo img {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .profile-photo img:hover {
            transform: scale(1.05);
        }

        .profile-photo::after {
            content: '\f030';
            font-family: 'Font Awesome 5 Free';
            position: absolute;
            right: 5px;
            bottom: 5px;
            background-color: #87c9c8;
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .profile-photo::after:hover {
            background-color: #315564;
        }

        .profile-title h2 {
            color: #315564;
            margin-bottom: 10px;
            font-size: 1.8rem;
        }

        .profile-title p {
            color: #666;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
        }

        .profile-title p::before {
            content: '\f073';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            margin-right: 10px;
            color: #87c9c8;
        }

        /* Form Styles */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            color: #315564;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 14px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #87c9c8;
            outline: none;
            box-shadow: 0 0 0 3px rgba(135, 201, 200, 0.2);
            background-color: #ffffff;
        }

        .form-group:focus-within label {
            color: #87c9c8;
        }

        /* Button Styles */
        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .update-btn {
            background-color: #87c9c8;
            color: white;
            border: none;
            padding: 14px 28px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            transition: all 0.3s ease;
            flex: 1;
            font-weight: 600;
            letter-spacing: 0.5px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .update-btn::before {
            content: '\f044';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            margin-right: 10px;
        }

        .update-btn:hover {
            background-color: #315564;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(135, 201, 200, 0.3);
        }

        /* Feedback Section */
        .feedback-section {
            background: #f9f9f9;
            border-radius: 12px;
            padding: 25px;
            margin-top: 30px;
            border-left: 5px solid #87c9c8;
        }

        .feedback-section h3 {
            color: #315564;
            margin-bottom: 20px;
            font-size: 1.3rem;
            position: relative;
            display: inline-block;
        }

        .feedback-section h3::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #87c9c8;
        }

        .rating {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin: 25px 0;
        }

        .rating input {
            display: none;
        }

        .rating label {
            cursor: pointer;
            font-size: 28px;
            color: #ddd;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .rating label:before {
            content: '★';
        }

        .rating label:hover {
            transform: scale(1.2);
        }

        .rating input:checked ~ label {
            color: #ffd700;
        }

        .feedback-text {
            width: 100%;
            padding: 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            resize: vertical;
            min-height: 120px;
            margin-bottom: 20px;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
        }

        .feedback-text:focus {
            border-color: #87c9c8;
            outline: none;
            box-shadow: 0 0 0 3px rgba(135, 201, 200, 0.2);
            background-color: #ffffff;
        }

        /* Circular progress for left panel */
        .circular-stat {
            position: relative;
            width: 80px;
            height: 80px;
            margin-right: 15px;
        }

        .circle-bg {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: #f0f0f0;
            position: absolute;
        }

        .circle-progress {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: conic-gradient(#87c9c8 0% var(--progress, 30%), transparent var(--progress, 30%) 100%);
            position: absolute;
        }

        .circle-inner {
            position: absolute;
            width: 60px;
            height: 60px;
            background-color: white;
            border-radius: 50%;
            top: 10px;
            left: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: #315564;
        }

        .left-panel .stat-item {
            display: flex;
            align-items: center;
        }

        .stat-info {
            flex: 1;
        }

        .stat-info span {
            display: block;
        }

        .stat-label {
            font-size: 0.8rem;
            color: #666;
        }

        @media (max-width: 1200px) {
            .content {
                grid-template-columns: 1fr minmax(auto, 800px) 1fr;
            }
        }

        @media (max-width: 992px) {
            .content {
                grid-template-columns: 20px 1fr 20px;
            }
            
            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
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
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        
        <!-- Enhanced Left Side Panel -->
        <div class="side-panel left-panel">
            <div class="stats-card">
                <h3>Activity Overview</h3>
                <div class="stat-item">
                    <div class="circular-stat">
                        <div class="circle-bg"></div>
                        <div class="circle-progress" style="--progress: 83%"></div>
                        <div class="circle-inner">30</div>
                    </div>
                    <div class="stat-info">
                        <span>Day Streak</span>
                        <span class="stat-label">Consistent Progress</span>
                    </div>
                </div>
                <div class="stat-item">
                    <div class="circular-stat">
                        <div class="circle-bg"></div>
                        <div class="circle-progress" style="--progress: 50%"></div>
                        <div class="circle-inner">15</div>
                    </div>
                    <div class="stat-info">
                        <span>Achievements</span>
                        <span class="stat-label">Out of 30 possible</span>
                    </div>
                </div>
                <div class="stat-item">
                    <div class="circular-stat">
                        <div class="circle-bg"></div>
                        <div class="circle-progress" style="--progress: 90%"></div>
                        <div class="circle-inner">90%</div>
                    </div>
                    <div class="stat-info">
                        <span>Completion Rate</span>
                        <span class="stat-label">Daily Tasks Finished</span>
                    </div>
                </div>
            </div>
            
            <!-- New Card -->
            <div class="stats-card">
                <h3>Skincare Goals</h3>
                <div class="stat-item">
                    <i class="fas fa-tint"></i>
                    <div class="stat-info">
                        <span>Hydration Level</span>
                        <span class="stat-label">Goal: Stay consistent</span>
                    </div>
                </div>
                <div class="stat-item">
                    <i class="fas fa-sun"></i>
                    <div class="stat-info">
                        <span>UV Protection</span>
                        <span class="stat-label">Goal: Daily application</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Profile Container -->
        <div class="profile-container">
            <div class="profile-header">
                <div class="profile-photo">
                    <img src="images/girluser1.jpg" alt="Profile Picture" id="profile-img">
                </div>
                <div class="profile-title">
                    <h2>Welcome, <%= user.getUsername() %>!</h2>
                    <p>Member since January 2024</p>
                </div>
            </div>

            <form action="UpdateProfileServlet" method="post" class="form-grid">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required>
                </div>
                <div class="form-group">
                    <label for="usermail">Email</label>
                    <input type="email" id="usermail" name="usermail" value="<%= user.getUsermail() %>" required>
                </div>
                <div class="form-group">
                    <label for="phonenumber">Phone Number</label>
                    <input type="text" id="phonenumber" name="phonenumber" value="<%= user.getPhoneNumber() %>" required>
                </div>
                <div class="form-group">
                    <label for="age">Age</label>
                    <input type="number" id="age" name="age" value="<%= user.getAge() %>" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="Male" <%= user.getGender().equals("Male") ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= user.getGender().equals("Female") ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= user.getGender().equals("Other") ? "selected" : "" %>>Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="location">Location</label>
                    <input type="text" id="location" name="location" value="<%= user.getLocation() %>" required>
                </div>
                
                <div class="button-group" style="grid-column: span 2;">
                    <button type="submit" class="update-btn">Update Profile</button>
                </div>
            </form>

            <!-- Feedback Section -->
            <div class="feedback-section">
                <h3>Share Your Feedback</h3>
                <form action="SubmitFeedbackServlet" method="post">
                    <div class="rating">
                        <input type="radio" id="star5" name="rating" value="5">
                        <label for="star5"></label>
                        <input type="radio" id="star4" name="rating" value="4">
                        <label for="star4"></label>
                        <input type="radio" id="star3" name="rating" value="3">
                        <label for="star3"></label>
                        <input type="radio" id="star2" name="rating" value="2">
                        <label for="star2"></label>
                        <input type="radio" id="star1" name="rating" value="1">
                        <label for="star1"></label>
                    </div>
                    <textarea class="feedback-text" name="feedback" placeholder="Tell us about your experience..."></textarea>
                    <button type="submit" class="update-btn">Submit Feedback</button>
                </form>
            </div>
        </div>

        <!-- Enhanced Right Side Panel -->
        <div class="side-panel right-panel">
            <div class="stats-card">
                <h3>Recent Activity</h3>
                <div class="stat-item">
                    <i class="fas fa-check-circle"></i>
                    <div class="stat-info">
                        <span>Updated Skincare Routine</span>
                        <div class="activity-chart">
                            <div class="activity-progress"></div>
                        </div>
                        <div class="activity-date">Today, 2:30 PM</div>
                    </div>
                </div>
                <div class="stat-item">
                    <i class="fas fa-trophy"></i>
                    <div class="stat-info">
                        <span>Earned New Badge</span>
                        <div class="activity-chart">
                            <div class="activity-progress"></div>
                        </div>
                        <div class="activity-date">Yesterday, 5:15 PM</div>
                    </div>
                </div>
                <div class="stat-item">
                    <i class="fas fa-tasks"></i>
                    <div class="stat-info">
                        <span>Completed Daily Goals</span>
                        <div class="activity-chart">
                            <div class="activity-progress"></div>
                        </div>
                        <div class="activity-date">Today, 9:45 AM</div>
                    </div>
                </div>
            </div>
            
            <!-- New Card -->
            <div class="stats-card">
                <h3>Upcoming Reminders</h3>
                <div class="stat-item">
                    <i class="fas fa-calendar-alt"></i>
                    <div class="stat-info">
                        <span>Weekly Exfoliation</span>
                        <span class="stat-label">Tomorrow, 8:00 PM</span>
                    </div>
                </div>
                <div class="stat-item">
                    <i class="fas fa-shopping-cart"></i>
                    <div class="stat-info">
                        <span>Restock Moisturizer</span>
                        <span class="stat-label">In 3 days</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Animation for circular progress and activity progress bars
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(function() {
                const activityBars = document.querySelectorAll('.activity-progress');
                activityBars.forEach(bar => {
                    bar.style.width = bar.parentElement.parentElement.parentElement.dataset.progress || '85%';
                });
            }, 300);
        });
    </script>
</body>
</html>