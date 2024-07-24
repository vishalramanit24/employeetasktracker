<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #ecf0f1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            text-align: center;
        }

        h1 {
            color: #3498db;
            font-weight: 300;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            margin-bottom: 8px;
            color: #34495e;
            align-self: flex-start;
        }

        input {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        button {
            padding: 12px 20px;
            border: none;
            background-color: #3498db;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #2980b9;
        }

        .error-message {
            color: #e74c3c;
            font-weight: bold;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('input');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.style.borderColor = '#3498db';
                });
                input.addEventListener('blur', function() {
                    this.style.borderColor = '#bdc3c7';
                });
            });
        });
    </script>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form action="AuthServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
        <%
            if (request.getParameter("error") != null) {
        %>
        <p class="error-message"><%= request.getParameter("error") %></p>
        <%
            }
        %>
    </div>
</body>
</html>
