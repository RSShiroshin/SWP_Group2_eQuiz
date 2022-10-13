/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class QuizCheck {
    private int quizID;
    private int questionID;
    private int userAnswer;
    private boolean isAnswer;

    public QuizCheck() {
    }

    public QuizCheck(int quizID, int questionID, int userAnswer, boolean isAnswer) {
        this.quizID = quizID;
        this.questionID = questionID;
        this.userAnswer = userAnswer;
        this.isAnswer = isAnswer;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(int userAnswer) {
        this.userAnswer = userAnswer;
    }

    public boolean isIsAnswer() {
        return isAnswer;
    }

    public void setIsAnswer(boolean isAnswer) {
        this.isAnswer = isAnswer;
    }

    @Override
    public String toString() {
        return "QuizCheck{" + "quizID=" + quizID + ", questionID=" + questionID + ", userAnswer=" + userAnswer + ", isAnswer=" + isAnswer + '}';
    }
    
    
}
