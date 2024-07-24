<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Task Management</title>
    <style>
        body {
            font-family: 'Verdana', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e3f2fd;
            color: #424242;
        }

        h1, h2 {
            color: #1a237e;
        }

        h1 {
            text-align: center;
            padding: 20px 0;
            background-color: #3949ab;
            color: white;
            margin: 0;
            border-bottom: 5px solid #1a237e;
        }

        h2 {
            margin-top: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            margin: 10px 0;
        }

        a {
            text-decoration: none;
            color: #3949ab;
            font-weight: bold;
            transition: color 0.3s;
        }

        a:hover {
            color: #1a237e;
        }

        .section {
            margin: 20px auto;
            padding: 20px;
            width: 80%;
            max-width: 600px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        .section h2 {
            margin-top: 0;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const links = document.querySelectorAll('a');
            links.forEach(link => {
                link.addEventListener('mouseover', function() {
                    this.style.color = '#0d47a1';
                });
                link.addEventListener('mouseout', function() {
                    this.style.color = '#3949ab';
                });
            });
        });
    </script>
</head>
<body>
    <h1>Welcome to the Employee Task Management System</h1>
    
    <div class="section">
        <h2>Admin Section</h2>
        <ul>
            <li><a href="adminLogin.jsp">Admin Login</a></li>
        </ul>
    </div>

    <div class="section">
        <h2>User Section</h2>
        <ul>
            <li><a href="login.jsp">User Login</a></li>
            <li><a href="register.jsp">User Registration</a></li>
        </ul>
    </div>
</body>
</html>
