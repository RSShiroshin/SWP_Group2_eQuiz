/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.QuestionDAO;
import Model.*;
import com.oracle.wls.shaded.org.apache.bcel.classfile.Utility;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class Ajaxdemo extends HttpServlet {

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
            out.println("<title>Servlet Ajaxdemo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ajaxdemo at " + request.getContextPath() + "</h1>");
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

        Cookie cookie = getCookie(request, "numQues");

        if (cookie != null) {
            cookie.setValue(String.valueOf(Integer.parseInt(cookie.getValue()) + 1));
            response.addCookie(cookie);
        }
        PrintWriter out = response.getWriter();

        String q1 = request.getParameter("q1");
        String a1 = request.getParameter("a1");
        String a2 = request.getParameter("a2");
        String a3 = request.getParameter("a3");
        String a4 = request.getParameter("a4");
        Ultility u = new Ultility();
        Ultility.addQues(1, "1", "q1", "null");
        Ultility.addAns(0, 0, a1, true);
        Ultility.addAns(0, 0, a2, true);
        Ultility.addAns(0, 0, a3, true);
        Ultility.addAns(0, 0, a4, true);
        
        for (Answer an : Ultility.getAns()) {
            QuestionDAO qd = new QuestionDAO();
            qd.insertQuestion("ACC101", an.getContent(), "hello");
        }
        
        //dung for de in ra ben jsp va tao ra 1 form moi ben content1

        out.println("<div id=\"addQ1\" style=\"width: 50%;  margin-top: 40px;\">\n" +
"                            <input type=\"text\" value=\""+ q1 +"\"><br>\n" +
"                                <p>THUẬT NGỮ</p>\n" +
"                            </div>\n" +
"                            <div id=\"addQ2\" style=\"width: 50%;  margin-top: 40px;\">\n" +
"                                <div id=\"addQ\">\n" +
"                                    <input type=\"text\" value=\""+ a1 +"\"><br>\n" +
"                                    <input type=\"text\" value=\""+ a2 +"\"><br> \n" +
"                                    <input type=\"text\" value=\""+ a3 +"\"><br> \n" +
"                                    <input type=\"text\" value=\""+ a4 +"\"><br>\n" +
"                                </div>\n" +
//"                                <button type=\"button\" id=\"demo1\">Add Ques</button>\n" +
"                                <p>ĐỊNH NGHĨA</p>\n" +
"                            </div>");
//        out.println("<div id=\"addQ1\" style=\"width: 50%;  margin-top: 40px;\">\n"
//                + "                                <input type=\"text\" name=\"ques" + cookie.getValue() + "\"><br>\n"
//                + "                                <p>THUẬT NGỮ</p>\n"
//                + "                            </div>\n"
//                + "                            <div id=\"addQ2\" style=\"width: 50%;  margin-top: 40px;\">\n"
//                + "                                <div id=\"addQ\">\n"
//                + "                            <input type=\"text\" id=\"id\" name=\"ques" + cookie.getValue() + "ans1\"><br>\n"
//                + "                            <input type=\"text\" id=\"id\" name=\"ques" + cookie.getValue() + "ans2\"><br> \n"
//                + "                            <input type=\"text\" id=\"id\" name=\"ques" + cookie.getValue() + "ans3\"><br> \n"
//                + "                            <input type=\"text\" id=\"id\" name=\"ques" + cookie.getValue() + "ans4\"><br> \n"
//                + "                            <input type=\"text\" id=\"id\" name=\"ques1ans4\"><br>\n"
//                + "                            </div>\n"
//                + "                                <button type=\"button\" id=\"demo1\">Add Ques</button>\n"
//                + "                                <p>ĐỊNH NGHĨA</p>\n"
//                + "                            </div>");

    }

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
        PrintWriter out = response.getWriter();
//        Cookie cookie = getCookie(request, "numQues");
//
//        if (cookie != null) {
//            cookie.setValue(String.valueOf(Integer.parseInt(cookie.getValue()) + 1));
//            response.addCookie(cookie);
//        }
//
//        Cookie cookie1 = getCookie(request, "numAns");
//
//        if (cookie != null) {
//            cookie.setValue(String.valueOf(Integer.parseInt(cookie.getValue()) + 1));
//            response.addCookie(cookie);
//        }
//        out.println("<input type=\"text\" id=\"id\" name=\"ques" + cookie.getValue() + "ans" + cookie1.getValue() + "\"><br>");
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
