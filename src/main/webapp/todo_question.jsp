<!DOCTYPE html>
<html>
<head>
    <title>Create New To-Do</title>
    <style>
/* styles.css */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f6f5ef;
    background-image: url('images/todo01.jpg'); /* Update with the correct path to your image */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

header {
    text-align: center;
    padding: 20px;
    background-color: rgba(246, 229, 211, 0.9);
    border-bottom: 2px solid #d8c4aa;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
    width: 100%;
}

header h1 {
    font-size: 2.5rem;
    color: #4a707a;
    margin: 0;
}

main {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.form-container {
    width: 100%;
    height:550px;
    max-width: 700px; /* Increased the size of the form */
    background: rgba(255, 255, 255, 0.85);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    padding: 30px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-size: 1rem;
    color: #6e665a;
}

.form-group input,
.form-group textarea,
.form-group select {
    width: 97%;
    padding: 12px;
    font-size: 1rem;
    border: 2px solid #d9d2c5;
    border-radius: 8px;
    background-color: #f9f7f5;
    color: #4e4843;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05);
}

textarea {
    resize: none;
    height: 120px; /* Adjusted height for better usability */
}

button {
    display: block;
    width: 100%;
    padding: 12px;
    font-size: 1.2rem;
    color: #ffffff;
    background-color: #4a707a;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #3b5d64;
}

 
    </style>
</head>
<body>
    <header>
        <h1>Create New To-Do</h1>
    </header>

    <main>
        <section class="form-container">
            <form action="CreateTodoServlet" method="post">
                <div class="form-group">
                    <label for="taskName">Task Name:</label>
                    <input type="text" id="taskName" name="taskName" required>
                </div>

                <div class="form-group">
                    <label for="taskDescription">Task Description:</label>
                    <textarea id="taskDescription" name="taskDescription"></textarea>
                </div>

                <div class="form-group">
                    <label for="dueDate">Due Date:</label>
                    <input type="date" id="dueDate" name="dueDate">
                </div>

                <div class="form-group">
                    <label for="status">Status:</label>
                    <select id="status" name="status" required>
                        <option value="Pending">Pending</option>
                        <option value="Completed">Completed</option>
                        <option value="Overdue">Overdue</option>
                    </select>
                </div>

                <button type="submit">Create To-Do</button>
            </form>
        </section>
    </main>

</body>
</html>
