<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.tracker.dao.TaskDAO" %>
<%@ page import="com.tracker.dbconnection.DBConnection" %>
<%@ page import="com.tracker.model.Task" %>
<%
    int taskId = Integer.parseInt(request.getParameter("id"));
    Connection connection = DBConnection.getConnection();
    TaskDAO taskDAO = new TaskDAO(connection);
    Task task = taskDAO.getTaskById(taskId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
    <style>
        body {
            font-family: 'Helvetica Neue', sans-serif;
            background-color: #e0f7fa;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h2 {
            color: #00796b;
            margin-bottom: 20px;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            width: 100%;
            max-width: 500px;
        }

        p {
            margin: 15px 0;
        }

        label {
            display: block;
            margin-bottom: 7px;
            color: #004d40;
        }

        input[type="text"], input[type="date"], input[type="time"], textarea {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #b2dfdb;
            border-radius: 6px;
            box-sizing: border-box;
            font-family: 'Helvetica Neue', sans-serif;
        }

        textarea {
            resize: vertical;
            min-height: 120px;
        }

        input[type="submit"] {
            padding: 12px 25px;
            background-color: #00796b;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #004d40;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            form.addEventListener('submit', function(event) {
                const startTime = document.getElementById('start_time').value;
                const endTime = document.getElementById('end_time').value;

                if (startTime >= endTime) {
                    alert('End time must be after start time.');
                    event.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
    <h2>Edit Task</h2>
    <form action="TaskServlet" method="post">
        <input type="hidden" name="id" value="<%= task.getId() %>">
        <input type="hidden" name="employeeName" value="<%= request.getParameter("employeeName") %>">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="taskId" value="<%= task.getId() %>">
        
        <p>
            <label for="project">Project:</label>
            <input type="text" id="project" name="project" value="<%= task.getProject() %>">
        </p>
        <p>
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%= task.getDate() %>">
        </p>
        <p>
            <label for="start_time">Start Time:</label>
            <input type="time" id="start_time" name="start_time" value="<%= String.valueOf(task.getStartTime()).substring(0,5) %>">
        </p>
        <p>
            <label for="end_time">End Time:</label>
            <input type="time" id="end_time" name="end_time" value="<%= String.valueOf(task.getEndTime()).substring(0,5) %>">
        </p>
        <p>
            <label for="task_category">Task Category:</label>
            <input type="text" id="task_category" name="task_category" value="<%= task.getTaskCategory() %>">
        </p>
        <p>
            <label for="description">Description:</label>
            <textarea id="description" name="description"><%= task.getDescription() %></textarea>
        </p>
        <p>
            <input type="submit" value="Update Task">
        </p>
    </form>
</body>
</html>
