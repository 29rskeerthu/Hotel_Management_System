<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Reservation" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            padding: 40px;
            background-color: #f8f9fa;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        .error {
            color: red;
            font-weight: bold;
            text-align: center;
        }
        .no-data {
            text-align: center;
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Reservation List</h2>

    <%
        List<Reservation> list = (List<Reservation>) request.getAttribute("reservations");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if (list == null) {
    %>
        <p class="error">Error: No reservation list found in request attribute. Please access via <code>/DisplayReservationsServlet</code>.</p>
    <%
        } else if (list.isEmpty()) {
    %>
        <p class="no-data">No reservations found.</p>
    <%
        } else {
    %>
        <div class="table-responsive">
            <table class="table table-bordered table-striped text-center">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Room</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (Reservation r : list) {
                %>
                    <tr>
                        <td><%= r.getReservationID() %></td>
                        <td><%= r.getCustomerName() %></td>
                        <td><%= r.getRoomNumber() %></td>
                        <td><%= sdf.format(r.getCheckIn()) %></td>
                        <td><%= sdf.format(r.getCheckOut()) %></td>
                        <td><%= String.format("%.2f", r.getTotalAmount()) %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    <%
        }
    %>
</div>
</body>
</html>
