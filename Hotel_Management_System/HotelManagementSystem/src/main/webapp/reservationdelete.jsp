<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Reservation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f8;
        }
        .container {
            margin-top: 100px;
            max-width: 500px;
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
    <h2>Delete Reservation</h2>
    <form action="DeleteReservationServlet" method="post">
        <div class="mb-3">
            <label for="reservationID" class="form-label">Reservation ID</label>
            <input type="text" class="form-control" id="reservationID" name="reservationID" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-danger">Delete Reservation</button>
        </div>
    </form>
</div>
</body>
</html>
