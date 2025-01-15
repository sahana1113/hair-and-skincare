<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Hair & Skincare App</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-image: url('images/pastel-abstract-1920-x-1080-background-tqmyfgoeoet6h29y.jpg'); /* New pastel background */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 2rem;
            overflow-y: auto; /* Allows scrolling */
        }

        .container {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white for readability */
            padding: 2rem 3rem;
            border-radius: 20px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.3s ease-in;
            margin-top: 5rem; /* Adjusted margin for better positioning */
        }

        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #2b3856; /* Deep navy to complement the background */
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            font-size: 1.1rem;
            color: #2b3856; /* Navy for labels */
            margin-bottom: 0.5rem;
        }

        input, button {
            width: 100%;
            font-size: 1rem;
            margin-bottom: 1rem;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 10px;
            outline: none;
            transition: all 0.2s ease;
        }

        input:focus {
            border-color: #ffa69e; /* Light coral */
            box-shadow: 0 0 5px rgba(255, 166, 158, 0.6);
        }

        button {
            background-color: #ffc6c7; /* Pastel pink */
            color: #2b3856; /* Navy */
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #ff999e; /* Warmer pink */
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
            transform: scale(1.05);
        }

        p {
            text-align: center;
            color: #2b3856;
            font-size: 1rem;
        }

        a {
            color: #5d5fef; /* Soft blue for links */
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        a:hover {
            color: #3b3ff5;
        }

        /* Keyframe Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login</h1>
        <form action="login" method="POST">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="register.jsp">Register</a></p>
    </div>
</body>
</html>
