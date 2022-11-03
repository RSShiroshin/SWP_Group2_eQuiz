/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CourseDAO;
import Model.Course;
import Model.CourseCategory;
import Model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class HomeController extends HttpServlet {

    CourseDAO courseDAO;

    @Override
    public void init() {
        courseDAO = new CourseDAO();
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
//        Cookie linkFw =new Cookie("request.getContextPath()/home",link);
//        response.addCookie(linkFw);
        String c = "/home";
        Cookie link = new Cookie("link", c);
        response.addCookie(link);
        final int PAGE_SIZE = 6;
        courseDAO.loadCourse();
        courseDAO.loadCourseCategory();
        // show list categoryCourse
        List<CourseCategory> listCategories = courseDAO.getCategoryList();
        request.setAttribute("listCategories", listCategories);

        // paging
        int page = 1; // trang nào 
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        List<Course> listCourses = courseDAO.getCoursesWithPagging(page, PAGE_SIZE);
        int totalCourses = courseDAO.getCourseList().size();
        int totalPage = totalCourses / PAGE_SIZE;
        if (totalCourses % PAGE_SIZE != 0) {
            totalPage += 1;
        }

        //
        HttpSession session = request.getSession();
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("listCourses", listCourses);
        request.getSession().setAttribute("UrlHistory", "home");
        User user = (User) session.getAttribute("userLogin");
        if (user != null) {
            Cookie[] cookies = request.getCookies();
            String valueCourse = "";
            for (int i = 0; i < cookies.length; i++) {
                String courseHome = user.getUserName();
                if (courseHome.equals(cookies[i].getName())) {
                    valueCourse = cookies[i].getValue();
                    break;
                }
            }

            request.setAttribute("courseHome", valueCourse);
        }

//        
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
