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
        /* Include the same styles from your dashboard here */
        /* Sidebar Styles */
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
        a {
    text-decoration: none;
    color: #444;
}
/* Base styles */
body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(135deg, #e6f7f6 0%, #fff2f1 100%);
    background-attachment: fixed;
    color: #333;
    padding-left: 70px;
    margin: 0;
    min-height: 100vh;
    display: flex;
}

/* Content Layout */
.content {
    flex: 1;
    padding: 2rem;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
    background: rgba(255, 255, 255, 0.1);
}

.profile-container {
    max-width: 1000px;
    width: 100%;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    padding: 3rem;
    backdrop-filter: blur(8px);
    margin: 2rem auto;
    display: grid;
    grid-template-columns: 1fr;
    gap: 2rem;
    min-height: calc(100vh - 4rem);
}

/* Profile Photo Section */
.profile-photo {
    text-align: center;
    position: relative;
    padding: 2rem 0;
}

#profile-img {
    width: 200px;
    height: 200px;
    border-radius: 50%;
    border: 8px solid #fff;
    box-shadow: 0 4px 25px rgba(0, 0, 0, 0.15);
    object-fit: cover;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

#profile-img:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 30px rgba(135, 201, 200, 0.3);
}

/* Form Layout */
form {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    align-content: start;
}

.form-group {
    margin-bottom: 2rem;
    position: relative;
}

.form-group label {
    display: block;
    margin-bottom: 0.8rem;
    color: #555;
    font-weight: 600;
    font-size: 1rem;
    transition: color 0.3s ease;
}

input[type="text"],
input[type="email"],
input[type="number"],
select {
    width: 100%;
    padding: 1rem;
    border: 2px solid rgba(135, 201, 200, 0.3);
    border-radius: 12px;
    font-size: 1.1rem;
    transition: all 0.3s ease;
    background: rgba(255, 255, 255, 0.9);
}

/* Button Styling */
.update-btn {
    grid-column: 1 / -1;
    padding: 1.2rem;
    background: linear-gradient(135deg, #87c9c8 0%, #6ab7b6 100%);
    color: white;
    border: none;
    border-radius: 12px;
    font-size: 1.1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 2rem;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.update-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(135, 201, 200, 0.4);
}

/* Responsive Design */
@media (max-width: 768px) {
    .profile-container {
        margin: 1rem;
        padding: 1.5rem;
        gap: 1.5rem;
    }
    
    form {
        grid-template-columns: 1fr;
    }
    
    #profile-img {
        width: 150px;
        height: 150px;
    }
    
    .form-group {
        margin-bottom: 1.5rem;
    }
}

/* Animation for content load */
.profile-container {
    animation: slideUp 0.6s ease-out;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Decorative elements */
.profile-container::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 200px;
    background: linear-gradient(135deg, #87c9c8 0%, #6ab7b6 100%);
    opacity: 0.1;
    border-radius: 20px 20px 0 0;
    z-index: -1;
}.sidebar {
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
.sidebar h2 {
            color: #856c6c;
            margin-bottom: 20px;
            font-size: 1.8rem;
            border-bottom: 2px solid #f3d7d7;
            padding-bottom: 10px;
}


        .content {
            margin-left: 80px;
            flex-grow: 1;
            padding: 20px;
            transition: margin-left 0.3s ease;
        }

        .sidebar:hover ~ .content {
            margin-left: 250px;
        }

    </style>
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
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
                <li><a href="logout.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i><span class="sidebar-text">Logout</span></a></li>
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
    }
%>
        
        <div class="profile-container">
            <!-- Profile Picture -->
            <div class="profile-photo text-center">
                <img src="images/girluser1.jpg" alt="Profile Picture" id="profile-img">
            </div>

            <!-- User Details Form -->
            <form action="UpdateProfileServlet" method="post">
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
                <button type="submit" class="update-btn">Update Profile</button>
            </form>
        </div>
    </div>
</body>
</html>
