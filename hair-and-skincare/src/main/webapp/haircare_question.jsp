<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Haircare Questions</title>
    <style>
        #question-container {
            width: 50%;
            margin: 50px auto;
            text-align: center;
            font-family: Arial, sans-serif;
        }
        h2 {
            margin-bottom: 20px;
        }
        .option-container {
            margin: 10px 0;
        }
        .option-button {
            display: block;
            margin: 10px auto;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #64b64d; /* Lighter green */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .option-button.selected {
            background-color: #81c784; /* Selected light green */
        }
        .option-button:hover {
            background-color: #81c784; /* Hover on the selected button */
        }
        .other-input {
            display: none; /* Initially hidden */
            margin: 15px auto;
            padding: 10px;
            font-size: 16px;
            width: 80%;
        }
        button#next-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button#next-button:hover {
            background-color: #45a049;
        }
        button#submit-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button#submit-button:hover {
            background-color: #1976D2;
        }
        button#back-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button#back-button:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>
    <div id="question-container">
        <h2 id="question-text"></h2>
        <div id="options-container"></div>
        <input type="text" id="other-option-input" class="other-input" placeholder="Type your answer here">
        <button id="back-button" onclick="goBack()">Back</button>
        <button id="submit-button" style="display: none;" onclick="submitAnswers()">Submit</button>
        <button id="next-button" onclick="nextQuestion()">Next</button>
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
                    window.location.href = "select_option.jsp";
                })
                .catch((error) => {
                    console.error("Error submitting data:", error);
                    alert("An error occurred while submitting your answers.");
                });
        }
    </script>
</body>
</html>
