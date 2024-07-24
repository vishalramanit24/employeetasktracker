<%@ page import="java.util.List" %>
<%@ page import="com.tracker.model.Task" %>
<%@ page import="com.tracker.model.User" %>
<%@ page import="com.tracker.dao.TaskDAO" %>
<%@ page import="com.tracker.dbconnection.DBConnection" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 2) { // Assuming 2 is the Admin role
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String employeeName = request.getParameter("employeeName");
    TaskDAO taskDAO = new TaskDAO(DBConnection.getConnection());
    List<Task> tasks = taskDAO.getTasksByEmployeeName(employeeName);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Tasks</title>
    <style>
        body {
            font-family: 'Verdana', sans-serif;
            background-color: #e3f2fd;
            margin: 0;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #1a237e;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 90%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 30px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #bbdefb;
            color: #0d47a1;
        }

        tr:nth-child(even) {
            background-color: #f1f8e9;
        }

        tr:hover {
            background-color: #e3f2fd;
        }

        .back-link {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #1a237e;
            border-radius: 5px;
            text-align: center;
            margin-top: 20px;
        }

        .back-link:hover {
            background-color: #0d47a1;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var backLink = document.querySelector('.back-link');
            backLink.addEventListener('click', function() {
                alert('Returning to Dashboard');
            });
        });
    </script>
</head>
<body>
    <h2>Tasks for <%= employeeName %></h2>
    <table>
        <tr>
            <th>Employee Name</th>
            <th>Role</th>
            <th>Project</th>
            <th>Date</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Task Category</th>
            <th>Description</th>
        </tr>
        <%
            for (Task task : tasks) {
        %>
        <tr>
            <td><%= task.getEmployeeName() %></td>
            <td><%= task.getRole() %></td>
            <td><%= task.getProject() %></td>
            <td><%= task.getDate() %></td>
            <td><%= task.getStartTime() %></td>
            <td><%= task.getEndTime() %></td>
            <td><%= task.getTaskCategory() %></td>
            <td><%= task.getDescription() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="adminDashboard.jsp" class="back-link">Back to Dashboard</a>
</body>
</html>
