<!DOCTYPE html>
<html>
<head>
    <title>Create New To-Do</title>
    <style>
    * {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

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


a {
	text-decoration: none;
	color: #444;
}

/* Existing styles remain unchanged */
.form-container {
    max-width: 800px;
    margin: 2rem auto;
    padding: 2rem;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.header {
    text-align: center;
    margin-bottom: 2rem;
}

.header img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-bottom: 1rem;
}

.header h1 {
    color: #2c3e50;
    font-size: 2rem;
    margin-bottom: 0.5rem;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    color: #2c3e50;
    font-weight: 500;
}

.form-group input[type="text"],
.form-group input[type="date"],
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 0.8rem;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 1rem;
    transition: border-color 0.3s ease;
}

.form-group textarea {
    height: 120px;
    resize: vertical;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
    border-color: #87c9c8;
    outline: none;
}

button[type="submit"] {
    width: 100%;
    padding: 1rem;
    background: #87c9c8;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 1.1rem;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
    background: #6ab3b2;
}

/* Additional features */
.features-container {
    max-width: 800px;
    margin: 2rem auto;
    padding: 2rem;
}

.quick-templates {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    padding: 2rem;
    margin-bottom: 2rem;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.templates-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
    margin-top: 1rem;
}

.template-card {
    background: #f8f9fa;
    padding: 1rem;
    border-radius: 10px;
    cursor: pointer;
    transition: transform 0.3s ease;
}

.template-card:hover {
    transform: translateY(-5px);
    background: #e9ecef;
}

.tips-section {
    background: linear-gradient(135deg, #87c9c8 0%, #6ab3b2 100%);
    border-radius: 20px;
    padding: 2rem;
    color: white;
    margin-bottom: 2rem;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.tips-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1.5rem;
    margin-top: 1rem;
}

.tip-card {
    background: rgba(255, 255, 255, 0.1);
    padding: 1.5rem;
    border-radius: 15px;
    backdrop-filter: blur(4px);
}

.tip-card i {
    font-size: 1.5rem;
    margin-bottom: 0.5rem;
}

.recent-todos {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    padding: 2rem;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.todo-list {
    margin-top: 1rem;
}

.todo-item {
    display: flex;
    align-items: center;
    padding: 1rem;
    background: #f8f9fa;
    border-radius: 10px;
    margin-bottom: 0.5rem;
    transition: transform 0.3s ease;
}

.todo-item:hover {
    transform: translateX(10px);
    background: #e9ecef;
}

.todo-status {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    margin-right: 1rem;
}

.status-pending { background: #ffd43b; }
.status-completed { background: #51cf66; }
.status-overdue { background: #ff6b6b; }
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
.sidebar h2 {
            color: #856c6c;
            margin-bottom: 20px;
            font-size: 1.8rem;
            border-bottom: 2px solid #f3d7d7;
            padding-bottom: 10px;
}

.quotes-container {
    position: fixed;
    right: 40px;
    top: 50%;
    transform: translateY(-50%);
    width: 300px;
    padding: 20px;
}

.quote-card {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 15px;
    padding: 2rem;
    box-shadow: 0 8px 32px rgba(255, 178, 158, 0.15);
    backdrop-filter: blur(4px);
    text-align: center;
    opacity: 0;
    transform: translateX(20px);
    animation: slideIn 0.5s ease forwards;
}

.quote-icon {
    color: #ff9980;
    font-size: 2rem;
    margin-bottom: 1rem;
}

.quote-text {
    font-size: 1.1rem;
    color: #4a4a4a;
    line-height: 1.6;
    margin-bottom: 1rem;
    font-style: italic;
}

.quote-author {
    color: #ff9980;
    font-weight: 500;
    font-size: 0.9rem;
}

@keyframes slideIn {
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

@keyframes fadeOut {
    from {
        opacity: 1;
        transform: translateX(0);
    }
    to {
        opacity: 0;
        transform: translateX(20px);
    }
}

/* Responsive Design */
@media (max-width: 1200px) {
    .quotes-container {
        position: static;
        transform: none;
        margin: 2rem auto;
    }
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
    <div>
        <section class="form-container">
                    
        <div class="header">
            <img src="images/todoicon.jpg" alt="Skincare">
            <h1>Create New To-Do</h1>
        </div>
            <form action="CreateTodoServlet" method="post">
                <div class="form-group">
                    <label for="taskName">Task Name:</label>
                    <input type="text" id="taskName" name="taskName" required>
                </div>

                <div class="form-group">
                    <label for="taskDescription">Task Description:</label>
                    <textarea id="taskDescription" name="taskDescription"></textarea>
                </div>

                <div class="form-group">
                    <label for="dueDate">Due Date:</label>
                    <input type="date" id="dueDate" name="dueDate">
                </div>

                <div class="form-group">
                    <label for="status">Status:</label>
                    <select id="status" name="status" required>
                        <option value="Pending">Pending</option>
                        <option value="Completed">Completed</option>
                        <option value="Overdue">Overdue</option>
                    </select>
                </div>

                <button type="submit">Create To-Do</button>
            </form>
        </section>
        <div class="features-container">
    <!-- Quick Templates Section -->
    <div class="quick-templates">
        <h2> Quick Templates</h2>
        <div class="templates-grid">
            <div class="template-card">
                <h3>Morning Routine</h3>
                <p>Daily tasks to start your day</p>
            </div>
            <div class="template-card">
                <h3>Work Tasks</h3>
                <p>Common work-related todos</p>
            </div>
            <div class="template-card">
                <h3>Self-Care</h3>
                <p>Wellness and self-care activities</p>
            </div>
            <div class="template-card">
                <h3>Evening Routine</h3>
                <p>Wind-down activities</p>
            </div>
        </div>
    </div>

    <!-- Tips Section -->
    <div class="tips-section">
        <h2> Tips for Effective To-Dos</h2>
        <div class="tips-grid">
            <div class="tip-card">
                <i class="fas fa-check"></i>
                <h3>Be Specific</h3>
                <p>Write clear, actionable tasks</p>
            </div>
            <div class="tip-card">
                <i class="fas fa-clock"></i>
                <h3>Set Deadlines</h3>
                <p>Add due dates to stay on track</p>
            </div>
            <div class="tip-card">
                <i class="fas fa-list-ol"></i>
                <h3>Break It Down</h3>
                <p>Split big tasks into smaller ones</p>
            </div>
        </div>
    </div>

    <!-- Recent To-Dos -->
    <div class="recent-todos">
        <h2>Recent To-Dos</h2>
        <div class="todo-list">
            <div class="todo-item">
                <span class="todo-status status-completed"></span>
                <span>Complete morning skincare routine</span>
            </div>
            <div class="todo-item">
                <span class="todo-status status-pending"></span>
                <span>Weekly hair mask treatment</span>
            </div>
            <div class="todo-item">
                <span class="todo-status status-overdue"></span>
                <span>Evening meditation session</span>
            </div>
        </div>
    </div>
</div>
        </div>
        <div class="quotes-container">
    <div class="quote-card">
        <i class="fas fa-quote-left quote-icon"></i>
        <p class="quote-text"></p>
        <p class="quote-author"></p>
    </div>
</div>
        
    </main>
    
<script>
const quotes = [
    {
        text: "The only way to do great work is to love what you do.",
        author: "Steve Jobs"
    },
    {
        text: "Small progress is still progress.",
        author: "Anonymous"
    },
    {
        text: "Done is better than perfect.",
        author: "Sheryl Sandberg"
    },
    {
        text: "Your future self will thank you for starting today.",
        author: "Anonymous"
    },
    {
        text: "Break your big goals into small, manageable tasks.",
        author: "Anonymous"
    },
    {
        text: "Organization is the key to productivity.",
        author: "Anonymous"
    },
    {
        text: "Every accomplishment starts with the decision to try.",
        author: "Anonymous"
    },
    {
        text: "Focus on progress, not perfection.",
        author: "Anonymous"
    }
];

let currentQuoteIndex = 0;
const quoteCard = document.querySelector('.quote-card');
const quoteText = document.querySelector('.quote-text');
const quoteAuthor = document.querySelector('.quote-author');

function updateQuote() {
    quoteCard.style.animation = 'fadeOut 0.5s ease forwards';
    
    setTimeout(() => {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.length;
        quoteText.textContent = quotes[currentQuoteIndex].text;
        quoteAuthor.textContent = '- ' + quotes[currentQuoteIndex].author;
        
        quoteCard.style.animation = 'slideIn 0.5s ease forwards';
    }, 500);
}

// Set initial quote
quoteText.textContent = quotes[0].text;
quoteAuthor.textContent = '- ' + quotes[0].author;

// Update quote every 5 seconds
setInterval(updateQuote, 5000);
</script>
</body>
</html>
