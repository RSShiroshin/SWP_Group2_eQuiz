/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.QuestionDAO;
import DAO.QuizDAO;
import Model.Answer;
import Model.Question;
//import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;

/**
 *
 * @author DELL
 */
public class QuizGenerateController extends HttpServlet {

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
        //Lay user dang tao quiz
//        HttpSession userSes = request.getSession();
//        User userLogin = (User) userSes.getAttribute("userLogin");
        
        //get current time start
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        String timeStart = dateFormat.format(cal.getTime());
        //get Score
        float score = 0;
                
        ArrayList<Question> questionList = qd.getQuestionBySubjectID("ACC101"); //sau la truyen ID cua subject
        ArrayList<Question> quizQuestion = new ArrayList<>();
        ArrayList<Answer>  quizAnswer = new ArrayList<>();
        
//        String subject = request.getParameter("SubjectID");
//        int questionNum = Integer.parseInt(request.getParameter("questionNum")) ;
        int questionNum = 10;
        String subject = "ACC101";
//        quiz.insertQuiz(subject, userLogin.getUserID(), timeStart, score);
        quiz.insertQuiz(subject, 6, timeStart, score);
        
//        int newQuizID = quiz.getLatestQuiz(userLogin.getUserID()).getQuizID();
        int newQuizID = quiz.getLatestQuiz(6);
        //Random cac cau hoi
        ArrayList<Integer> numbers = new ArrayList<>();   
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
                    //add cau hoi vao quiz
                    //vi moi tao nen user answer = 0
                    quizQuestion.add(q);
                    quiz.insertQuizHistory(newQuizID, q.getQuestionID(), 0);
                    ArrayList<Answer> questionAnswer = qd.getQuestionAnswer(q.getQuestionID());
                    for (Answer a : questionAnswer) {
                        //add cau tra loi vao question trong quiz
                        quizAnswer.add(a);
                    }
                }
            }         
        }
        
        request.setAttribute("quizID", newQuizID);
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
