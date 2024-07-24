<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Task Charts</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f2f1;
            margin: 0;
            padding: 40px;
        }

        h1 {
            color: #004d40;
            text-align: center;
            margin-bottom: 30px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        form {
            margin-bottom: 25px;
            padding: 20px;
            border: 1px solid #b2dfdb;
            border-radius: 8px;
            background-color: #fafafa;
            transition: background-color 0.3s ease;
        }

        form:hover {
            background-color: #f1f8e9;
        }

        form h2 {
            margin: 0 0 15px;
            color: #00796b;
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

        a {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 24px;
            text-decoration: none;
            background-color: #00796b;
            color: white;
            border-radius: 6px;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #004d40;
        }
    </style>
    <script>
        function confirmNavigation(action) {
            return confirm("Do you want to view the " + action + " task chart?");
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Task Charts for <%= request.getParameter("employeeName") %></h1>
        <form action="daily.jsp" onsubmit="return confirmNavigation('daily')">
            <h2>See where you have spent most of your time today</h2>
            <input type="hidden" name="action" value="viewCharts">
            <input type="hidden" name="type" value="daily">
            <input type="hidden" name="employeeName" value="<%=request.getParameter("employeeName") %>">
            <input type="submit" value="Daily Task">
        </form>
   
        <form action="weekly.jsp" onsubmit="return confirmNavigation('weekly')">
            <h2>See where you have spent most of your time this week</h2>
            <input type="hidden" name="action" value="viewCharts">
            <input type="hidden" name="type" value="weekly">
            <input type="hidden" name="employeeName" value="<%=request.getParameter("employeeName") %>">
            <input type="submit" value="Weekly Task">
        </form>
        
        <form action="monthly.jsp" onsubmit="return confirmNavigation('monthly')">
            <h2>See where you have spent most of your time this month</h2>
            <input type="hidden" name="action" value="viewCharts">
            <input type="hidden" name="type" value="monthly">
            <input type="hidden" name="employeeName" value="<%=request.getParameter("employeeName") %>">
            <input type="submit" value="Monthly Task">
        </form>
    
        <a href="index.jsp">Back</a>
    </div>
</body>
</html>
