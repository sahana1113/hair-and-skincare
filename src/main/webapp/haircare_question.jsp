<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Haircare Questions</title>
        <style>

        a {
    text-decoration: none;
    color: #444;
} 
    body {
        font-family: 'Arial', sans-serif;
        background: url('images/demo-hair-ques.jpg');
        background-size: 105% 110%; /* Adjust the size */
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
        margin: 0;
        padding: 0;
        color: #333;
    }
    .sidebar h2 {
            color: #856c6c;
            margin-bottom: 20px;
            font-size: 1.8rem;
            border-bottom: 2px solid #f3d7d7;
            padding-bottom: 10px;
}
    /* Global Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background: linear-gradient(135deg, #e6e6fa 0%, #f0fff0 100%);
    min-height: 100vh;
    padding: 2rem;
    color: #4a4a4a;
}

/* Container Styles */
.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem;
    background: rgba(255, 255, 255, 0.92);
    border-radius: 20px;
    box-shadow: 0 8px 32px rgba(147, 128, 180, 0.15);
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
    color: #786fa6;
    margin-bottom: 1rem;
    font-weight: 600;
}

.header img {
    max-width: 150px;
    border-radius: 50%;
    margin-bottom: 1.5rem;
    box-shadow: 0 4px 15px rgba(147, 128, 180, 0.2);
}

/* Question Styles */
#question-text {
    font-size: 1.5rem;
    color: #6c7b95;
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
    background: #f4f1f9;
    border-color: #c5b6e0;
    transform: translateY(-2px);
}

.option-button.selected {
    background: #e8e3f5;
    border-color: #b4a7d6;
    color: #674ea7;
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
    border-color: #c5b6e0;
    background: #fbfaff;
}

/* Button Group */
.button-group {
    display: flex;
    justify-content: space-between;
    gap: 1rem;
    margin-top: 2rem;
}

/* Navigation Buttons */
#back-button,
#next-button,
#submit-button {
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

#next-button,
#submit-button {
    background: linear-gradient(135deg, #b4a7d6 0%, #9785c2 100%);
    color: white;
}

#next-button:hover,
#submit-button:hover {
    background: linear-gradient(135deg, #9785c2 0%, #7c6ba1 100%);
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
    background: linear-gradient(90deg, #b4a7d6, #98ddca);
    transition: width 0.3s ease;
}

/* Sidebar Modifications */
.sidebar {
    background: rgba(147, 128, 180, 0.95);
    backdrop-filter: blur(4px);
}

.sidebar:hover {
    background: rgba(120, 111, 166, 0.95);
}

.sidebar-nav li a:hover {
    background: rgba(152, 221, 202, 0.3);
}

/* Custom Scrollbar */
::-webkit-scrollbar {
    width: 8px;
}

::-webkit-scrollbar-track {
    background: #f1f1f1;
}

::-webkit-scrollbar-thumb {
    background: #b4a7d6;
    border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
    background: #9785c2;
}

/* Animations */
@keyframes fadeIn {
    from {
        opacity: 0;
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

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        padding: 1rem;
        margin: 1rem;
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

    #back-button,
    #next-button,
    #submit-button {
        width: 100%;
    }
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
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
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
    <div class="container">
        <div class="header">
            <img src="images/haircareques.jpg" alt="Skincare">
            <h1>Let's Talk About Your Hair!</h1>
        </div>
        <h2 id="question-text"></h2>
        <div id="options-container"></div>
        <input type="text" id="other-option-input" class="other-input" placeholder="Please specify here">
        <div class="button-group">
            <button id="back-button" onclick="goBack()">Back</button>
            <button id="submit-button" style="display: none;" onclick="submitAnswers()">Submit</button>
            <button id="next-button" onclick="nextQuestion()">Next</button>
        </div>
    </div>

    <script>
        // Questions and options for haircare
        const questions = [
            { field: "hair_concern", text: "What is your primary hair concern?", options: ["Hair fall or thinning", "Dryness or frizziness", "Dandruff", "Oily scalp", "Split ends", "None", "Other"], multiple: true },
            { field: "hair_type", text: "What is your hair type?", options: ["Straight", "Wavy", "Curly", "Coily", "Unsure"], multiple: false },
            { field: "hair_length", text: "What is your hair length?", options: ["Short", "Medium", "Long"], multiple: false },
            { field: "hair_texture", text: "How would you describe your hair texture?", options: ["Fine", "Medium", "Thick"], multiple: false },
            { field: "scalp_concern", text: "Do you have any specific scalp concerns?", options: ["Itchy scalp", "Dry scalp", "Oily scalp", "Sensitive scalp", "None"], multiple: true },
            { field: "wash_frequency", text: "How frequently do you wash your hair?", options: ["Daily", "Every 2-3 days", "Once a week","Other"], multiple: false },
            { field: "current_products", text: "What type of haircare products do you currently use?", options: ["Shampoo", "Conditioner", "Hair mask", "Hair oil", "Leave-in conditioner", "None"], multiple: true },
            { field: "styling_tools", text: "Do you use heat styling tools?", options: ["Frequently", "Occasionally", "Rarely", "Never"], multiple: false },
            { field: "chemical_treatments", text: "Have you chemically treated your hair?", options: ["Yes I have", "No"], multiple: true },
            { field: "seasonal_effects", text: "Do you notice seasonal changes in your hair condition?", options: ["Yes, worsens in winter", "Yes, worsens in summer", "No seasonal changes"], multiple: false },
            { field: "diet", text: "Do you follow a specific diet that affects your hair?", options: ["Balanced diet", "Vegetarian or vegan", "Low protein", "Other"], multiple: false },
            { field: "water_intake", text: "How much water do you drink daily?", options: ["Less than 1 liter", "1-2 liters", "More than 2 liters"], multiple: false },
            { field: "stress_level", text: "How much stress do you experience regularly?", options: ["High", "Moderate", "Low"], multiple: false },
            { field: "growth_goals", text: "Do you have a hair growth goal?", options: ["Yes, longer hair", "Yes, thicker hair", "No specific goal"], multiple: false },
            { field: "allergies", text: "Do you have any allergies?", options: ["Yes I have", "No", "Not sure"], multiple: true },
            { field: "natural_products", text: "Do you prefer natural or organic haircare solutions?", options: ["Yes", "No preference"], multiple: false }

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

            if (option === "Other" || option=="Yes I have") {
                document.getElementById("other-option-input").style.display = "block";
            } else {
                if (question.multiple) {
                    button.classList.toggle('selected');
                } else {
                    answers[question.field] = [option];
                    nextQuestion();
                }
            }
        }

        function nextQuestion() {
            const question = questions[currentQuestionIndex];

            if (question.multiple) {
                const selectedOptions = Array.from(document.querySelectorAll('.option-button.selected'))
                    .map(button => button.textContent);
                if (selectedOptions.length > 0) {
                    answers[question.field] = selectedOptions;
                }
            } else {
                const selectedButton = document.querySelector('.option-button.selected');
                if (selectedButton) {
                    answers[question.field] = selectedButton.textContent;
                }
            }

            if (document.getElementById("other-option-input").style.display === "block") {
                const otherValue = document.getElementById("other-option-input").value;
                if (otherValue) {
                    if (question.multiple) {
                        answers[question.field] = answers[question.field] || [];
                        answers[question.field].push(otherValue);
                    } else {
                        answers[question.field] = otherValue;
                    }
                }
            }
            if (!question.multiple && Array.isArray(answers[question.field])) {
                answers[question.field] = answers[question.field][0];
            }

            currentQuestionIndex++;
            if (currentQuestionIndex >= questions.length) {
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

            fetch("SaveHaircareDataServlet", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(answers),
            })
                .then((response) => response.text())
                .then((data) => {
                    alert("Your answers have been saved successfully!");
                    window.location.href = "dashboard.jsp";
                })
                .catch((error) => {
                    console.error("Error submitting data:", error);
                    alert("An error occurred while submitting your answers.");
                });
        }
    </script>
</body>
</html>
