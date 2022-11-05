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
//import java.util.Random;

/**
 *
 * @author DELL
 */
public class QuestionDAO {

    private Connection con;
    private String status;
    private ArrayList<Question> questionList;
    private ArrayList<Answer> answerList;

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
    public void loadQuestion() {
        questionList = new ArrayList<>();
        String sql = "select *  from Question";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
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

    public ArrayList<Question> getQuestionBySubjectID(String subject) {
        ArrayList<Question> q = new ArrayList<>();
        String sql = "select *  from Question where SubjectID = ? ";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, subject);
            try ( ResultSet rs = ps.executeQuery();) {
                while (rs.next()) {
                    int questionID = rs.getInt(1);
                    String subjectID = rs.getString(2);
                    String content = rs.getString(3);
                    String explain = rs.getString(4);
                    q.add(new Question(questionID, subjectID, content, explain));
                }
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
        return q;
    }
     

    public Question getQuestion(int questionId) {
        Question q = null;
        String sql = "select *  from Question where questionID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, questionId);
            try ( ResultSet rs = ps.executeQuery();) {
                while (rs.next()) {
                    int questionID = rs.getInt(1);
                    String subjectID = rs.getString(2);
                    String content = rs.getString(3);
                    String explain = rs.getString(4);
                    q = new Question(questionID, subjectID, content, explain);
                }
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
        return q;
    }

    public void insertQuestion(String subjectID, String content, String explain) {
        String sql = "insert into Question values(?,?,?)";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, subjectID);
            ps.setString(2, content);
            ps.setString(3, explain);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    //========== ANSWER ===================================================================================
    public void loadAnswer() {
        answerList = new ArrayList<>();
        String sql = "select *  from Answer";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
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

    public ArrayList<Answer> getQuestionAnswer(int question) {
        ArrayList<Answer> answer = new ArrayList<>();
        String sql = "select *  from Answer where QuestionID = ? ";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {

            ps.setInt(1, question);
            try ( ResultSet rs = ps.executeQuery();) {
                while (rs.next()) {
                    int answerID = rs.getInt(1);
                    int questionID = rs.getInt(2);
                    String content = rs.getString(3);
                    boolean isAnswer = rs.getBoolean(4);
                    answer.add(new Answer(answerID, questionID, content, isAnswer));
                }
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
        return answer;
    }

    public void insertAnswerByQuestionID(int questionID, String content) {
        String sql = "insert into Answer values(?,?,?)";
        try(PreparedStatement ps = con.prepareStatement(sql);) {           
            ps.setInt(1, questionID);
            ps.setString(2, content);
            ps.setBoolean(3, false);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }
    public void closeConnection(){
        try {
            con.close();
        } catch (SQLException ex) {
            status = "Error!!" + ex.getMessage();
        }
    }

}

class using2 {

    public static void main(String[] args) {
        QuestionDAO qd = new QuestionDAO();
        QuizDAO quiz = new QuizDAO();
        qd.loadQuestion();
        System.out.println(qd.getQuestionBySubjectID("SWR302"));
        System.out.println(quiz.getLatestQuiz(4));

    }
}
