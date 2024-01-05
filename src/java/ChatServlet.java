
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String jdbcUri = getServletContext().getInitParameter("jdbcUri");
        String dbUri = getServletContext().getInitParameter("dbUri");
        String dbId = getServletContext().getInitParameter("dbId");
        String dbPass = getServletContext().getInitParameter("dbPass");

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        HttpSession session = request.getSession();
        String from = (String) session.getAttribute("userEmail");
        String to = request.getParameter("userId");
        String message = request.getParameter("message");
        Timestamp msgTime = new Timestamp(System.currentTimeMillis());

        try {
            Class.forName(jdbcUri);

            try (Connection con = DriverManager.getConnection(dbUri, dbId, dbPass)) {
                PreparedStatement ps1 = con.prepareStatement("SELECT * FROM chatusers WHERE mail=?");
                ps1.setString(1, to);

                try (var rs = ps1.executeQuery()) {
                    if (!rs.next()) {
                        String error = "No such user found with id: " + to;
                        request.setAttribute("error", error);
                        RequestDispatcher rd = request.getRequestDispatcher("chat.jsp");
                        rd.include(request, response);
                    } else {
                        try (PreparedStatement ps2 = con.prepareStatement("INSERT INTO chattbl(sender, receiver, msg, msg_time) values(?,?,?,?)")) {
                            ps2.setString(1, from);
                            ps2.setString(2, to);
                            ps2.setString(3, message);
                            ps2.setTimestamp(4, msgTime);

                            int i = ps2.executeUpdate();

                            response.sendRedirect("ReceiveMessageServet");
                        }
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ChatServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("exception", ex.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("chat.jsp");
            rd.include(request, response);
        }
    }
}
