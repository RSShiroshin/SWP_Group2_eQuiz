package Controller;

import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hello
 */
public class loginController extends HttpServlet {

     UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
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
        request.getRequestDispatcher("View/Login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("id");
        String password = request.getParameter("pass");
        UserDAO userdao = new UserDAO();       
        User acc = userdao.checkLogin(username, password);
        
        HttpSession userLogin=request.getSession(); 
        
        
        String error = "";
            if(acc == null) {
            error = "Username or Password is invaild";
            request.setAttribute("error", error);
            request.getRequestDispatcher("View/Login.jsp").forward(request, response);
            } else {       
                userLogin.setAttribute("userLogin", acc);
                if(acc.getRole() == 0){
                     //chuyen huong den trang cua admin
                     
                 } else if(acc.getRole() == 1){
                     //chuyen huong den trang cua expert
                 } else if(acc.getRole() == 2){
                  //chuyen huong den trang cua customer
                  request.getRequestDispatcher("home").forward(request, response);
                 } 
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
