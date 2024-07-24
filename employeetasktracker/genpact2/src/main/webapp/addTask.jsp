<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tracker.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 40px;
            color: #333;
        }

        h1 {
            color: #007bff;
            text-align: center;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .container:hover {
            transform: scale(1.02);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #495057;
        }

        input[type="text"], input[type="date"], input[type="time"], textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.2s;
        }

        input[type="text"]:focus, input[type="date"]:focus, input[type="time"]:focus, textarea:focus {
            border-color: #007bff;
        }

        button {
            padding: 12px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.2s, transform 0.2s;
        }

        button:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .error {
            color: #dc3545;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
    <script>
        function validateForm() {
            const endTime = document.getElementById('end_time').value;
            const startTime = document.getElementById('start_time').value;

            if (endTime <= startTime) {
                alert("End time must be later than start time");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Add Task</h1>
        <span class="error">
            <% if (request.getAttribute("error") != null) { %>
                <%= request.getAttribute("error") %>
            <% } %>
        </span>
        <form action="TaskServlet" method="post" onsubmit="return validateForm()">
            <label for="project">Project:</label>
            <input type="text" id="project" name="project" required>
            
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>
            
            <label for="start_time">Start Time:</label>
            <input type="time" id="start_time" name="start_time" required>
            
            <label for="end_time">End Time:</label>
            <input type="time" id="end_time" name="end_time" required>
            
            <label for="task_category">Task Category:</label>
            <input type="text" id="task_category" name="task_category" required>
            
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>
            
            <input type="hidden" name="action" value="add">
            <button type="submit">Add Task</button>
        </form>
    </div>
</body>
</html>
