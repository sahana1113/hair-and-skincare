<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.SkinDao, com.pojo.SkinDetails" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Skincare Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
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
        .container {
            margin-left: 220px;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333333;
        }
        .section {
            margin-bottom: 20px;
        }
        button {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #2980b9;
        }
        .table-container {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
        }
        th, td {
            text-align: left;
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
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
    
</head>
<body>
    <!-- Sidebar -->
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

    <!-- Main Content -->
    <div class="container">
        <h1>Skincare Details</h1>

        <%
            // Retrieve user ID from session
            String userId = (String) session.getAttribute("user_id");
            SkinDao skinDao = new SkinDao();
            SkinDetails skinDetails = skinDao.getSkinDetailsByUserId(userId);

            if (skinDetails != null) {
        %>
        <!-- Current Routine Based on AI Recommendation -->
        <div class="section">
            <h2>Current Routine (AI Recommendation)</h2>
            <ul>
                <% 
                    List<String> aiRoutine = skinDetails.getCurrentProducts(); // Replace with AI output
                    if (aiRoutine != null && !aiRoutine.isEmpty()) {
                        for (String step : aiRoutine) { 
                %>
                    <li><%= step %></li>
                <% 
                        }
                    } else { 
                %>
                    <li>No AI recommendation available.</li>
                <% } %>
            </ul>
        </div>

        <!-- Skincare Details -->
        <div class="section">
            <h2>Your Skincare Details</h2>
               <p><strong>Skin Type:</strong> <%= skinDetails.getSkinType() != null ? skinDetails.getSkinType() : "Not provided" %></p>
        </div>

        <div class="section">
            <h2>Skin Concerns</h2>
            <ul>
                <% 
                    List<String> concerns = skinDetails.getSkinConcerns();
                    if (concerns != null && !concerns.isEmpty()) {
                        for (String concern : concerns) { 
                %>
                    <li><%= concern %></li>
                <% 
                        }
                    } else { 
                %>
                    <li>No concerns available</li>
                <% } %>
            </ul>
        </div>

        <div class="section">
            <h2>Goals</h2>
            <ul>
                <% 
                    List<String> goals = skinDetails.getGoals();
                    if (goals != null && !goals.isEmpty()) {
                        for (String goal : goals) { 
                %>
                    <li><%= goal %></li>
                <% 
                        }
                    } else { 
                %>
                    <li>No goals available</li>
                <% } %>
            </ul>
        </div>

        <div class="section">
            <h2>Current Routine</h2>
            <p><strong>Frequency:</strong> <%= skinDetails.getSkincareFrequency() != null ? skinDetails.getSkincareFrequency() : "Not provided" %></p>
            <ul>
                <% 
                    List<String> products = skinDetails.getCurrentProducts();
                    if (products != null && !products.isEmpty()) {
                        for (String product : products) { 
                %>
                    <li><%= product %></li>
                <% 
                        }
                    } else { 
                %>
                    <li>No products listed</li>
                <% } %>
            </ul>
        </div>

        <div class="section">
            <h2>Allergies</h2>
            <p><strong>Has Allergies:</strong> <%= skinDetails.getAllergies() != null && !skinDetails.getAllergies().contains("No") ? "Yes" : "No" %></p>
            <% 
                if (skinDetails.getAllergies() != null && !skinDetails.getAllergies().contains("No")) { 
            %>
                <p><strong>Details:</strong> <%= skinDetails.getAllergies().get(0) != null ? skinDetails.getAllergies().get(0) : "No allergy details" %></p>
            <% } %>
        </div>

        <div class="section">
            <h2>Habits</h2>
            <p><strong>Sun Exposure:</strong> <%= skinDetails.getSunExposure() != null ? skinDetails.getSunExposure() : "Not provided" %></p>
            <p><strong>Water Intake:</strong> <%= skinDetails.getWaterIntake() != null ? skinDetails.getWaterIntake() : "Not provided" %></p>
            <h3>Product Preferences</h3>
            <ul>
                <% 
                    List<String> preferences = skinDetails.getProductPreference();
                    if (preferences != null && !preferences.isEmpty()) {
                        for (String preference : preferences) { 
                %>
                    <li><%= preference %></li>
                <% 
                        }
                    } else { 
                %>
                    <li>No preferences available</li>
                <% } %>
            </ul>
            <h3>Skin Treatments</h3>
            <ul>
                <% 
                    List<String> treatments = skinDetails.getSkinTreatment();
                    if (treatments != null && !treatments.isEmpty()) {
                        for (String treatment : treatments) { 
                %>
                    <li><%= treatment %></li>
                <% 
                        }
                    } else { 
                %>
                    <li>No treatments listed</li>
                <% } %>
            </ul>
        </div>

        <!-- Generate New Recommendation -->
        <div class="section">
            <h2>Generate a New Recommendation</h2>
            <form action="skincare_question.jsp" method="post">
                <input type="hidden" name="user_id" value="<%= userId %>">
                <button type="submit">Generate New Recommendation</button>
            </form>
        </div>

        <!-- Past Recommendations -->
        <div class="section">
            <h2>Past Recommendations</h2>
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
                            <td><%= recommendation %></td>
                        </tr>
                        <% 
                                }
                            } else { 
                        %>
                        <tr>
                            <td colspan="2">No past recommendations found.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <% } else { %>
            <p>No skincare details found for the user with ID <%= userId %>.</p>
        <% } %>
    </div>
</body>
</html>
