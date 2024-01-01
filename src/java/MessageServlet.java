
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import myClasses.Message;
import myClasses.MessageDAO;

public class MessageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private MessageDAO messageDAO; // Declare a field

    @Override
    public void init() throws ServletException {
        super.init();

        // Note: You can still initialize the MessageDAO here if needed
    }

    // Use dependency injection to set the MessageDAO instance
    public void setMessageDAO(MessageDAO messageDAO) {
        this.messageDAO = messageDAO;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String receiver = request.getParameter("receiver");
        response.setContentType("text/html");

        // Use the messageDAO field instead of creating a new instance
        List<Message> messages = messageDAO.getMessagesByReceiver(receiver);

        request.setAttribute("messages", messages);
        RequestDispatcher dispatcher = request.getRequestDispatcher("messages.jsp");
        dispatcher.forward(request, response);
    }
}
