/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

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
        String data = "thương thiên phách huyết";
        read(data);
    }
   static ArrayList<String> list = new ArrayList<>();
    public static void check(){
        
    }
    public static void read(String text){
         try {
            File myObj = new File("D:\\Personal\\Art\\Truyện\\Potential.txt");
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                if(data.trim().equalsIgnoreCase(text)){
                    System.out.println(data);
                    break;
                }
                
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
