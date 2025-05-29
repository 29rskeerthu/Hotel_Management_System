<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Reservation Home</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e0f7fa, #e0f2f1);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            padding: 40px;
            background-color: Black;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            text-align: center;
        }

        h1 {
            color: #00796b;
            margin-bottom: 30px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin: 15px 0;
        }

        a {
            display: inline-block;
            text-decoration: none;
            background-color: #00796b;
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #004d40;
        }

        footer {
            text-align: center;
            margin-top: 40px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Hotel Reservation System</h1>
        <ul>
            <li><a href="reservationadd.jsp">➕ Add Reservation</a></li>
        <li><a href="reservationupdate.jsp">✏ Update Reservation</a></li>
        <li><a href="reservationdelete.jsp">🗑 Delete Reservation</a></li>
        <li><a href="DisplayReservationsServlet">📋 View Reservations</a></li>
        <li><a href="reports.jsp">📊 Generate Reports</a></li>
        </ul>
    </div>
    <footer>
        &copy; 2025 Hotel Reservation System. All rights reserved.
    </footer>
</body>
</html>
