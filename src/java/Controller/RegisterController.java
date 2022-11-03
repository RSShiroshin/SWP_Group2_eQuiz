package Controller;

import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 *
 * @author hello
 */
public class RegisterController extends HttpServlet {

    UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    public static void SendEmail(String getEmail) throws MessagingException, UnsupportedEncodingException {

        //Email cua ban
        final String fromEmail = "";
        // Mat khai email cua ban
        final String password = "";
        // dia chi email nguoi nhan
        final String toEmail = "" + getEmail;

        final String subject = "Java Example Test";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
        message.setSubject(subject);

        message.setSubject("HTML Message");
        String htmlContent = "<h1>Html Tag</h1>";
        message.setContent(htmlContent, "text/html");

        Transport.send(message);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet RegisterController</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("View/register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.io.UnsupportedEncodingException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        String username = request.getParameter("user");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String rePassword = request.getParameter("repass");
        String error;
        int role = 2;
        boolean status = false;
        String avatar = "";
        String description = "";
        String date_raw = "2022-10-18";
        String fullname = request.getParameter("fullname");
        Date date = Date.valueOf(date_raw);
        if (checkDupInfor(userDAO,username, email, fullname) == false) {
            checkDupInput(request, userDAO, username, email, fullname);
            userDAO.closeConnection();
            request.getRequestDispatcher("View/register.jsp").forward(request, response);
        } else {
            if (!password.equals(rePassword)) {
                error = "Re-enter password isn't match! please try again";
                request.setAttribute("error", error);
                userDAO.closeConnection();
                request.getRequestDispatcher("View/register.jsp").forward(request, response);
            } else {
                String sha256Pass = "";
                try {
                    MessageDigest digest = MessageDigest.getInstance("SHA-256");
                    byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
                    sha256Pass = convertByteToString(hash);
                } catch (NoSuchAlgorithmException ex) {
                    System.out.println("" + ex);
                }
                try {
                    SendEmail(email);
                } catch (MessagingException ex) {
                    System.out.println("" + ex);
                }
                userDAO.insertUser(username, sha256Pass, fullname, email, avatar, description, role, status, date);
                processRequest(request, response);

                response.sendRedirect("login");
            }
        }
    }

    public static String convertByteToString(byte[] byteValue) {
        String stringValue = "" + Arrays.toString(byteValue);
        return (stringValue);
    }

    public boolean checkDupInfor(UserDAO userDAO,String username, String email, String fullname) {
        User checkDupUsername = userDAO.checkDupAcc(username);
        User checkDupEmail = userDAO.checkDupAcc(email);
        User checkDupFullName = userDAO.checkDupAcc(fullname);
        if (checkDupFullName != null || checkDupEmail != null || checkDupUsername != null) {
            return false;
        }
        return true;
    }

    public void checkDupInput(HttpServletRequest request, UserDAO userDAO, String username, String email, String fullname) {
        String usererror = "";
        String emailerror = "";
        String fullnameerror = "";
        User checkDupUsername = userDAO.checkDupAcc(username);
        User checkDupEmail = userDAO.checkDupAcc(email);
        User checkDupFullName = userDAO.checkDupAcc(fullname);
        if (checkDupUsername != null) {
            usererror = "Duplicate Username";
            request.setAttribute("usererror", usererror);
        }
        if (checkDupEmail != null) {
            emailerror = "Duplicate email";
            request.setAttribute("emailerror", emailerror);
        }
        if (checkDupFullName != null) {
            fullnameerror = "Duplicate fullname";
            request.setAttribute("fullnameerror", fullnameerror);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
