/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class QuestionManagerController extends HttpServlet {

    QuestionDAO qdao;

    @Override
    public void init() {
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
            out.println("<title>Servlet QuestionManagerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionManagerController at " + request.getContextPath() + "</h1>");
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
        String subjectID = request.getParameter("subjectID");
        String numQues = request.getParameter("numQues");      
        if (numQues == null) {
            numQues = "1";
        }
        int numAns = 4;
        Cookie quesNum=new Cookie("numQues",String.valueOf(numQues));
        Cookie ansNum=new Cookie("numAns",String.valueOf(numAns));
        response.addCookie(quesNum);
        response.addCookie(ansNum);
        request.setAttribute("subjectID", subjectID);        
        
        
        request.getRequestDispatcher("View/QuestionManager.jsp").forward(request, response);
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
        String subjectID = request.getParameter("subjectID");
        String numAns = request.getParameter("numAns");
        String numQues = request.getParameter("numQues");
        for (int j = 1; j <= Integer.parseInt(numQues); j++) {
            qdao.insertQuestion(subjectID, request.getParameter("ques"+j), "");
            qdao.loadQuestion();
            int questionID = qdao.getQuestionBySubjectID(subjectID).get(qdao.getQuestionBySubjectID(subjectID).size() - 1).getQuestionID();
            for (int i = 1; i <= Integer.parseInt(numAns); i++) {
                qdao.insertAnswerByQuestionID(questionID, request.getParameter("ques"+j+"ans" + i));
            }
        }
        response.sendRedirect("QuestionManagerController");
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
