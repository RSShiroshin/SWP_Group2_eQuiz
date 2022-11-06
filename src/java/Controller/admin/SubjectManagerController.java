/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import DAO.CourseDAO;
import DAO.QuestionDAO;
import DAO.SubjectDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class SubjectManagerController extends HttpServlet {

    SubjectDAO sdao;
    CourseDAO cdao;
    UserDAO udao;
    QuestionDAO qdao;

    @Override
    public void init() {
        sdao = new SubjectDAO();
        cdao = new CourseDAO();
        udao = new UserDAO();
        qdao = new QuestionDAO();
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubjectManagerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectManagerController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        sdao.loadSubject();
        String type = request.getParameter("type");
        String courseID = request.getParameter("courseID");
               
        if (type == null) {
            request.setAttribute("expertlist", udao.getExpertList());
            request.setAttribute("assignlist", udao.getExpertAssignList());
            request.setAttribute("slist", sdao.getSubjectListByCourseID(courseID));
            request.setAttribute("cId", courseID);
            request.setAttribute("course", cdao.getCourseById(courseID));
            request.setAttribute("num", sdao.getSubjectListByCourseID(courseID).size());

            request.getRequestDispatcher("View/admin/SubjectManager.jsp").forward(request, response);
        } else if (type.equals("1")) {
            String subjectID = request.getParameter("subjectID");
            String subjectName = request.getParameter("name");
            String description = request.getParameter("description");
            sdao.updateSubject(subjectID, subjectName, description);
            cdao.loadCourse();           
            sdao.loadSubject();
            request.setAttribute("expertlist", udao.getExpertList());
            request.setAttribute("assignlist", udao.getExpertAssignList());
            request.setAttribute("slist", sdao.getSubjectListByCourseID(courseID));
            request.setAttribute("cId", courseID);
            request.setAttribute("course", cdao.getCourseById(courseID));
            request.setAttribute("num", sdao.getSubjectListByCourseID(courseID).size());

            request.getRequestDispatcher("View/admin/SubjectManager.jsp").forward(request, response);
        } else if (type.equals("2")) {
            
            String subjectID = request.getParameter("subjectID");
            if(qdao.getQuestionBySubjectID(subjectID).isEmpty()){
                sdao.deleteSubject(subjectID);
            } 
            cdao.loadCourse();           
            sdao.loadSubject();
            request.setAttribute("expertlist", udao.getExpertList());
            request.setAttribute("assignlist", udao.getExpertAssignList());
            request.setAttribute("slist", sdao.getSubjectListByCourseID(courseID));
            request.setAttribute("cId", courseID);
            request.setAttribute("course", cdao.getCourseById(courseID));
            request.setAttribute("num", sdao.getSubjectListByCourseID(courseID).size());

            request.getRequestDispatcher("View/admin/SubjectManager.jsp").forward(request, response);

        }

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
        String courseID = request.getParameter("courseID");
        String subjectID = request.getParameter("id");
        String subjectName = request.getParameter("name");
        String description = request.getParameter("description");
        sdao.insertSubject(subjectID, subjectName, description, courseID);
        doGet(request, response);
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
