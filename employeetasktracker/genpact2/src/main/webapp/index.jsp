<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tracker.model.User" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if (session == null || session.getAttribute("user") == null) {
    response.sendRedirect("home.jsp");
    return;
}
%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Task Tracker</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e8f5e9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 25px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            text-align: center;
        }

        h1 {
            color: #1b5e20;
        }

        form, a {
            margin: 10px 0;
            display: block;
            text-decoration: none;
            color: #2e7d32;
            font-weight: bold;
            transition: color 0.3s, background-color 0.3s;
        }

        a:hover {
            color: #1b5e20;
        }

        input[type="submit"] {
            padding: 12px 20px;
            border: none;
            background-color: #2e7d32;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #1b5e20;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const links = document.querySelectorAll('a');
            links.forEach(link => {
                link.addEventListener('mouseover', function() {
                    this.style.color = '#004d40';
                });
                link.addEventListener('mouseout', function() {
                    this.style.color = '#2e7d32';
                });
            });

            const buttons = document.querySelectorAll('input[type="submit"]');
            buttons.forEach(button => {
                button.addEventListener('mouseover', function() {
                    this.style.backgroundColor = '#004d40';
                });
                button.addEventListener('mouseout', function() {
                    this.style.backgroundColor = '#2e7d32';
                });
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= user.getUsername() %>!</h1>
        <form action="addTask.jsp" method="post">
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Add Task">
        </form>
        
        <a href="TaskServlet?employeeName=<%= user.getUsername() %>">View Tasks</a>
        <a href="charts.jsp?employeeName=<%= user.getUsername() %>">View Charts</a>
        
        <form action="logout.jsp" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
