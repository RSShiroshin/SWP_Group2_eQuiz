/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Answer;
import Model.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

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
               questionList.add(new Question(questionID, subjectID, content, explain));
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
    }
    
    public ArrayList<Question> getSubjectQuestion(String subject){
        ArrayList<Question> q = new ArrayList<>();
        String sql = "select *  from Question where SubjectID = ? ";
         try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, subject);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               int questionID = rs.getInt(1);
               String subjectID = rs.getString(2);
               String content = rs.getString(3);  
               String explain = rs.getString(4);  
               q.add(new Question(questionID, subjectID, content, explain));
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
         return q;
    }
    
    public Question getQuestion(int questionId){
        Question q = null;
        String sql = "select *  from Question where questionID = ?";
         try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, questionId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               int questionID = rs.getInt(1);
               String subjectID = rs.getString(2);
               String content = rs.getString(3);  
               String explain = rs.getString(4);  
               q = new Question(questionID, subjectID, content, explain);
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
         return q;
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
    
    public ArrayList<Answer> getQuestionAnswer(int question){
        ArrayList<Answer> answer = new ArrayList<>();
        String sql = "select *  from Answer where QuestionID = ? ";
         try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, question);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               int answerID = rs.getInt(1);
               int questionID = rs.getInt(2);
               String content = rs.getString(3);  
               boolean isAnswer = rs.getBoolean(4);  
               answer.add(new Answer(answerID, questionID, content, isAnswer));
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
         return answer;
    }
    
}

class using2{
    public static void main(String[] args) {
        QuestionDAO qd = new QuestionDAO();
        ArrayList<Question> questionList = qd.getSubjectQuestion("ACC101");
        ArrayList<Question> quizQuestion = new ArrayList<>();
        ArrayList<Answer>  quizAnswer = new ArrayList<>();
        
//        String subject = request.getParameter("SubjectID");
//        int questionNum = Integer.parseInt(request.getParameter("questionNum")) ;
        int questionNum = 5;
        String subject = "ACC101";
        //Random cac cau hoi
        ArrayList<Integer> numbers = new ArrayList<Integer>();   
        Random randomGenerator = new Random();
        while (numbers.size() < questionNum) {

            int random = randomGenerator.nextInt(questionList.size());
            System.out.println(random);
            if (!numbers.contains(random)) {
                numbers.add(random);
            }
        }
        
        //add cau hoi cho quiz
        for (Question q : questionList) {
            for (Integer number : numbers) {
                if(q.getQuestionID() == (number+1)) {
                    quizQuestion.add(q);
                    ArrayList<Answer> questionAnswer = qd.getQuestionAnswer(q.getQuestionID());
                    for (Answer a : questionAnswer) {
                        quizAnswer.add(a);
                    }
                }
            }         
        }
        
        for (Question question : quizQuestion) {
            System.out.println(question.getContent());
        }
//        System.out.println(quizQuestion);
//        System.out.println(quizAnswer);
        
    }
}