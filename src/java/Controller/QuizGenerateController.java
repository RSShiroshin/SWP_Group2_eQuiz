/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.QuestionDAO;
import Model.Answer;
import Model.Question;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author DELL
 */
public class QuizGenerateController extends HttpServlet {

    QuestionDAO qd = new QuestionDAO();
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
            out.println("<title>Servlet QuizGenerateController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizGenerateController at " + request.getContextPath() + "</h1>");
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
        qd.loadQuestion();
        qd.loadAnswer();
                
        ArrayList<Question> questionList = qd.getSubjectQuestion("ACC101");
        ArrayList<Question> quizQuestion = new ArrayList<>();
        ArrayList<Answer>  quizAnswer = new ArrayList<>();
        
//        String subject = request.getParameter("SubjectID");
//        int questionNum = Integer.parseInt(request.getParameter("questionNum")) ;
        int questionNum = 10;
        String subject = "ACC101";
        //Random cac cau hoi
        ArrayList<Integer> numbers = new ArrayList<Integer>();   
        Random randomGenerator = new Random();
        while (numbers.size() < questionNum) {

            int random = randomGenerator.nextInt(questionList.size());
            if (!numbers.contains(random)) {
                numbers.add(random);
            }
        }
        
        //add cau hoi cho quiz
         for (Integer number : numbers) {
            for (Question q : questionList) {
                if(q.getQuestionID() == (number+1)) {
                    quizQuestion.add(q);
                    ArrayList<Answer> questionAnswer = qd.getQuestionAnswer(q.getQuestionID());
                    for (Answer a : questionAnswer) {
                        quizAnswer.add(a);
                    }
                }
            }         
        }
        
        
        request.setAttribute("quizQuestion", quizQuestion);
        request.setAttribute("quizAnswer", quizAnswer);
        request.getRequestDispatcher("View/QuizView.jsp").forward(request, response);
        
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
