<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily Pie Chart</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #e3f2fd;
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
            border: 3px solid #42a5f5;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
        }

        h1 {
            color: #1e88e5;
            margin-bottom: 25px;
        }

        .back-link {
            display: block;
            margin-top: 25px;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #1e88e5;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
            background-color: #1565c0;
        }

        .tooltip {
            display: none;
            position: absolute;
            background-color: rgba(0, 0, 0, 0.75);
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const img = document.querySelector('img');
            const tooltip = document.createElement('div');
            tooltip.className = 'tooltip';
            document.body.appendChild(tooltip);

            img.addEventListener('mousemove', function(event) {
                tooltip.style.left = event.pageX + 10 + 'px';
                tooltip.style.top = event.pageY + 10 + 'px';
                tooltip.textContent = 'Hovering over the pie chart';
                tooltip.style.display = 'block';
            });

            img.addEventListener('mouseout', function() {
                tooltip.style.display = 'none';
            });
        });
    </script>
</head>
<body>
    <h1>Daily Pie Chart</h1>
    <img src="ChartServlet?action=viewCharts&type=daily&employeeName=<%= request.getParameter("employeeName") %>" alt="Daily Pie Chart" />
    <a href="index.jsp" class="back-link">Back to Dashboard</a>
</body>
</html>
