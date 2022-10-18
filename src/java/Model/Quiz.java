/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

//import java.util.Date;

/**
 *
 * @author DELL
 */
public class Quiz {
    private int quizID;
    private String subjectID;
    private int userID;
    private String timeStart;
    private float score;

    public Quiz() {
    }

    public Quiz(int quizID, String subjectID, int userID, String timeStart, float score) {
        this.quizID = quizID;
        this.subjectID = subjectID;
        this.userID = userID;
        this.timeStart = timeStart;
        this.score = score;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }
    
}
