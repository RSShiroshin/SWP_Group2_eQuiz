/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAO.QuestionDAO;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class test {

    public static void main(String[] args) {
        String data = "";
        read();
    }

    public static void read() {
        try {
            File myObj = new File("D:\\demo.txt");
            Scanner myReader = new Scanner(myObj);
            String question = "";
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                question += data + "\n";
            }
            myReader.close();
            String[] q = question.trim().split("--");
            ArrayList<String> list = new ArrayList<>();
            ArrayList<String> list1 = new ArrayList<>();
            for (int i = 0; i < q.length; i++) {
                if (i % 2 == 0) {
                    list.add(q[i].trim());
                }else{
                    list1.add(q[i].trim());
                }               
            }
//            System.out.println(list.size() +"  "+list1.size());

            QuestionDAO qdao = new QuestionDAO();
//            System.out.println(qdao.getQuestionBySubjectID("SWR302").get(qdao.getQuestionBySubjectID("SWT301").size() - 1).getQuestionID());
            for (int i = 0; i < list.size(); i++) {
                String[] qlist = list.get(i).split("\n");
                qdao.insertQuestion("SWR302", qlist[0], "");
                qdao.loadQuestion();
                int questionID = qdao.getQuestionBySubjectID("SWR302").get(qdao.getQuestionBySubjectID("SWR302").size() - 1).getQuestionID();
                for (int j = 1; j < qlist.length; j++) {
                    if(qlist[j].startsWith(list1.get(i))){
                        qdao.insertTrueAnswerByQuestionID(questionID, qlist[j]);
                    }else{
                        qdao.insertAnswerByQuestionID(questionID, qlist[j]);
                    }                   
                }
            }

//            for (String string : list1) {
//                System.out.println(string);
//            }
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

}
