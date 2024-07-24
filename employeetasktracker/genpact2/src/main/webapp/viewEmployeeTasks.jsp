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
            font-family: 'Roboto', sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #34495e;
            margin-bottom: 20px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-bottom: 30px;
            background-color: #fff;
            border: 1px solid #dcdcdc;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f7f7f7;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #34495e;
            border-radius: 5px;
            text-align: center;
            width: 150px;
        }

        .back-link:hover {
            background-color: #2c3e50;
        }
    </style>
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
