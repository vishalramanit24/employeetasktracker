<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Monthly Bar Chart</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f5;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        img {
            max-width: 80%;
            height: auto;
            border: 3px solid #a1a1a1;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s;
        }

        img:hover {
            transform: scale(1.05);
        }

        h1 {
            color: #34495e;
            margin-bottom: 25px;
            font-weight: 400;
        }

        .back-link {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 15px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .back-link:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>Monthly Bar Chart</h1>
    <img src="ChartServlet?action=viewCharts&type=monthly&employeeName=<%= request.getParameter("employeeName") %>" alt="Monthly Bar Chart" />
    <a href="index.jsp" class="back-link">Back to Dashboard</a>
</body>
</html>
