/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CourseDAO;
import Model.Course;
import Model.CourseCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class HomeController extends HttpServlet {

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
        final int PAGE_SIZE = 6;
        // show list categoryCourse
        CourseDAO courseDAO = new CourseDAO();
        courseDAO.loadCourseCategory();
        List<CourseCategory> listCategories = courseDAO.getCategoryList();
        request.setAttribute("listCategories", listCategories);

        // paging
        int page = 1; // trang nào 
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }
        
        List<Course> listCourses = courseDAO.getCoursesWithPagging(page, PAGE_SIZE);
        int totalCourses = courseDAO.getTotalCourses();
        int totalPage = totalCourses / PAGE_SIZE;
        if (totalCourses % PAGE_SIZE != 0) {
            totalPage += 1;
        }

        //
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);

        request.setAttribute("listCourses", listCourses);

        request.getSession().setAttribute("UrlHistory", "home");
        request.getRequestDispatcher("View/Home.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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


