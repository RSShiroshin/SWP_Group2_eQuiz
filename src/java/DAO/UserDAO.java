/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.UserDAO.userList;
import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author DELL
 */
public class UserDAO extends DBContext {

    private Connection con;
    private String status;
    public static ArrayList<User> userList;

    public UserDAO(ArrayList<User> userList) {
        this.userList = userList;
    }

    public UserDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            status = "Error!!" + ex.getMessage();
        }
    }

    public ArrayList<User> getUserList() {
        return userList;
    }

    public void loadUser() {
        userList = new ArrayList<>();
        String sql = "select *  from [User]";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int userID = rs.getInt(1);
                String userName = rs.getString(2).trim();
                String password = rs.getString(3).trim();
                String fullName = rs.getString(4).trim();
                String email = rs.getString(5).trim();

                String avatar = "";
                if (rs.getString(6) != null) {
                    avatar = rs.getString(6).trim();
                }

                String description = "";
                if (rs.getString(7) != null) {
                    description = rs.getString(7).trim();
                }

                int roleID = rs.getInt(8);
                boolean statusDB = rs.getBoolean(9);
                Date registerDay = rs.getDate(10);
                userList.add(new User(userID, userName, password, fullName, email, avatar, description, roleID, statusDB, registerDay));
            }
        } catch (SQLException e) {
            status = "Error Load User" + e.getMessage();
        }
    }

    public void insertUser(String userName, String password, String fullName,
            String email, String avatar, String description, int roleID, boolean statusDB, String registerDay) {
        String sql = "insert into [User] values(?,?,?,?,?,?,?,?,'" + registerDay + "')";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, fullName);
            ps.setString(4, email);
            ps.setString(5, avatar);
            ps.setString(6, description);
            ps.setInt(7, roleID);
            ps.setBoolean(8, statusDB);
//            ps.setDate(9, registerDay);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void updateUser(int UserID, String userName, String password, String fullName,
            String email, String avatar, String description, int roleID, boolean statusDB, String registerDay) {
        String sql = "Update [User] set userName = ?, password = ?,fullName = ?,email = ?,  avatar = ?, description = ?, roleID = ?, status = ?, registerDay = '" + registerDay + "'"
                + "where userID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(9, UserID);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, fullName);
            ps.setString(4, email);
            ps.setString(5, avatar);
            ps.setString(6, description);
            ps.setInt(7, roleID);
            ps.setBoolean(8, statusDB);
//            ps.setDate(9, (java.sql.Date) registerDay);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void deleteUser(int userID) {
        String sql = "delete from [User] where userID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Delete" + e.getMessage();
        }
    }


     public User checkLogin(String username, String password) {
        String sql = "SELECT [userID]\n"
                + "      ,[userName]\n"
                + "      ,[password]\n"
                + "      ,[fullName]\n"
                + "      ,[email]\n"
                + "      ,[avatar]\n"
                + "      ,[description]\n"
                + "      ,[roleID]\n"
                + "      ,[status]\n"
                + "      ,[registerDay]\n"
                + "  FROM [dbo].[User]\n"
                + "  WHERE Username = ? AND [Password] = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User acc = new User(rs.getInt("userID"), rs.getString("userName"), rs.getString("password"), rs.getString("fullName"), rs.getString("email"), rs.getString("avatar"), rs.getString("description"), rs.getInt("roleID"), rs.getBoolean("status"), rs.getDate("registerDay"));
                return acc;
            }
        } catch (SQLException ex) {

        }
        return null;
    }
}



class using1 {

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        
        dao.loadUser();
        for (User user : dao.getUserList()) {
            System.out.println(user.getUserName());
        }
        
    }
}
