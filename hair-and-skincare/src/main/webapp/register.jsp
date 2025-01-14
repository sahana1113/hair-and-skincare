<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Hair & Skincare App</title>
</head>
<body>
    <h1>Register</h1>
    <form action="register" method="POST">
        <!-- Full Name -->
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" required><br><br>

        <!-- Email -->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <!-- Password -->
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <!-- Confirm Password -->
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br><br>

        <!-- Gender (optional) -->
        <label for="gender">Gender:</label>
        <select id="gender" name="gender">
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select><br><br>

        <!-- Date of Birth -->
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required><br><br>

        <!-- Phone Number -->
        <label for="phone">Phone Number:</label>
        <input type="text" id="phone" name="phone"><br><br>

        <!-- Address -->
        <label for="address">Location:</label>
        <textarea id="address" name="address"></textarea><br><br>

        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login</a></p>
</body>
</html>

