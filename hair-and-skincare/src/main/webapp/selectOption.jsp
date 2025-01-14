<!-- select_option.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Option</title>
    <style>
        .option-container {
            text-align: center;
            margin-top: 50px;
        }
        .option {
            margin: 20px;
            padding: 15px 30px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        .option:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="option-container">
        <h1>Select a Category</h1>
        <button class="option" onclick="navigateTo('skincare')">Skincare</button>
        <button class="option" onclick="navigateTo('haircare')">Haircare</button>
        <button class="option" onclick="navigateTo('others')">Others</button>
    </div>

    <script>
        function navigateTo(category) {
            window.location.href = category + "_question.jsp"; // Redirect to the respective question page
        }
    </script>
</body>
</html>
