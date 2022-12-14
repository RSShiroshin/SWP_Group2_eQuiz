/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import DAO.CourseDAO;
import DAO.SubjectDAO;
import Model.Course;
//import Model.Course;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class CourseManagerController extends HttpServlet {

    CourseDAO cdao;
    SubjectDAO sdao;

    @Override
    public void init() {
        cdao = new CourseDAO();
        sdao = new SubjectDAO();
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
            out.println("<title>Servlet CourseManagerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseManagerController at " + request.getContextPath() + "</h1>");
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
        String type = request.getParameter("type");
        if (type == null) {
            cdao.loadCourse();
            cdao.loadCourseCategory();
            sdao.loadSubject();

            request.setAttribute("clist", cdao.getCourseList());
            request.setAttribute("cclist", cdao.getCategoryList());
            request.setAttribute("slist", sdao.getSubjectList());

            request.getRequestDispatcher("View/admin/CourseManager.jsp").forward(request, response);
        } else if (type.equals("1")) {
            String courseID = request.getParameter("courseID");
            cdao.loadCourse();
            cdao.loadCourseCategory();
            sdao.loadSubject();
            if (sdao.getSubjectListByCourseID(courseID).isEmpty()) {
                cdao.deleteCourse(courseID);
            }
            cdao.loadCourse();
            cdao.loadCourseCategory();
            sdao.loadSubject();
            request.setAttribute("clist", cdao.getCourseList());
            request.setAttribute("cclist", cdao.getCategoryList());
            request.setAttribute("slist", sdao.getSubjectList());
            request.getRequestDispatcher("View/admin/CourseManager.jsp").forward(request, response);
        } else if (type.equals("2")) {
            cdao.loadCourse();
            cdao.loadCourseCategory();
            sdao.loadSubject();
            for (Course c : cdao.getCourseList()) {
                if (c.getCourseID().equals(request.getParameter(c.getCourseID()))) {
                    String name = request.getParameter(c.getCourseID() + "0").trim();
                    String description = null;
                    if(request.getParameter(c.getCourseID() + "1").trim()!=null||!request.getParameter(c.getCourseID() + "1").trim().equals("")){
                        description = request.getParameter(c.getCourseID() + "1").trim();
                    }                   
                    int cate = Integer.parseInt(request.getParameter(c.getCourseID() + "2"));
                    String thumb = null;
                    if(request.getParameter(c.getCourseID() + "3").trim()!=null||!request.getParameter(c.getCourseID() + "3").trim().equals("")){
                        thumb = request.getParameter(c.getCourseID() + "3").trim();
                    }  
                    cdao.updateCourse(c.getCourseID(), name, description, cate, thumb);
                }

            }
            response.sendRedirect("CourseManagerController");

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
        String courseID = request.getParameter("id");
        String courseName = request.getParameter("name");
        int categoryID = Integer.parseInt(request.getParameter("category"));
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("thumbnail");
        cdao.insertCourse(courseID, courseName, description, categoryID, thumbnail);
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
