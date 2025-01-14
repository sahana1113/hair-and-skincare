<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skincare Questions</title>
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

            if (option === "Other" ||option=="Yes I have") {
                // Show the input box for the "Other" option
                document.getElementById("other-option-input").style.display = "block";
                document.getElementById("other-option-input").oninput = () => {
                    // Save the custom answer for "Other" option
                    answers[question.field] = answers[question.field] || [];
                    answers[question.field].push(document.getElementById("other-option-input").value);                };
            } else {
                if (question.multiple) {
                    button.classList.toggle('selected'); // Toggle selection color for multiple options
                } else {
                    // For single option questions, save answer and move to the next question immediately
                    answers[question.field] = option;
                    nextQuestion();
                }
            }
        }

        function nextQuestion() {
            const question = questions[currentQuestionIndex];

            if (question.multiple) {
                // For multiple selection questions, save selected options
                const selectedOptions = Array.from(document.querySelectorAll('.option-button.selected'))
                    .map(button => button.textContent);
                if (selectedOptions.length > 0) {
                    answers[question.field] = selectedOptions;
                }
            }
            
         // Check if the "Other" input is displayed and add its value to the answers for the current question
            if (document.getElementById("other-option-input").style.display === "block") {
                const otherValue = document.getElementById("other-option-input").value;
                if (otherValue) {
                    answers[question.field] = answers[question.field] || [];
                    answers[question.field].push(otherValue);  // Add the "Other" value to the array of selected options
                }
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

            fetch("SaveSkincareDataServlet", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(answers),
            })
                .then((response) => response.text())
                .then((data) => {
                    alert("Your answers have been saved successfully!");
                    window.location.href = "select_option.jsp"; // Navigate back to the select page
                })
                .catch((error) => {
                    console.error("Error submitting data:", error);
                    alert("An error occurred while submitting your answers.");
                });
        }
    </script>
</body>
</html>
