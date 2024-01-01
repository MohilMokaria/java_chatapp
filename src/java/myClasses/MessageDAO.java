package myClasses;

import jakarta.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO extends HttpServlet {

    private static final long serialVersionUID = 1L;
    String jdbcUri = getServletContext().getInitParameter("jdbcUri");
    String dbUri = getServletContext().getInitParameter("dbUri");
    String dbId = getServletContext().getInitParameter("dbId");
    String dbPass = getServletContext().getInitParameter("dbPass");

    public List<Message> getMessagesByReceiver(String receiver) {
        List<Message> messages = new ArrayList<>();

        try {
            Class.forName(jdbcUri);
            try (Connection connection = DriverManager.getConnection(dbUri, dbId, dbPass)) {

                String sql = "SELECT sender, receiver, msg, msg_time FROM chattbl WHERE receiver = ?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, receiver);

                    try (ResultSet resultSet = statement.executeQuery()) {
                        while (resultSet.next()) {
                            Message message = new Message();
                            message.setSender(resultSet.getString("sender"));
                            message.setReceiver(resultSet.getString("receiver"));
                            message.setMsg(resultSet.getString("msg"));
                            message.setMsgTime(resultSet.getTimestamp("msg_time"));
                            messages.add(message);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in your application
        }

        return messages;
    }
}
