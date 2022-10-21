/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author ducda
 */
public class Ultility {
    public static ArrayList<Question> lstQues = new ArrayList<>();
    public static ArrayList<Answer> lstAns = new ArrayList<>();

    public static void addQues(int id,String n, String p, String q) {
        lstQues.add(new Question(id, q, n, p));
    }
    public static void addAns(int id,int id1, String p, boolean q) {
        lstAns.add(new Answer(id, id1, p, q));
    }
    
    public static ArrayList<Question> getQues() {
        return lstQues;
    }
    public static ArrayList<Answer> getAns() {
        return lstAns;
    }

    public static void removeAll() {
        lstAns.removeAll(lstAns);
        lstQues.removeAll(lstQues);
    }

    
    
    
}
