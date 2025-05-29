package servlet;

import dao.ReservationDAO;
import model.Reservation;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

@WebServlet("/DisplayReservationsServlet")
public class DisplayReservationsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = null;

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection (update username/password if needed)
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "");

            // Fetch reservations
            ReservationDAO dao = new ReservationDAO(conn);
            List<Reservation> list = dao.getAllReservations();

            // Set request attribute
            request.setAttribute("reservations", list);

            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("reservationdisplay.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error loading reservations: " + e.getMessage());
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
