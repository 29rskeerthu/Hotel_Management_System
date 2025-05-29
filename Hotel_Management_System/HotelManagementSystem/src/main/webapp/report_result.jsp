<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Reservation, java.text.SimpleDateFormat" %>
<%
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reportList");
    Double revenue = (Double) request.getAttribute("revenue");
    if (revenue == null) revenue = 0.0;

    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Reservation Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Reservation Report</h2>

    <%
        if (reservations != null && !reservations.isEmpty()) {
    %>
    <table class="table table-bordered table-striped">
        <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Room</th>
                <th>Check-In</th>
                <th>Check-Out</th>
                <th>Total (₹)</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Reservation r : reservations) {
        %>
            <tr>
                <td><%= r.getReservationID() %></td>
                <td><%= r.getCustomerName() %></td>
                <td><%= r.getRoomNumber() %></td>
                <td><%= (r.getCheckIn() != null) ? dateFormat.format(r.getCheckIn()) : "" %></td>
                <td><%= (r.getCheckOut() != null) ? dateFormat.format(r.getCheckOut()) : "" %></td>
                <td><%= String.format("%.2f", r.getTotalAmount()) %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="alert alert-success text-center mt-4">
        <strong>Total Revenue:</strong> ₹<%= String.format("%.2f", revenue) %>
    </div>
    <%
        } else {
    %>
    <div class="alert alert-warning text-center">
        No reservations found in this date range.
    </div>
    <%
        }
    %>
</div>
</body>
</html>
