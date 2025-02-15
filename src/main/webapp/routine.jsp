<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Care Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

        /* Main Content */
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
        }

        .challenges-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .challenge-card {
            background: #fff;
            border-radius: 15px;
            padding: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: transform 0.3s ease;
            border-left: 5px solid #90c9c8;
        }

        .challenge-card:hover {
            transform: translateY(-5px);
        }

        h1 {
            font-size: 2em;
            margin-bottom: 10px;
        }

        h2 {
            color: #315564;
            margin-bottom: 15px;
            font-size: 1.5em;
        }

        .sidebar h2{
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
            transition: color 0.3s ease;
        }

        .routine-list li:before {
            content: '•';
            color: #90c9c8;
            position: absolute;
            left: 10px;
            font-size: 1.2em;
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
            background: #f59caa;
            width: 0%;
            transition: width 0.3s ease;
        }

        .challenge-tag {
            display: inline-block;
            padding: 4px 8px;
            background: #90c9c8;
            color: white;
            border-radius: 12px;
            font-size: 0.8em;
            margin-top: 5px;
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
        }

        .stat-number {
            font-size: 2em;
            color: #f59caa;
            margin: 5px 0;
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
        <div class="header">
            <h1>Your Personal Care Journey</h1>
            <p>Track your progress and achieve your beauty goals</p>
        </div>

        <div class="stats-container">
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <div class="stat-number">85%</div>
                <div>Daily Tasks Completed</div>
            </div>
            <div class="stat-card">
                <i class="fas fa-fire"></i>
                <div class="stat-number">12</div>
                <div>Day Streak</div>
            </div>
            <div class="stat-card">
                <i class="fas fa-trophy"></i>
                <div class="stat-number">8</div>
                <div>Challenges Completed</div>
            </div>
            <div class="stat-card">
                <i class="fas fa-star"></i>
                <div class="stat-number">4.8</div>
                <div>Routine Rating</div>
            </div>
        </div>

        <div class="routines-grid">
            <div class="routine-card">
                <h2><i class="fas fa-user-tie"></i> Haircare Routine</h2>
                <div>
                    <h3>Morning Routine</h3>
                    <ul class="routine-list">
                        <li>Wash with sulfate-free curly hair shampoo</li>
                        <li>Apply deep moisturizing conditioner (3-5 mins)</li>
                        <li>Use curl-defining leave-in cream</li>
                        <li>Detangle with wide-tooth comb</li>
                    </ul>

                    <h3>Night Routine</h3>
                    <ul class="routine-list">
                        <li>Massage scalp with oil</li>
                        <li>Apply hydrating leave-in serum</li>
                        <li>Protect with satin scarf/bonnet</li>
                    </ul>
                </div>
            </div>

            <div class="routine-card">
                <h2><i class="fas fa-spa"></i> Skincare Routine</h2>
                <div>
                    <h3>Morning Routine</h3>
                    <ul class="routine-list">
                        <li>Cleanse with hydrating cleanser</li>
                        <li>Apply alcohol-free toner</li>
                        <li>Use hyaluronic acid serum</li>
                        <li>Moisturize with ceramide lotion</li>
                        <li>Apply SPF 30 sunscreen</li>
                    </ul>

                    <h3>Night Routine</h3>
                    <ul class="routine-list">
                        <li>Double cleanse</li>
                        <li>Apply night serum</li>
                        <li>Use rich night cream</li>
                    </ul>
                </div>
            </div>
        </div>

        <h2>Weekly Challenges</h2>
        <div class="challenges-section">
            <div class="challenge-card" onclick="updateProgress(this, 'challenge1')">
                <h3>Hydration Hero</h3>
                <p>Use a hydrating mask 3 times this week</p>
                <span class="challenge-tag">Skincare</span>
                <div class="progress-bar">
                    <div class="progress" id="challenge1"></div>
                </div>
            </div>

            <div class="challenge-card" onclick="updateProgress(this, 'challenge2')">
                <h3>Scalp Wellness</h3>
                <p>Complete 4 scalp massage sessions</p>
                <span class="challenge-tag">Haircare</span>
                <div class="progress-bar">
                    <div class="progress" id="challenge2"></div>
                </div>
            </div>

            <div class="challenge-card" onclick="updateProgress(this, 'challenge3')">
                <h3>SPF Champion</h3>
                <p>Apply sunscreen every morning for 7 days</p>
                <span class="challenge-tag">Skincare</span>
                <div class="progress-bar">
                    <div class="progress" id="challenge3"></div>
                </div>
            </div>

            <div class="challenge-card" onclick="updateProgress(this, 'challenge4')">
                <h3>Deep Conditioning</h3>
                <p>Two deep conditioning treatments this week</p>
                <span class="challenge-tag">Haircare</span>
                <div class="progress-bar">
                    <div class="progress" id="challenge4"></div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const progressTracking = {
            challenge1: { current: 0, max: 3 },
            challenge2: { current: 0, max: 4 },
            challenge3: { current: 0, max: 7 },
            challenge4: { current: 0, max: 2 }
        };

        function updateProgress(card, challengeId) {
            const challenge = progressTracking[challengeId];
            if (challenge.current < challenge.max) {
                challenge.current++;
                const percentage = (challenge.current / challenge.max) * 100;
                document.getElementById(challengeId).style.width = `${percentage}%`;
                
                if (challenge.current === challenge.max) {
                    card.style.borderLeft = '5px solid #f59caa';
                }
            }
        }

        document.querySelectorAll('.routine-list li').forEach(item => {
            item.addEventListener('click', () => {
                item.classList.toggle('completed');
            });
        });
    </script>
</body>
</html>