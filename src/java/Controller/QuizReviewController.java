/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.QuestionDAO;
import DAO.QuizDAO;
import Model.Answer;
import Model.Question;
import Model.QuizCheck;
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
public class QuizReviewController extends HttpServlet {

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
            out.println("<title>Servlet QuizReviewController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizReviewController at " + request.getContextPath() + "</h1>");
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
//        request.getRequestDispatcher("View/QuizReviewView.jsp").forward(request, response);
        doPost(request, response);
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
        
        int quizID = Integer.parseInt(request.getParameter("quizID"));
        ArrayList<Integer> quizQuestion = quiz.getQuizQuestion(quizID);
        
        //take and update user answer trong DB
        ArrayList<Integer> questionList = new ArrayList<>(); 
        ArrayList<Integer> answerList = new ArrayList<>();
        for (int ques : quizQuestion) {
            int questionID = Integer.parseInt(request.getParameter("question"+ques+""));
            questionList.add(questionID);
        }
        for (int ans : quizQuestion) {
            if(request.getParameter("answer"+ans+"") != null){
                int answerID = Integer.parseInt(request.getParameter("answer"+ans+""));
                answerList.add(answerID);
            } else {
                int answerID = 0;
                answerList.add(answerID);
            }
        }
        
        for(int i =0;i<questionList.size();i++) {
            quiz.updateUserAnswer(quizID, questionList.get(i), answerList.get(i));
        }
        
        //so sanh user answer vs correct answer
        ArrayList<QuizCheck> check = quiz.getQuizCheck(quizID);
        int countCorrect = 0;
        for (QuizCheck quizCheck : check) {
            if (quizCheck.isIsAnswer() == true) {
                quiz.updateUserIsCorrect(quizID, quizCheck.getQuestionID(), true);
                countCorrect++;
            }
        }   
        float score = (float) (countCorrect*10)/check.size();
        
        
        //tinhs score and update quiz score in DB
        quiz.updateQuizScore(quizID, score);
        
        //set attribute r nhay sang trang quiz review
        request.setAttribute("quizReviewID", quizID); 
        quiz.closeConnection();
        request.getRequestDispatcher("QuizViewScoreController").forward(request, response);
//        request.getRequestDispatcher("View/QuizReviewView.jsp").forward(request, response); 
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
