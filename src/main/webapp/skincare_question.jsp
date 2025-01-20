<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skincare Questions</title>
    <style>
    body {
        font-family: 'Arial', sans-serif;
        background: url('images/skincare.jpg') no-repeat center center fixed;
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
    border: 2px solid #ccc;
    border-radius: 10px;
    cursor: pointer;
    background: linear-gradient(145deg, #ddd9f1, #f3f1fc); /* Subtle gradient based on #afaae2 */
    color: #4c4c70; /* Slightly darker text for better contrast */
    transition: all 0.3s ease;
    flex: 1 1 calc(50% - 15px);
    text-align: center;
    font-size:20px;
    box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.1), -3px -3px 6px rgba(255, 255, 255, 0.7);
}

.option-button:hover {
    border-color: #afaae2; /* Hover border color */
    background: #e5e3f4; /* Slightly lighter version of the selected color */
    color: #333;
    box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.2), -3px -3px 6px rgba(255, 255, 255, 0.9); /* Glow effect */
}

.option-button.selected {
    background: #afaae2; /* Selected background color */
    color: white; /* Contrast text for selected state */
    border-color: #8c86c7; /* Darker border for selected state */
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
        background-color: #ff7f6e; /* Theme color */
        color: white;
    }

    #next-button:hover, #submit-button:hover {
        background-color: #ff6347; /* Darker theme color */
    }
</style>
    </head>
<body>
    <div class="container">
        <div class="header">
            <img src="images/skincareques.jpg" alt="Skincare">
            <h1>Let's Talk About Your Skin!</h1>
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
