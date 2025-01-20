<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Haircare Questions</title>
        <style>
    body {
        font-family: 'Arial', sans-serif;
        background: url('images/haircare.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        color: #333;
    }

    .container {
        max-width: 800px;
        margin: 50px auto;
        background: rgba(255, 255, 255, 0.93);
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    .header {
        text-align: center;
        margin-bottom: 20px;
    }

    .header img {
        max-width: 150px;
        border-radius: 50%;
    }

    h2 {
        font-size: 1.8rem;
        margin-bottom: 20px;
        color: #444;
    }

    #options-container {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        margin-bottom: 20px;
    }

.option-button {
    padding: 12px 20px;
    border: 2px solid #cd8f9d; /* Border using your specified shade */
    border-radius: 10px;
    cursor: pointer;
    background: linear-gradient(145deg, #e2a7b2, #f6d1d6); /* Subtle gradient with lighter variations of #cd8f9d */
    color: #4a3136; /* Darker text for better contrast */
    transition: all 0.3s ease;
    flex: 1 1 calc(50% - 15px);
    text-align: center;
    font-size:20px;
    box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.1), -3px -3px 6px rgba(255, 255, 255, 0.7);
}

.option-button:hover {
    border-color: #b47785; /* Slightly darker border on hover */
    background: #e8b5c0; /* A lighter hover background */
    color: #3b262a; /* Darker text for hover state */
    box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.2), -3px -3px 6px rgba(255, 255, 255, 0.9); /* Glow effect */
}

.option-button.selected {
    background: #cd8f9d; /* Solid background for the selected state */
    color: white; /* White text for contrast */
    border-color: #a76f78; /* Darker shade for the selected border */
    box-shadow: inset 2px 2px 4px rgba(0, 0, 0, 0.2), inset -2px -2px 4px rgba(255, 255, 255, 0.8); /* Inset shadow effect */
}


   

    .other-input {
        display: none;
        width: 97%;
        padding: 10px;
        margin-top: 10px;
        border-radius: 5px;
        border: 1px solid #ddd;
        font-size: 1rem;
        box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.1);
    }

    .button-group {
        text-align: center;
        margin-top: 20px;
    }

    /* Updated navigation buttons */
    .button-group button {
        padding: 12px 20px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 1rem;
        margin: 0 10px;
        transition: all 0.3s ease;
    }

    #back-button {
        background-color: #d3d3d3;
        color: #333;
    }

    #back-button:hover {
        background-color: #bfbfbf;
        color: #222;
    }

    #next-button, #submit-button {
        background-color: #613e30; /* Theme color */
        color: white;
    }

    #next-button:hover, #submit-button:hover {
        background-color: #4d3024; /* Darker theme color */
    }
</style>
</head>
<body>
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
