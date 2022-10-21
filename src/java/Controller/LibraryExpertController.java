/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CourseDAO;
import DAO.ExpertAssignDAO;
import DAO.SubjectDAO;
import DAO.UserDAO;
import Model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class LibraryExpertController extends HttpServlet {
    CourseDAO cd;
    SubjectDAO sd;
    @Override
    public void init() {
        cd = new CourseDAO();  
        sd = new SubjectDAO();
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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

        }
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
        //processRequest(request, response);
         HttpSession acc=request.getSession(); 
         request.setAttribute("acc", acc);
         
        String userID = request.getParameter("userID");        
        ExpertAssignDAO ex = new ExpertAssignDAO();        
        sd.loadSubject();
        ex.loadExpertAssign();
        ex.loadCustomerAssign();
        cd.loadCourse();
        User u = checkRole(Integer.parseInt(userID));
        ArrayList<ExpertAssign> lstEA = new ArrayList<>();
        
        if (u != null && u.getRole() == 1) {
            for (ExpertAssign expert : ex.getExpertAssignList()) {
                if (u.getUserID() == expert.getUserID()) {
                    lstEA.add(new ExpertAssign(u.getUserID(), expert.getSubjectID()));
                }
            }
        }
        if (u != null && u.getRole() == 2) {
            for (ExpertAssign cus : ex.getCustomerAssignList()) {
                if (u.getUserID() == cus.getUserID()) {
                    lstEA.add(new ExpertAssign(u.getUserID(), cus.getSubjectID()));
                }
            }
        }
        
        request.setAttribute("role", u.getRole());
        request.setAttribute("lstSubject", sd.getSubjectList());
        request.setAttribute("lstCourse", cd.getCourseList());
        request.setAttribute("lstEA", lstEA);

        request.getRequestDispatcher("View/ExpertAssign.jsp").forward(request, response);

    }

    public User checkRole(int id) {
        UserDAO u = new UserDAO();
        u.loadUser();
        for (User us : u.getUserList()) {
            if (us.getUserID() == id) {
                return us;
            }
        }
        return null;
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
        processRequest(request, response);
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
