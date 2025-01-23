<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.HairDao, com.pojo.HairDetails" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Haircare Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
      * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
a {
    text-decoration: none;
    color: #444;
}
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .sidebar {
            width: 70px;
            background-color: rgba(49,85,100,0.9);
            color: #ffffff;
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
            color: #ffffff;
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
            width: 250px;
            background-color: #2e4c5a;
        }

        .sidebar:hover .sidebar-nav li a .sidebar-text {
            display: inline;
        }

        .sidebar-nav li a:hover {
            padding-left: 20px;
            background-color: #87c9c8;
            color: black;
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

        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .container {
                margin-left: 0;
            }
        }
    </style>
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
                <li><a href="skincare.jsp"><i class="fas fa-spa"></i><span class="sidebar-text">Skincare</span></a></li>
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
        <h1>Haircare Details</h1>

        <%
            String userId = (String) session.getAttribute("user_id");
            HairDao hairDao = new HairDao();
            HairDetails hairDetails = hairDao.getHairDetailsByUserId(userId);

            if (hairDetails != null) {
        %>
        <div class="section">
            <h2>Current Routine (AI Recommendation)</h2>
            <ul>
                <% 
                    List<String> aiRoutine = hairDetails.getCurrentProducts();
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

        <div class="section">
            <div>
            <h2>Hair Type Details</h2>
            <p><strong>Hair Type:</strong> <%= hairDetails.getHairType() != null ? hairDetails.getHairType() : "Not provided" %></p>
            <p><strong>Hair Length:</strong> <%= hairDetails.getHairLength() != null ? hairDetails.getHairLength() : "Not provided" %></p>
            <p><strong>Hair Texture:</strong> <%= hairDetails.getHairTexture() != null ? hairDetails.getHairTexture() : "Not provided" %></p>
        </div>

        <div>
            <h2>Concerns</h2>
            <h3>Hair Concerns</h3>
            <ul>
                <% 
                    List<String> hairConcerns = hairDetails.getHairConcerns();
                    if (hairConcerns != null && !hairConcerns.isEmpty()) {
                        for (String concern : hairConcerns) { 
                %>
                    <li><%= concern %></li>
                <% 
                        }
                    } else { 
                %>
                    <li>No concerns available</li>
                <% } %>
            </ul>
            <h3>Scalp Concerns</h3>
            <ul>
                <% 
                    List<String> scalpConcerns = hairDetails.getScalpConcerns();
                    if (scalpConcerns != null && !scalpConcerns.isEmpty()) {
                        for (String concern : scalpConcerns) { 
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

        <div>
            <h2>Goals</h2>
            <p><strong>Growth Goals:</strong> <%= hairDetails.getGrowthGoals() != null ? hairDetails.getGrowthGoals() : "Not provided" %></p>
        </div>

        <div>
            <h2>Current Routine</h2>
            <p><strong>Wash Frequency:</strong> <%= hairDetails.getWashFrequency() != null ? hairDetails.getWashFrequency() : "Not provided" %></p>
            <h3>Products Used:</h3>
            <ul>
                <% 
                    List<String> products = hairDetails.getCurrentProducts();
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

        <div>
            <h2>Allergies</h2>
            <p><strong>Natural Product Preference:</strong> <%= hairDetails.getNaturalProductPreference().equals("true") ? "Yes" : "No" %></p>
            <h3>Allergy Details:</h3>
            <ul>
                <% 
                    List<String> allergies = hairDetails.getAllergies();
                    if (allergies != null && !allergies.isEmpty()) {
                        for (String allergy : allergies) { 
                %>
                    <li><%= allergy %></li>
                <% 
                        }
                    } else { 
                %>
                    <li>No allergies listed</li>
                <% } %>
            </ul>
        </div>
        <div class="section">
            <h2>Generate a New Recommendation</h2>
            <form action="haircare_question.jsp" method="post">
                <input type="hidden" name="user_id" value="<%= userId %>">
                <button type="submit">Generate New Recommendation</button>
            </form>
        </div>

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
            <p>No haircare details found for the user with ID <%= userId %>.</p>
        <% } %>
    </div>
</body>
</html>
