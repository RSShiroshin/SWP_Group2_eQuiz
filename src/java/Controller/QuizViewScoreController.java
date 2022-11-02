/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.QuestionDAO;
import DAO.QuizDAO;
import Model.Answer;
import Model.Question;
import Model.QuizHistory;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class QuizViewScoreController extends HttpServlet {

    QuestionDAO qd ;
    QuizDAO quiz ;
    @Override
    public void init() {
        qd = new QuestionDAO();
        quiz = new QuizDAO();
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
            out.println("<title>Servlet QuizViewScoreController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizViewScoreController at " + request.getContextPath() + "</h1>");
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
        
        int quizID = 0;
        
        if(request.getAttribute("quizReviewID")!=null){
            quizID = (int) request.getAttribute("quizReviewID");
        }
        
        if(request.getParameter("quizReviewID")!=null){
            quizID = Integer.parseInt(request.getParameter("quizReviewID"));
        }
        ArrayList<Integer> quizQuestionID = quiz.getQuizQuestion(quizID);
        ArrayList<Question> quizQuestion = new ArrayList<>();
        ArrayList<Answer>  quizAnswer = new ArrayList<>();
        
        for (Integer id : quizQuestionID) {
            quizQuestion.add(qd.getQuestion(id));
            ArrayList<Answer> questionAnswer = qd.getQuestionAnswer(qd.getQuestion(id).getQuestionID());
            for (Answer a : questionAnswer) {
            //add cau tra loi vao question trong quiz
                quizAnswer.add(a);
            }
        }
        
        ArrayList<QuizHistory> check = quiz.getQuizHistory(quizID);
        
        request.setAttribute("quizReviewID", quizID);
        request.setAttribute("quizQuestion", quizQuestion);
        request.setAttribute("quizAnswer", quizAnswer);
        request.setAttribute("check", check);

        request.getRequestDispatcher("View/QuizReviewView.jsp").forward(request, response);
//        processRequest(request, response);
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
//        processRequest(request, response);
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
