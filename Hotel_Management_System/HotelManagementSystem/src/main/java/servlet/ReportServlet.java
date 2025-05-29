package servlet;

import dao.ReservationDAO;
import model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fromStr = request.getParameter("from");
        String toStr = request.getParameter("to");

        try {
            Date fromDate = null;
            Date toDate = null;

            // Parse input dates
            if (fromStr != null && !fromStr.isEmpty()) {
                fromDate = sdf.parse(fromStr);
            }
            if (toStr != null && !toStr.isEmpty()) {
                toDate = sdf.parse(toStr);
            }

            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel?useSSL=false&serverTimezone=UTC", "root", "")) {

                ReservationDAO dao = new ReservationDAO(conn);
                List<Reservation> list;

                // Fetch data based on date range
                if (fromDate != null && toDate != null) {
                    list = dao.getReservationsByDateRange(fromDate, toDate);
                } else {
                    list = dao.getAllReservations();
                }

                // Calculate total revenue
                double totalRevenue = 0.0;
                for (Reservation r : list) {
                    totalRevenue += r.getTotalAmount();
                }

                // Set data for the JSP
                request.setAttribute("reportList", list);
                request.setAttribute("revenue", totalRevenue);
                request.setAttribute("from", fromStr);
                request.setAttribute("to", toStr);

                // Forward to report result page
                RequestDispatcher rd = request.getRequestDispatcher("report_result.jsp");
                rd.forward(request, response);

            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error generating report: " + e.getMessage(), e);
        }
    }
}
