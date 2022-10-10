/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Answer;
import Model.Question;
import Model.Subject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class QuestionDAO {
    private Connection con;
    private String status;
    private ArrayList<Question> questionList; 
    private ArrayList<Answer>   answerList;

    public ArrayList<Question> getQuestionList() {
        return questionList;
    }

    public ArrayList<Answer> getAnswerList() {
        return answerList;
    }

    public QuestionDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            status = "Error!!" + ex.getMessage();
        }
    }
    
    //========== QUESTION=====================================================================================
    public void loadQuestion(){
        questionList = new ArrayList<>();
        String sql = "select *  from Question";
         try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               int questionID = rs.getInt(1);
               String subjectID = rs.getString(2);
               String content = rs.getString(3);  
               String explain = rs.getString(4);  
               questionList.add(new Question(questionID, questionID, content, explain));
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
    }
    
    //========== ANSWER ===================================================================================
    public void loadAnswer(){
        answerList = new ArrayList<>();
        String sql = "select *  from Answer";
         try {
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               int answerID = rs.getInt(1);
               int questionID = rs.getInt(2);
               String content = rs.getString(3);  
               boolean isAnswer = rs.getBoolean(4);  
               answerList.add(new Answer(answerID, questionID, content, isAnswer));
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
    }
    
}

class using2{
    public static void main(String[] args) {
        QuestionDAO QD  = new QuestionDAO();
        QD.loadQuestion();
        System.out.println(QD.getQuestionList());
        
        QD.loadAnswer();
        System.out.println(QD.getAnswerList());
    }
}