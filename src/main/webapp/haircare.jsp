<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Haircare Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --pastel-pink: #ffd6e0;
            --pastel-blue: #c5e4e7;
            --pastel-purple: #e6e6fa;
            --pastel-green: #d4e6d4;
            --text-primary: #4a5568;
            --shadow: rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding-left: 70px;
            min-height: 100vh;
            background: linear-gradient(135deg, var(--pastel-blue) 0%, var(--pastel-pink) 100%);
            color: var(--text-primary);
        }

        /* Sidebar Styles */
        .sidebar {
            width: 70px;
            background-color: rgba(49,85,100,0.9);
            position: fixed;
            height: 100%;
            top: 0;
            left: 0;
            transition: width 0.3s ease;
            overflow: hidden;
            z-index: 100;
        }

        .sidebar:hover {
            width: 250px;
        }

        .sidebar-header {
            padding: 20px;
            text-align: center;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .sidebar:hover .sidebar-header {
            opacity: 1;
        }

        .sidebar-header h2 a {
            color: white;
            text-decoration: none;
        }

        .sidebar-nav ul {
            list-style: none;
            margin-top: 20px;
        }

        .sidebar-nav li a {
            color: white;
            padding: 15px;
            display: flex;
            align-items: center;
            text-decoration: none;
            transition: 0.3s;
        }

        .sidebar-nav li a:hover {
            background-color: var(--pastel-blue);
            color: var(--text-primary);
        }

        .sidebar-nav li a i {
            font-size: 1.2rem;
            min-width: 35px;
        }

        .sidebar-text {
            display: none;
        }

        .sidebar:hover .sidebar-text {
            display: inline;
        }

        /* Main Content */
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
        }

        .section {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 4px 15px var(--shadow);
            transition: transform 0.3s;
        }

        .section:hover {
            transform: translateY(-5px);
        }

        h1 {
            grid-column: 1 / -1;
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 2rem;
            color: var(--text-primary);
        }

        h2 {
            color: var(--text-primary);
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--pastel-blue);
        }

        ul {
            list-style: none;
        }

        li {
            padding: 0.8rem;
            margin: 0.5rem 0;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 8px;
            border-left: 4px solid var(--pastel-blue);
        }

        button {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, var(--pastel-blue), var(--pastel-purple));
            border: none;
            border-radius: 8px;
            color: var(--text-primary);
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px var(--shadow);
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--pastel-blue);
        }

        th {
            background: var(--pastel-blue);
        }

        .logout-btn {
            background-color: #e74c3c;
            margin-top: 30px;
            border-radius: 5px;
        }

        .logout-btn:hover {
            background-color: #c0392b;
        }

        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <aside class="sidebar">
        <div class="sidebar-header">
            <h2><a href="#">Dashboard</a></h2>
        </div>
        <nav class="sidebar-nav">
            <ul>
                <li><a href="#"><i class="fas fa-user"></i><span class="sidebar-text">Profile</span></a></li>
                <li><a href="#"><i class="fas fa-calendar-day"></i><span class="sidebar-text">Daily Routine</span></a></li>
                <li><a href="#"><i class="fas fa-spa"></i><span class="sidebar-text">Skincare</span></a></li>
                <li><a href="#"><i class="fas fa-user-tie"></i><span class="sidebar-text">Haircare</span></a></li>
                <li><a href="#"><i class="fas fa-heartbeat"></i><span class="sidebar-text">Track Habits</span></a></li>
                <li><a href="#"><i class="fas fa-list"></i><span class="sidebar-text">To-Do List</span></a></li>
                <li><a href="#"><i class="fas fa-fire"></i><span class="sidebar-text">Streak</span></a></li>
                <li><a href="#"><i class="fas fa-trophy"></i><span class="sidebar-text">Rewards</span></a></li>
                <li><a href="#" class="logout-btn"><i class="fas fa-sign-out-alt"></i><span class="sidebar-text">Logout</span></a></li>
            </ul>
        </nav>
    </aside>

    <div class="container">
        <h1>Haircare Details</h1>
        
        <div class="section">
            <h2>Current Routine (AI Recommendation)</h2>
            <ul>
                <li>Sulfate-free shampoo twice a week</li>
                <li>Deep conditioning treatment weekly</li>
                <li>Leave-in conditioner after wash</li>
            </ul>
        </div>

        <div class="section">
            <h2>Hair Type Details</h2>
            <p><strong>Hair Type:</strong> Type 2B</p>
            <p><strong>Hair Length:</strong> Medium</p>
            <p><strong>Hair Texture:</strong> Fine</p>
        </div>

        <div class="section">
            <h2>Concerns</h2>
            <h3>Hair Concerns</h3>
            <ul>
                <li>Split ends</li>
                <li>Frizz</li>
                <li>Lack of volume</li>
            </ul>
            <h3>Scalp Concerns</h3>
            <ul>
                <li>Dryness</li>
                <li>Occasional itchiness</li>
            </ul>
        </div>

        <div class="section">
            <h2>Goals</h2>
            <p><strong>Growth Goals:</strong> 6 inches in 12 months</p>
        </div>

        <div class="section">
            <h2>Generate New Recommendation</h2>
            <button type="submit">Generate New Recommendation</button>
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
                        <tr>
                            <td>2025-01-20</td>
                            <td>Weekly protein treatment added</td>
                        </tr>
                        <tr>
                            <td>2025-01-13</td>
                            <td>Scalp massage routine introduced</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>