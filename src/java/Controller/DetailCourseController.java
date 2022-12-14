/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CourseDAO;
import DAO.QuestionDAO;
import DAO.SubjectDAO;
import Model.Course;
import Model.Question;
import Model.Register;
import Model.Subject;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DetailCourseController extends HttpServlet {

    SubjectDAO sdao;
    CourseDAO courseDAO;
    QuestionDAO questdao;

    @Override
    public void init() {
        sdao = new SubjectDAO();
        courseDAO = new CourseDAO();
        questdao = new QuestionDAO();
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
        HttpSession session = request.getSession();

        courseDAO.loadCourse();
        courseDAO.loadCourseRegister();
        String courseID = request.getParameter("courseID");
//        Cookie cookie = DetailCourseController.getCookie(request, "link");
        String l = "/DetailCourseController?courseID=" + courseID;

//        if (cookie != null) {
//            cookie.setValue(l);
//            response.addCookie(cookie);
//        }
        sdao.loadSubject();
        ArrayList<Subject> slist = sdao.getSubjectListByCourseID(courseID);
        ArrayList<Course> clist = courseDAO.getCourseList();
        QuestionDAO question = new QuestionDAO();
        question.loadQuestion();
        SubjectDAO sDAO = new SubjectDAO();
        sDAO.loadSubject();
        List<Subject> listSubject = sDAO.getSubjectList();
        User user = (User) session.getAttribute("userLogin");
        int check = 0;
        if (user == null) {
            check = 0;
        } else {
            check = checkRegister(courseDAO.getCourseRegister(), user.getUserID(), courseID);
        }
        String link = "/DetailCourseController?courseID=" + courseID;
        Cookie cookie = DetailCourseController.getCookie(request, "link");
        if(user!=null){
            
        
        Cookie checkCourseHome = DetailCourseController.getCookie(request, user.getUserName());
        String nameCkie = user.getUserName();
        if (checkCourseHome == null) {
            Cookie courseHome = new Cookie(nameCkie, courseID);
            response.addCookie(courseHome);
        }
        int chck = 0;
        if (checkCourseHome != null) {
            String tempValue = checkCourseHome.getValue();
            String[] arrayCourseID = tempValue.split("/");
            for (int i = 0; i < Math.min(arrayCourseID.length, 3); i++) {
                if (arrayCourseID[i].equals(courseID)) {
                    chck = 1;
                    break;
                } else {
                    chck = 0;
                }
            }

            if (chck == 0) {
                String tempValue1 = courseID + "/" + checkCourseHome.getValue();
                checkCourseHome.setValue(tempValue1);
                response.addCookie(checkCourseHome);
            }
        }
        }
        if (cookie != null) {
            cookie.setValue(link);
            response.addCookie(cookie);
        }
        
        //khai edit 
        ArrayList<Integer> listNumQuest = new ArrayList();
        for (Subject subject : slist) {
            listNumQuest.add(questdao.getQuestionBySubjectID(subject.getSubjectID()).size())  ;
        }
        
        request.setAttribute("listNumQuest", listNumQuest);
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("num", slist.size());
        request.setAttribute("slist", slist);
        request.setAttribute("courseList", clist);
        request.setAttribute("statusRegister", check);
        request.setAttribute("cId", courseID);

        request.getRequestDispatcher("View/courseDetail.jsp").forward(request, response);
    }

//   start cookie
    public static Cookie getCookie(HttpServletRequest request, String name) {
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals(name)) {
                    return cookie;
                }
            }
        }

        return null;
    }
//    end cookie

    public int checkRegister(ArrayList<Register> res, int usid, String cid) {
        for (Register re : res) {
            if (re.getCourseID().equals(cid) && re.getUserID() == usid) {
                return 1;
            }
        }
        return 0;
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
