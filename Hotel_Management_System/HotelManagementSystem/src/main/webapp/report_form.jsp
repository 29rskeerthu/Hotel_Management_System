<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 50px;
        }
        .container {
            max-width: 500px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<div class="container mx-auto">
    <h2>Generate Reservation Report</h2>
    <form action="ReportServlet" method="post">
        <div class="mb-3">
            <label for="from" class="form-label">From Date:</label>
            <input type="date" class="form-control" id="from" name="from" required>
        </div>
        <div class="mb-3">
            <label for="to" class="form-label">To Date:</label>
            <input type="date" class="form-control" id="to" name="to" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Generate Report</button>
        </div>
    </form>
</div>

</body>
</html>
