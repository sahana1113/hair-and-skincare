<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Hair & Skincare App</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url(images/indexx.avif); /* Background Image */
            background-size: cover;  /* Ensures image covers entire page */
            background-position: center;  /* Centers the image */
            background-attachment: fixed; /* Makes the background image fixed */
            
         /*   background-color: black; /* Pastel cream background */
            overflow: hidden;
        }

/*         .container {
            text-align: center;
            background: #d6eef5; 
            padding: 3rem 4rem;
            border-radius: 20px;
            box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.15);
            width: 60%; 
            animation: slideIn 1.2s ease-out; 
        } */
        .container {
    text-align: center;
    background: rgba(255, 250, 240, 0.9); /* Pastel cream with slight transparency */
    padding: 3rem 4rem;
    border-radius: 20px;
    box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.15);
    width: 60%;
    animation: slideIn 0.3s ease-out;
}
        

        h1 {
            font-size: 2.7rem;
            color: #4b6584; /* Cool dark pastel gray */
            margin-bottom: 1rem;
            animation: fadeIn 1.5s ease-in;
        }

        p {
            font-size: 1.3rem;
            color: #4b6584;
            margin-bottom: 2rem;
            animation: fadeIn 1.5s ease-in;
        }

        .button-group {
            display: flex;
            flex-direction: column; 
            align-items: center;
            gap: 1rem; 
        }

        a {
            text-decoration: none;
        }

        button {
            background-color: #ffcccb; /* Pastel pink */
            color: #4b6584; /* Cool dark pastel gray */
            font-size: 1.4rem;
            padding: 1rem 2rem;
            border: none;
            border-radius: 50px;
            width: 110%;
            cursor: pointer;
            transition: all 0.3s ease;
            animation: bounce 2s infinite ease-in-out;
        }

        button:hover {
            background-color: #f4a1a1; /* Slightly darker pastel pink */
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
            transform: scale(1.1);
        }

        @keyframes slideIn {
            from {
                transform: translateY(-50%);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Personalized Palette</h1>
        <p>Your journey to glowing skin and healthy hair starts here!</p>
        
        <div class="button-group">
            <p>New to Care Craft? Let's get you started:</p>
            <a href="register.jsp">
                <button>Register Now</button>
            </a>
            
            <p>Already have an account? Let's continue:</p>
            <a href="login.jsp">
                <button>Login Here</button>
            </a>
        </div>
    </div>
</body>
</html>
