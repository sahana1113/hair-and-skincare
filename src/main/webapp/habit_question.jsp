<!DOCTYPE html>
<html>
<head>
    <title>Create New Habit</title>
    
</head>
<body>
    <header>
        <h1>Create New Habit</h1>
    </header>
    
    <main>
        <section class="form-container">
            <form action="CreateHabitServlet" method="post">
                <div class="form-group">
                    <label for="habitName">Habit Name:</label>
                    <input type="text" id="habitName" name="habitName" required>
                </div>

                <div class="form-group">
                    <label for="habitDescription">Habit Description:</label>
                    <textarea id="habitDescription" name="habitDescription"></textarea>
                </div>

                <div class="form-group">
                    <label for="frequency">Frequency:</label>
                    <select id="frequency" name="frequency" required>
                        <option value="Daily">Daily</option>
                        <option value="Weekly">Weekly</option>
                        <option value="Custom">Custom</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" required>
                </div>

                <div class="form-group">
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate">
                </div>

                <button type="submit">Create Habit</button>
            </form>
        </section>
    </main>

</body>
</html>
