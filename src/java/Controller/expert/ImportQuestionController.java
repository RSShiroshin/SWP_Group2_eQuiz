/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.expert;

import DAO.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author DELL
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 5, // 5 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class ImportQuestionController extends HttpServlet {

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
            out.println("<title>Servlet ImportQuestionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportQuestionController at " + request.getContextPath() + "</h1>");
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
        Part filePart = request.getPart("file");
        String subjectID = request.getParameter("subjectID");
        String fileName = filePart.getSubmittedFileName();
        filePart.write("D:\\" + fileName);
        ArrayList<String> list = new ArrayList<>();
        ArrayList<String> list1 = new ArrayList<>();
        File file = new File("D:\\" + fileName);
        StringBuilder question = new StringBuilder();
        try ( Scanner myReader = new Scanner(file)) {

            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                question.append(data.trim()).append("\n");
            }
        }
        if (file.delete()) {
            question.trimToSize();
            String[] q = question.toString().split("--");
            for (int i = 0; i < q.length; i++) {
                if (i % 2 == 0) {
                    list.add(q[i].trim());
                } else {
                    list1.add(q[i].trim());
                }
            }
            QuestionDAO qdao = new QuestionDAO();
            for (int i = 0; i < list.size()-1; i++) {
                String[] qlist = list.get(i).split("\n");
                String[] alist = list1.get(i).trim().split(",");
                qdao.insertQuestion(subjectID, qlist[0], "");
                qdao.loadQuestion();
                int questionID = qdao.getQuestionBySubjectID(subjectID).get(qdao.getQuestionBySubjectID(subjectID).size() - 1).getQuestionID();
                for (int j = 1; j < qlist.length; j++) {
                    boolean check = false;
                    for (String s : alist) {
                        if (qlist[j].substring(0, 1).trim().equals(s.trim())) {
                            check = true;
                            break;
                        }
                    }
                    qdao.insertAnswerByQuestionID(questionID, qlist[j], check);
                }
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
