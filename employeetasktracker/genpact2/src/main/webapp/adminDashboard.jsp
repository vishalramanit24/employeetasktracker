<%@ page import="java.util.List" %>
<%@ page import="com.tracker.model.User" %>
<%@ page import="com.tracker.dao.UserDAO" %>
<%@ page import="com.tracker.dbconnection.DBConnection" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 2) { // Assuming 2 is the Admin role
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    UserDAO userDAO = new UserDAO(DBConnection.getConnection());
    List<User> employees = userDAO.getAllEmployees();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #eceff1;
            margin: 0;
            padding: 30px;
            color: #37474f;
        }

        h2 {
            color: #00695c;
            text-align: center;
        }

        h3 {
            color: #00796b;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eeeeee;
        }

        th {
            background-color: #00796b;
            color: white;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f1f8e9;
        }

        a {
            text-decoration: none;
            color: #00796b;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        form {
            margin-top: 20px;
            text-align: center;
        }

        input[type="submit"] {
            padding: 12px 25px;
            background-color: #d32f2f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #b71c1c;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>
    <script>
        function confirmLogout() {
            return confirm("Are you sure you want to log out?");
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Welcome, Admin</h2>
        <h3>All Employees</h3>
        <table>
            <tr>
                <th>Employee Name</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            <%
                for (User employee : employees) {
            %>
            <tr>
                <td><%= employee.getUsername() %></td>
                <td><%= employee.getRoleId() == 1 ? "Associate" : "Admin" %></td>
                <td><a href="viewEmployeeTasks.jsp?employeeName=<%= employee.getUsername() %>">View Tasks</a></td>
            </tr>
            <%
                }
            %>
        </table>
        <form action="logout.jsp" method="post" onsubmit="return confirmLogout()">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
