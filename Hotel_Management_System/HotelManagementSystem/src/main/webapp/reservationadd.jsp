<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f8;
        }
        .container {
            margin-top: 80px;
            max-width: 600px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Book a New Reservation</h2>
    <form action="AddReservationServlet" method="post">
        <div class="mb-3">
            <label for="reservationId" class="form-label">Reservation ID</label>
            <input type="text" class="form-control" id="reservationId" name="reservationId" required>
        </div>
        <div class="mb-3">
            <label for="customerName" class="form-label">Customer Name</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div class="mb-3">
            <label for="roomNumber" class="form-label">Room Number</label>
            <input type="text" class="form-control" id="roomNumber" name="roomNumber" required>
        </div>
        <div class="mb-3">
            <label for="checkIn" class="form-label">Check-In Date</label>
            <input type="date" class="form-control" id="checkIn" name="checkIn" required>
        </div>
        <div class="mb-3">
            <label for="checkOut" class="form-label">Check-Out Date</label>
            <input type="date" class="form-control" id="checkOut" name="checkOut" required>
        </div>
        <div class="mb-3">
            <label for="totalAmount" class="form-label">Total Amount</label>
            <input type="text" class="form-control" id="totalAmount" name="totalAmount" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Book Reservation</button>
        </div>
    </form>
    <div class="mt-3 text-center">
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>
</div>
</body>
</html>
