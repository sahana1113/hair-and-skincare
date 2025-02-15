<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Hair & Skincare App</title>
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
            padding: 1rem;
            overflow-y: auto;
        }

        .container {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white for readability */
            padding: 1.5rem; /* Reduced padding */
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
            margin-top: 7rem; /* Reduced margin */
            animation: fadeIn 0.5s ease-in-out;
        }

        h1 {
            text-align: center;
            font-size: 2rem; /* Slightly smaller font size */
            color: #2b3856; /* Deep navy for title */
            margin-bottom: 1rem;
        }

        label {
            display: block;
            font-size: 1rem; /* Slightly smaller labels */
            color: #2b3856;
            margin-bottom: 0.3rem; /* Reduced spacing */
        }

        input, select, textarea, button {
            width: 100%;
            font-size: 0.9rem; /* Smaller input text */
            margin-bottom: 0.8rem; /* Reduced spacing between fields */
            padding: 0.6rem; /* Reduced padding */
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: all 0.2s ease;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #ffa69e;
            box-shadow: 0 0 5px rgba(255, 166, 158, 0.6);
        }

        button {
            background-color: #ffc6c7; /* Pastel pink for button */
            color: #2b3856; /* Navy text */
            border: none;
            cursor: pointer;
            font-weight: bold;
            padding: 0.7rem; /* Adjusted padding for smaller button size */
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #ff999e;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
            transform: scale(1.05);
        }

        p {
            text-align: center;
            color: #2b3856;
            font-size: 0.9rem; /* Reduced text size for paragraph */
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

        /* Keyframe Animation */
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
        <h1>Register</h1>
        <form action="register" method="POST">
            <!-- Full Name -->
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>

            <!-- Email -->
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <!-- Password -->
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <!-- Confirm Password -->
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>

            <!-- Gender -->
            <label for="gender">Gender:</label>
            <select id="gender" name="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>

            <!-- Date of Birth -->
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required>

            <!-- Phone Number -->
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone">

            <!-- Address -->
            <label for="address">Location:</label>
            <textarea id="address" name="address"></textarea>

            <button type="submit">Register</button>
        </form>
        <p>Already have an account? <a href="login.jsp">Login</a></p>
    </div>
</body>
</html>
