/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.QuestionDAO;
import DAO.QuizDAO;
import DAO.SubjectDAO;
import Model.Answer;
import Model.Question;
import Model.User;
//import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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

    QuestionDAO qd;
    QuizDAO quiz;
    SubjectDAO sd;

    @Override
    public void init() {
        qd = new QuestionDAO();
        quiz = new QuizDAO();
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
        HttpSession userSes = request.getSession();
        User userLogin = (User) userSes.getAttribute("userLogin");
        String courseID = request.getParameter("courseID");
        String subject = request.getParameter("SubjectID");
        int questionNum = 10;
        boolean QuizNull = false;
        
        if(request.getParameter("questionNum")!=null) {
            questionNum = Integer.parseInt(request.getParameter("questionNum"));
        }
        
        if (questionNum <= 0) {
            questionNum = 1;
        }
            
           
        if(qd.getQuestionBySubjectID(subject).size()<=0){
            QuizNull = true;  
        } else if(questionNum > qd.getQuestionBySubjectID(subject).size()) {
            questionNum = qd.getQuestionBySubjectID(subject).size();
        }
        if (userLogin != null) {
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String timeStart = dateFormat.format(cal.getTime());
            //get Score
            float score = 0;
            

            ArrayList<Question> questionList = qd.getQuestionBySubjectID(subject); //sau la truyen ID cua subject
            ArrayList<Question> quizQuestion = new ArrayList<>();
            ArrayList<Answer> quizAnswer = new ArrayList<>();

//        int questionNum = 20;
//        String subject = "SWT301";
            if(questionList.size()>0) {
                quiz.insertQuiz(subject, userLogin.getUserID(), timeStart, score);
    //            quiz.insertQuiz(subject, 5, timeStart, score);

                int newQuizID = quiz.getLatestQuiz(userLogin.getUserID());
    //        int newQuizID = quiz.getLatestQuiz(5);
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
                        if (questionList.indexOf(q) == number) {
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
                
                request.setAttribute("maxQuestionNum", qd.getQuestionBySubjectID(subject).size());
                request.setAttribute("courseID", courseID);
                request.setAttribute("SubjectID", subject);
                request.setAttribute("quizID", newQuizID);
                request.setAttribute("quizQuestion", quizQuestion);
                request.setAttribute("quizAnswer", quizAnswer);
            }
        

            request.setAttribute("QuizNull", QuizNull);  
            

            request.getRequestDispatcher("View/QuizView.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("login").forward(request, response);
        }

        //get current time start
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
