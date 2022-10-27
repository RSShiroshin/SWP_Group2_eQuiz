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
//        Part filePart = request.getPart("file");
//        String fileName = filePart.getSubmittedFileName();
//        filePart.write("D:\\" + fileName);
//        ArrayList<String> list = new ArrayList<>();
//        File myObj = new File("D:\\" + fileName);
//        Scanner myReader = new Scanner(myObj);
//        String question = "";
//        while (myReader.hasNextLine()) {
//            String data = myReader.nextLine();
//            question += data + "\n";
//        }
//        myReader.close();
//        String[] q = question.trim().split("--");
//        for (int i = 0; i < q.length; i++) {
//            if (i % 2 == 0) {
//                list.add(q[i].trim());
//            }
//        }
//        QuestionDAO qdao = new QuestionDAO();
//        for (int i = 0; i < list.size(); i++) {
//            String[] qlist = list.get(i).split("\n");
//            qdao.insertQuestion("SWT301", qlist[0], "");
//            qdao.loadQuestion();
//            int questionID = qdao.getQuestionBySubjectID("SWT301").get(qdao.getQuestionBySubjectID("SWT301").size() - 1).getQuestionID();
//            for (int j = 1; j < qlist.length; j++) {
//                qdao.insertAnswerByQuestionID(questionID, qlist[j]);
//            }
//        }
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
