/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Question;
import Model.Quiz;
import Model.QuizCheck;
import Model.QuizHistory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class QuizDAO {

    private Connection con;
    private String status;

    public QuizDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            status = "Error!!" + ex.getMessage();
        }
    }

    public ArrayList<Quiz> loadQuiz(int UserID) {
        ArrayList<Quiz> quizList = new ArrayList<>();
        String sql = "select *  from Quiz where userID = '" + UserID + "'";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                int quizID = rs.getInt(1);
                String subjectID = rs.getString(2);
                int userID = rs.getInt(3);
                String timeStart = rs.getString(4);
                float score = rs.getFloat(5);
                quizList.add(new Quiz(quizID, subjectID, userID, timeStart, score));
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
        return quizList;
    }

    public int getLatestQuiz(int UserID) {
        int quizID = 0;
        String sql = "select top 1 quizID from Quiz where userID = " + UserID + " order by quizID desc";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                quizID = rs.getInt(1);
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
        return quizID;
    }

    public void insertQuiz(String subjectID, int userID, String timeStart, float score) {
        String sql = "insert into Quiz values(?,?,?,?)";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, subjectID);
            ps.setInt(2, userID);
            ps.setString(3, timeStart);
            ps.setFloat(4, score);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void updateQuizScore(int quizID, float score) {
        String sql = "update Quiz set score = " + score + " where quizID = " + quizID + "";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public ArrayList<Integer> getQuizQuestion(int quizId) {
        ArrayList<Integer> quizQuestionID = new ArrayList<>();
        String sql = "select *  from QuizHistory where quizID = " + quizId + "";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                int questionID = rs.getInt(2);
                quizQuestionID.add(questionID);
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
        return quizQuestionID;
    }

    public ArrayList<QuizHistory> getQuizHistory(int quizId) {
        ArrayList<QuizHistory> quizHis = new ArrayList<>();
        QuestionDAO q = new QuestionDAO();
        String sql = "select *  from QuizHistory where quizID = " + quizId + "";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                int quizID = rs.getInt(1);
                int questionID = rs.getInt(2);
                Question ques = q.getQuestion(questionID);
                int userAnswer = rs.getInt(3);
                boolean isCorrect = rs.getBoolean(4);
                quizHis.add(new QuizHistory(quizID, ques, userAnswer, isCorrect));
            }
        } catch (SQLException e) {
            status = "Error Load Quiz History" + e.getMessage();
        }
        return quizHis;
    }

    public void insertQuizHistory(int quizID, int questionID, int userAnswer) {
        String sql = "insert into QuizHistory values(?,?,?,?)";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, quizID);
            ps.setInt(2, questionID);
            ps.setInt(3, userAnswer);
            ps.setBoolean(4, false);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void updateUserAnswer(int quizID, int questionID, int userAnswer) {
        String sql = "update QuizHistory set userAnswer = " + userAnswer + " where quizID = " + quizID + " and questionID = " + questionID + " ";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.execute();
        } catch (SQLException e) {
            status = "Error updateUserAnswer" + e.getMessage();
        }
    }

    public void updateUserIsCorrect(int quizID, int questionID, boolean userAnswer) {
        String sql = "update QuizHistory set isCorrect = ? where quizID = " + quizID + " and questionID = " + questionID + " ";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setBoolean(1, userAnswer);
            ps.execute();
        } catch (SQLException e) {
            status = "Error updateUserAnswer" + e.getMessage();
        }
    }

    //Quiz Check
    public ArrayList<QuizCheck> getQuizCheck(int quizId) {
        ArrayList<QuizCheck> checkList = new ArrayList<>();
        String sql = "select quizID,QuizHistory.questionID, userAnswer,isAnswer from QuizHistory left join Answer"
                + " on QuizHistory.questionID = Answer.questionID and userAnswer = answerID where quizID=" + quizId + "";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                int quizID = rs.getInt(1);
                int questionID = rs.getInt(2);
                int userAnswer = rs.getInt(3);
                boolean isAnswer = rs.getBoolean(4);
                checkList.add(new QuizCheck(quizID, questionID, userAnswer, isAnswer));
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
        return checkList;
    }

    public void closeConnection() {
        try {
            con.close();
        } catch (SQLException ex) {
            status = "Error!!" + ex.getMessage();status = "Error!!" + ex.getMessage();
        }
    }

    public static void main(String[] args) {
        QuizDAO q = new QuizDAO();
//        int newQuizID = q.getLatestQuiz(6).getQuizID();
//        q.insertQuizHistory(0, 0, 0);
//        q.updateQuizScore(8, 8);
        System.out.println(q.getQuizCheck(9));
    }

}
