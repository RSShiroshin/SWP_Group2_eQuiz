/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CheckValidation;

/**
 *
 * @author hello
 */
public class CheckValidInput {
    private static String username_vaild = "[A-Za-z0-9]{5,15}";
    private static String fullname_Vaild = "[A-Za-z ]{5,25}";
    private static String email_Vaild = "[a-zA-Z0-9]{5,20}+[@]{1}+[a-z]{3,9}+[.]{1}+[a-z]{2,9}";
    
    public static boolean checkUsername(String username){
        if (username.matches(username_vaild)) return true;
        return false;
    }
    
    public static boolean checkEmail(String email){
        if (email.matches(email_Vaild)) return true;
        return false;
    }
    
    public static boolean checkFullname(String fullname){
        if (fullname.matches(fullname_Vaild)) return true;
        return false;
    }

}
