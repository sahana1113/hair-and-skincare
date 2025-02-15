<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do List</title>
    <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

html, body {
    height: 100%;
    width: 100%;
    overflow-x: hidden;
    background-color: #f3e9f1;
}

.container {
    margin-left: 90px;
    min-height: 100vh;
    padding: 30px;
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: auto 1fr auto;
    gap: 20px;
}

.page-header {
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    margin-bottom: 20px;
}

.page-header h2 {
    color: #5d4e6d;
    font-size: 2rem;
    margin-bottom: 10px;
}

.todo-sections {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    margin-bottom: 20px;
}

.todo-section {
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.section-header {
    color: #7c6990;
    font-size: 1.2rem;
    margin-bottom: 15px;
    padding-bottom: 10px;
    border-bottom: 2px solid #e0c1f4;
}

.todo-item {
    background: #f8f3fa;
    margin: 10px 0;
    padding: 15px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    transition: transform 0.2s ease;
}

.todo-item:hover {
    transform: translateX(5px);
}

.todo-item label {
    display: flex;
    align-items: center;
    color: #5d4e6d;
    font-size: 1rem;
    cursor: pointer;
    width: 100%;
}

.checkbox {
    appearance: none;
    width: 20px;
    height: 20px;
    border: 2px solid #e0c1f4;
    border-radius: 6px;
    margin-right: 15px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.checkbox:checked {
    background-color: #c9a0dc;
    border-color: #c9a0dc;
    position: relative;
}

.checkbox:checked::after {
    content: '✓';
    position: absolute;
    color: white;
    font-size: 14px;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}

.checkbox:checked + span {
    text-decoration: line-through;
    color: #a094ab;
}

.add-todo {
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    margin-top: 20px;
}

.add-todo-form {
    display: flex;
    gap: 10px;
}

.add-todo input[type="text"] {
    flex: 1;
    padding: 12px;
    border: 2px solid #e0c1f4;
    border-radius: 10px;
    font-size: 1rem;
    color: #5d4e6d;
}

.add-todo input[type="text"]:focus {
    outline: none;
    border-color: #c9a0dc;
}

.add-btn {
    padding: 12px 24px;
    background: #c9a0dc;
    border: none;
    border-radius: 10px;
    color: white;
    cursor: pointer;
    transition: background 0.3s ease;
}

.add-btn:hover {
    background: #b78ed0;
}

.todo-summary {
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
    margin-top: 20px;
}

.summary-stats {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    text-align: center;
}

.stat-item {
    padding: 15px;
    background: #f8f3fa;
    border-radius: 10px;
}

.stat-number {
    font-size: 2rem;
    color: #7c6990;
    font-weight: bold;
}

.stat-label {
    color: #5d4e6d;
    margin-top: 5px;
}


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
.sidebar h2 {
            color: #856c6c;
            margin-bottom: 20px;
            font-size: 1.8rem;
            border-bottom: 2px solid #f3d7d7;
            padding-bottom: 10px;
}

a {
    text-decoration: none;
    color: #444;
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

    </style>
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
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
<div class="container">
    <div class="page-header">
        <h2>To-Do List</h2>
        <p>Organize your tasks and boost productivity</p>
    </div>
    
    <div class="todo-sections">
        <div class="todo-section">
            <h3 class="section-header">Today's Tasks</h3>
            <div class="todo-item">
                <label>
                    <input type="checkbox" class="checkbox">
                    <span>Complete AI model training</span>
                </label>
            </div>
            <div class="todo-item">
                <label>
                    <input type="checkbox" class="checkbox">
                    <span>Design skincare UI</span>
                </label>
            </div>
        </div>

        <div class="todo-section">
            <h3 class="section-header">Upcoming Tasks</h3>
            <div class="todo-item">
                <label>
                    <input type="checkbox" class="checkbox">
                    <span>Implement reward system</span>
                </label>
            </div>
            <div class="todo-item">
                <label>
                    <input type="checkbox" class="checkbox">
                    <span>Debug backend issues</span>
                </label>
            </div>
        </div>
    </div>

    <div class="add-todo">
        <form class="add-todo-form">
            <input type="text" placeholder="Add a new task...">
            <button type="submit" class="add-btn">Add Task</button>
        </form>
    </div>

    <div class="todo-summary">
        <div class="summary-stats">
            <div class="stat-item">
                <div class="stat-number">4</div>
                <div class="stat-label">Total Tasks</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">2</div>
                <div class="stat-label">Completed</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">2</div>
                <div class="stat-label">Pending</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
