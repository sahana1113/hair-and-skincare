
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Skincare Questions</title>
<style>
/* Global Styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}


body {
	font-family: 'Arial', sans-serif;
	background: linear-gradient(135deg, #f5e6e8 0%, #e2f0f3 100%);
	background-size: cover;
	margin: 0;
	padding: 0;
	color: #333;
	height: 100%;
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

/* Container Styles */
.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 2rem;
	background: rgba(255, 255, 255, 0.95);
	border-radius: 20px;
	box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
	backdrop-filter: blur(4px);
}

/* Header Styles */
.header {
	text-align: center;
	margin-bottom: 3rem;
	padding: 1rem;
}

.header h1 {
	font-size: 2.5rem;
	color: #7c5c6c;
	margin-bottom: 1rem;
	font-weight: 600;
}

.header img {
	max-width: 150px;
	border-radius: 50%;
	margin-bottom: 1.5rem;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

/* Question Styles */
#question-text {
	font-size: 1.5rem;
	color: #5a6b7c;
	margin-bottom: 2rem;
	text-align: center;
	line-height: 1.4;
}

/* Options Container */
#options-container {
	display: grid;
	gap: 1rem;
	margin-bottom: 2rem;
}

/* Option Buttons */
.option-button {
	background: #fff;
	border: 2px solid #e8e8e8;
	padding: 1rem 1.5rem;
	border-radius: 12px;
	font-size: 1rem;
	color: #666;
	transition: all 0.3s ease;
	cursor: pointer;
	text-align: left;
}

.option-button:hover {
	background: #fdf4f5;
	border-color: #f4c7cd;
	transform: translateY(-2px);
}

.option-button.selected {
	background: #f8e5e7;
	border-color: #e9a7af;
	color: #c45a67;
	font-weight: 500;
}

/* Other Input Field */
.other-input {
	width: 100%;
	padding: 1rem;
	border: 2px solid #e8e8e8;
	border-radius: 12px;
	margin-bottom: 2rem;
	font-size: 1rem;
	display: none;
}

.other-input:focus {
	outline: none;
	border-color: #c7dfe3;
}

/* Button Group */
.button-group {
	display: flex;
	justify-content: space-between;
	gap: 1rem;
	margin-top: 2rem;
}

/* Navigation Buttons */
#back-button, #next-button, #submit-button {
	padding: 0.8rem 2rem;
	border-radius: 10px;
	font-size: 1rem;
	cursor: pointer;
	transition: all 0.3s ease;
	border: none;
	font-weight: 500;
}

#back-button {
	background: #fff;
	border: 2px solid #e8e8e8;
	color: #666;
}

#back-button:hover {
	background: #f8f8f8;
}

#next-button, #submit-button {
	background: #a7c5eb;
	color: white;
}

#next-button:hover, #submit-button:hover {
	background: #89b0e5;
	transform: translateY(-2px);
}

/* Progress Indicator */
.progress-bar {
	width: 100%;
	height: 6px;
	background: #e8e8e8;
	border-radius: 3px;
	margin-top: 2rem;
	overflow: hidden;
}

.progress-fill {
	height: 100%;
	background: linear-gradient(90deg, #a7c5eb, #f4c7cd);
	transition: width 0.3s ease;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.container {
		padding: 1rem;
	}
	.header h1 {
		font-size: 2rem;
	}
	#question-text {
		font-size: 1.2rem;
	}
	.option-button {
		padding: 0.8rem 1.2rem;
	}
	.button-group {
		flex-direction: column;
	}
	#back-button, #next-button, #submit-button {
		width: 100%;
	}
}

/* Animations */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.container {
	animation: fadeIn 0.5s ease-out;
}

/* Sidebar Modifications */
.sidebar {
	background: rgba(167, 197, 235, 0.95);
	backdrop-filter: blur(4px);
}

.sidebar:hover {
	background: rgba(137, 176, 229, 0.95);
}

.sidebar-nav li a:hover {
	background: rgba(244, 199, 205, 0.3);
}

/* Custom Scrollbar */
::-webkit-scrollbar {
	width: 8px;
}

::-webkit-scrollbar-track {
	background: #f1f1f1;
}

::-webkit-scrollbar-thumb {
	background: #a7c5eb;
	border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
	background: #89b0e5;
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
	<div class="container">
		<div class="header">
			<img src="images/skincareques.jpg" alt="Skincare">
			<h1>Let's Talk About Your Skin!</h1>
		</div>
		<h2 id="question-text"></h2>
		<div id="options-container"></div>
		<input type="text" id="other-option-input" class="other-input"
			placeholder="Please specify here">
		<div class="button-group">
			<button id="back-button" onclick="goBack()">Back</button>
			<button id="submit-button" style="display: none;"
				onclick="submitAnswers()">Submit</button>
			<button id="next-button" onclick="nextQuestion()">Next</button>
		</div>
	</div>
	<script>
	        // Questions and options
	        const questions = [
	            { field: "skin_type", text: "What is your skin type?", options: ["Oily", "Dry", "Combination", "Normal", "Sensitive"], multiple: false },
	            { field: "skin_concerns", text: "What are your primary skin concerns? (Multiple selections allowed)", options: ["Acne or breakouts", "Dark spots or hyperpigmentation", "Fine lines and wrinkles", "Redness or irritation", "Uneven skin tone", "Dullness", "Dryness or flakiness", "Enlarged pores", "Sensitivity", "Other"], multiple: true },
	            { field: "skin_goals", text: "What are your skin goals?", options: ["Clear acne", "Even out skin tone", "Brighten complexion", "Reduce wrinkles and fine lines", "Hydrate skin", "Improve skin elasticity", "Reduce redness", "Minimize pores", "Achieve glowing skin", "Other"], multiple: true },
	            { field: "skincare_frequency", text: "How often do you use skincare products?", options: ["Daily", "Occasionally", "Rarely", "Never"], multiple: false },
	            { field: "current_products", text: "What type of skincare products are you currently using? (Multiple selections allowed)", options: ["Cleanser", "Toner", "Serum", "Moisturizer", "Sunscreen", "Exfoliator (physical or chemical)", "Face mask", "Eye cream", "Spot treatment", "None"], multiple: true },
	            { field: "allergies", text: "Do you have any known allergies or sensitivities to skincare ingredients?", options: ["Yes I have", "No", "Not sure"], multiple: true },
	            { field: "sun_exposure", text: "How often are you exposed to the sun?", options: ["Rarely", "Occasionally", "Daily (with sunscreen)", "Daily (without sunscreen)"], multiple: false },
	            { field: "skin_texture", text: "What is your skin texture like?", options: ["Smooth", "Rough or uneven", "Bumpy (e.g., small pimples or blackheads)", "Other"], multiple: false },
	            { field: "regular_experiences", text: "Do you experience any of the following regularly? (Multiple selections allowed)", options: ["Excessive oiliness", "Flaking or peeling", "Itching or burning", "Tightness after cleansing", "None of the above"], multiple: true },
	            { field: "water_intake", text: "How much water do you drink daily?", options: ["Less than 1 liter", "1 to 2 liters", "More than 2 liters"], multiple: false },
	            { field: "product_preference", text: "Do you have a preference for skincare products?", options: ["Natural or organic", "Dermatologist-recommended", "Cruelty-free", "Fragrance-free", "Vegan", "No specific preference","Other"], multiple: true },
	            { field: "skin_treatment", text: "Are you currently on any medication or treatment for your skin?", options: ["Yes I have", "No"], multiple: true }
	        ];
	
	        let currentQuestionIndex = 0;
	        const answers = {}; // To store user answers
	
	        // Load the first question
	        loadQuestion();
	
	        function loadQuestion() {
	            const question = questions[currentQuestionIndex];
	            document.getElementById("question-text").innerText = question.text;
	
	            const optionsContainer = document.getElementById("options-container");
	            optionsContainer.innerHTML = ""; // Clear previous options
	
	            question.options.forEach((option) => {
	                const button = document.createElement("button");
	                button.className = "option-button";
	                button.textContent = option;
	                button.onclick = () => selectOption(option, button);
	                optionsContainer.appendChild(button);
	
	                // Preserve selected options for navigation
	                if (answers[question.field] && answers[question.field].includes(option)) {
	                    button.classList.add('selected');
	                }
	            });
	
	            // Reset and hide the "Other" input field
	            document.getElementById("other-option-input").style.display = "none";
	            document.getElementById("other-option-input").value = "";
	
	            if (answers[question.field] && answers[question.field].includes("Other")) {
	                // If the "Other" option was selected previously, show the input box with saved text
	                document.getElementById("other-option-input").style.display = "block";
	                document.getElementById("other-option-input").value = answers[question.field]["other"];
	            }
	
	            // Hide the "Back" button on the first question
	            document.getElementById("back-button").style.display =
	                currentQuestionIndex === 0 ? "none" : "inline-block";
	
	            // Show Submit button for the last question
	            if (currentQuestionIndex === questions.length - 1) {
	                document.getElementById("next-button").style.display = "none";
	                document.getElementById("submit-button").style.display = "inline-block";
	            } else {
	                document.getElementById("next-button").style.display = "inline-block";
	                document.getElementById("submit-button").style.display = "none";
	            }
	        }
	
	        function selectOption(option, button) {
	            const question = questions[currentQuestionIndex];
	
	            if (option === "Other" || option === "Yes I have") {
	                // Show the input box for the "Other" option
	                document.getElementById("other-option-input").style.display = "block";
	            } else {
	                if (question.multiple) {
	                    button.classList.toggle('selected'); // Toggle selection color for multiple options
	                } else {
	                    // For single-option questions, save the answer and move to the next question immediately
	                    answers[question.field] = [option];
	                    nextQuestion();
	                }
	            }
	        }
	
	        function nextQuestion() {
	            const question = questions[currentQuestionIndex];
	
	            if (question.multiple) {
	                // For multiple-selection questions, save selected options as an array
	                const selectedOptions = Array.from(document.querySelectorAll('.option-button.selected'))
	                    .map(button => button.textContent);
	                if (selectedOptions.length > 0) {
	                    answers[question.field] = selectedOptions;
	                }
	            } else {
	                // For single-selection questions, save the selected option as a string
	                const selectedButton = document.querySelector('.option-button.selected');
	                if (selectedButton) {
	                    answers[question.field] = selectedButton.textContent; // Save as string
	                }
	            }
	
	            // Check if the "Other" input is displayed and add its value to the answers for the current question
	            if (document.getElementById("other-option-input").style.display === "block") {
	                const otherValue = document.getElementById("other-option-input").value;
	                if (otherValue) {
	                    if (question.multiple) {
	                        answers[question.field] = answers[question.field] || [];
	                        answers[question.field].push(otherValue); // Add the "Other" value to the array of selected options
	                    } else {
	                        answers[question.field] = otherValue; // Save the "Other" value as a string for single-select questions
	                    }
	                }
	            }
	            if (!question.multiple && Array.isArray(answers[question.field])) {
	                answers[question.field] = answers[question.field][0];
	            }
	        	console.log("Final answers before submitting:", JSON.stringify(answers, null, 2));
	
	            currentQuestionIndex++;
	            if (currentQuestionIndex > questions.length) {
	                submitAnswers();
	                return;
	            }
	            loadQuestion();
	        }
	
	        function goBack() {
	            if (currentQuestionIndex > 0) {
	                currentQuestionIndex--;
	                loadQuestion();
	            }
	        }
	
	        function submitAnswers() {
	        	console.log("Final answers before submitting:", JSON.stringify(answers, null, 2));
	
	            fetch("SaveSkincareDataServlet", {
	                method: "POST",
	                headers: { "Content-Type": "application/json" },
	                body: JSON.stringify(answers),
	            })
	                .then((response) => response.text())
	                .then((data) => {
	                    alert("Your answers have been saved successfully!");
	                    window.location.href = "dashboard.jsp"; // Navigate back to the select page
	                })
	                .catch((error) => {
	                    console.error("Error submitting data:", error);
	                    alert("An error occurred while submitting your answers.");
	                });
	        }
	    </script>
</body>
</html>
