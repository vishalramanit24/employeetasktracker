<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weekly Chart</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            color: #444;
        }

        .chart-container {
            background-color: #fff;
            padding: 40px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            max-width: 85%;
            width: 800px;
            text-align: center;
            margin: 30px;
        }

        h1 {
            font-size: 28px;
            color: #2e8b57;
            margin-bottom: 25px;
        }

        img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            border: 2px solid #ccc;
        }

        .back-button {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 25px;
            font-size: 18px;
            color: #fff;
            background-color: #2e8b57;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #1e6b45;
        }
    </style>
</head>
<body>
    <div class="chart-container">
        <h1>Weekly Performance Chart</h1>
        <img src="ChartServlet?action=viewCharts&type=weekly&employeeName=<%= request.getParameter("employeeName") %>" alt="Weekly Performance Chart" />
        <a href="index.jsp" class="back-button">Back to Dashboard</a>
    </div>
</body>
</html>
