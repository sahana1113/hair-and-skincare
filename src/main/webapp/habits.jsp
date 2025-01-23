<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="com.dao.HabitDao, com.pojo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Habit Tracker</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f9; }
        header { background-color: #007BFF; color: white; text-align: center; padding: 20px 0; }
        h1 { margin: 0; }
        .container { width: 80%; margin: 20px auto; }
        .habit-table { width: 100%; border-collapse: collapse; margin-bottom: 30px; }
        .habit-table th, .habit-table td { padding: 10px; text-align: center; border: 1px solid #ddd; }
        .habit-table th { background-color: #f1f1f1; }
        .habit-row input { width: 30px; height: 30px; }
        .progress { width: 100%; background-color: #f3f3f3; border-radius: 20px; overflow: hidden; margin: 20px 0; }
        .progress-bar { height: 25px; text-align: center; color: white; line-height: 25px; font-weight: bold; }
        .streak { background-color: #28a745; width: 50%; }
        .streak-text { color: white; font-size: 16px; }
        .reflection { margin-top: 30px; background-color: #f1f1f1; padding: 15px; border-radius: 5px; }
        .reflection textarea { width: 100%; height: 100px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; font-size: 16px; }
    </style>
</head>
<body>
    <header>
        <h1>My Habit Tracker - January 2025</h1>
        <p>"Progress, not perfection!"</p>
    </header>
    
    <div class="container">
        <table class="habit-table">
            <thead>
                <tr>
                    <th>Habit</th>
                    <th>Mon</th>
                    <th>Tue</th>
                    <th>Wed</th>
                    <th>Thu</th>
                    <th>Fri</th>
                    <th>Sat</th>
                    <th>Sun</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve habits from request
                    String userId = (String) session.getAttribute("user_id");
                    HabitDao dao=new HabitDao();
                    List<Habits> habits = dao.getHabitsByUserId(userId);
                    for (Habits habit : habits) {
                        String habitName = habit.getHabitName();
                        int habitId = habit.getHabitId();
                %>
                <tr class="habit-row">
                    <td><%= habitName %></td>
                    <td><input type="checkbox" id="habit<%= habitId %>-mon"></td>
                    <td><input type="checkbox" id="habit<%= habitId %>-tue"></td>
                    <td><input type="checkbox" id="habit<%= habitId %>-wed"></td>
                    <td><input type="checkbox" id="habit<%= habitId %>-thu"></td>
                    <td><input type="checkbox" id="habit<%= habitId %>-fri"></td>
                    <td><input type="checkbox" id="habit<%= habitId %>-sat"></td>
                    <td><input type="checkbox" id="habit<%= habitId %>-sun"></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Streak Tracker and Progress Bar -->
        <div class="progress">
            <div class="progress-bar streak" id="streak-progress">
                <span class="streak-text" id="streak-text">Streak: 0 days</span>
            </div>
        </div>

        <div class="reflection">
            <h3>Weekly Reflection:</h3>
            <textarea placeholder="Write about your progress, challenges, or wins here..."></textarea>
        </div>
    </div>

    <script>
        // Function to update streak and progress bar
        function updateStreak() {
            const habits = document.querySelectorAll('.habit-row');
            let totalStreak = 0;

            habits.forEach(habitRow => {
                let streak = 0;
                for (let day = 1; day <= 7; day++) {
                    const checkbox = habitRow.querySelector(`#habit-${day}`);
                    if (checkbox && checkbox.checked) {
                        streak++;
                    }
                }
                totalStreak += streak;
            });

            const streakPercentage = (totalStreak / (habits.length * 7)) * 100;
            document.getElementById('streak-progress').style.width = `${streakPercentage}%`;
            document.getElementById('streak-text').textContent = `Streak: ${totalStreak} days`;
        }

        // Event listeners to update streak on checkbox change
        document.querySelectorAll('input[type="checkbox"]').forEach(input => {
            input.addEventListener('change', updateStreak);
        });

        // Initial call to update streak
        updateStreak();
    </script>
</body>
</html>
