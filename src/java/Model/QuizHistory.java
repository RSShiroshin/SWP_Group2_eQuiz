/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class QuizHistory {
    private int quizID;
    private Question question;
    private int userAnswer;
    private boolean isCorrect;

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question questionID) {
        this.question = questionID;
    }

    public int getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(int userAnswer) {
        this.userAnswer = userAnswer;
    }

    public boolean isIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }

    public QuizHistory(int quizID, Question questionID, int userAnswer, boolean isCorrect) {
        this.quizID = quizID;
        this.question = questionID;
        this.userAnswer = userAnswer;
        this.isCorrect = isCorrect;
    }

    public QuizHistory() {
    }
}
