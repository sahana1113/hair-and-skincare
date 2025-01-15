<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>What's Your Focus Today?</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-image: url('images/selectt.jpg'); /* Pastel background */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
        }

        h1 {
            font-size: 2.5rem;
            color: #2b3856; /* Deep navy text */
            margin-bottom: 2rem;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .tile-container {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .tile {
            background: rgba(255, 255, 255, 0.9); /* White with transparency for readability */
            width: 250px;
            height: 300px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 1rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .tile:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
        }

        .tile img {
            width: 180px;
            height: 180px;
            margin: 0 auto;
        }

        .tile h2 {
            font-size: 1.5rem;
            color: #2b3856;
            margin-top: 0.7rem;
        }

        .tile p {
            font-size: 1rem;
            color: #555;
        }

        @media (max-width: 768px) {
            .tile {
                width: 200px;
                height: 250px;
            }
        }
    </style>
</head>
<body>
    <h1>What's Your Focus Today?</h1>
    <div class="tile-container">
        <!-- Skincare Tile -->
        <div class="tile" onclick="navigateTo('skincare')">
            <img src="images/skincare_girl.jpg" alt="Skincare">
            <h2>Skincare</h2>
            <p>Glow up with personalized skincare recommendations!</p>
        </div>

        <!-- Haircare Tile -->
        <div class="tile" onclick="navigateTo('haircare')">
            <img src="images/haircare_girl.jpg" alt="Haircare">
            <h2>Haircare</h2>
            <p>Nurture your locks with the best haircare tips.</p>
        </div>

        <!-- Others Tile -->
        <div class="tile" onclick="navigateTo('others')">
            <img src="images/other.jpg" alt="Others">
            <h2>To-Do & Habits</h2>
   			<p>Stay on track with your goals! Manage your to-dos and build healthy habits.</p>
        </div>
    </div>

    <script>
        function navigateTo(category) {
            window.location.href = category + "_question.jsp"; // Redirect to the respective question page
        }
    </script>
</body>
</html>
