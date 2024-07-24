<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7fa;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 350px;
            text-align: center;
        }

        h2 {
            color: #00695c;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #004d40;
            text-align: left;
        }

        input[type="text"], input[type="password"] {
            width: calc(100% - 24px);
            padding: 12px;
            margin-bottom: 20px;
            border: 2px solid #b2dfdb;
            border-radius: 6px;
            box-sizing: border-box;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #00796b;
        }

        input[type="submit"] {
            padding: 12px 24px;
            background-color: #00796b;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #004d40;
        }

        .error {
            color: #d32f2f;
            margin-bottom: 20px;
        }
    </style>
    <script>
        function validateForm() {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();
            
            if (username === "" || password === "") {
                alert("Username and password cannot be empty");
                return false;
            }
            
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>
        <span class="error">
            <% if (request.getAttribute("error") != null) { %>
                <%= request.getAttribute("error") %>
            <% } %>
        </span>
        <form action="AuthServlet" method="post" onsubmit="return validateForm()">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
