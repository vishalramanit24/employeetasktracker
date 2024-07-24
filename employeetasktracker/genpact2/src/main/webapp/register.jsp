<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e8f0fe;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        h1 {
            color: #4a90e2;
        }

        form {
            background-color: #fff;
            padding: 25px;
            border: 2px solid #4a90e2;
            border-radius: 8px;
            text-align: left;
            width: 300px;
        }

        label {
            display: block;
            margin-top: 10px;
            color: #333;
        }

        input[type="text"], input[type="password"] {
            width: calc(100% - 20px);
            padding: 8px;
            margin-top: 5px;
            border: 2px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4a90e2;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 15px;
        }

        button:hover {
            background-color: #357ABD;
        }

        .error-message {
            color: #d9534f;
            margin-top: 10px;
            text-align: center;
        }
    </style>
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            if (username === "" || password === "") {
                alert("Both fields are required!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h1>Sign Up</h1>
    <form action="RegisterServlet" method="post" onsubmit="return validateForm();">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <button type="submit">Sign Up</button>
    </form>

    <% 
        String errorMessage = request.getParameter("error");
        if (errorMessage != null) {
    %>
        <p class="error-message"><%= errorMessage %></p>
    <% 
        }
    %>
</body>
</html>
