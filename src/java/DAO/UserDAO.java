/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

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
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
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

    public ArrayList<String> loadRoleName() {
        ArrayList<String> roleNameList = new ArrayList<>();
        String sql = "select *  from [RoleName]";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                String roleName = rs.getString(2);
                roleNameList.add(roleName);
            }
        } catch (SQLException e) {
            status = "Error Load User" + e.getMessage();
        }
        return roleNameList;
    }
    
    public ArrayList<User> getExpertList() {
        ArrayList expertList = new ArrayList<>();
        String sql = "select *  from [User] where roleID = 1";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
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
                expertList.add(new User(userID, userName, password, fullName, email, avatar, description, roleID, statusDB, registerDay));
            }
        } catch (SQLException e) {
            status = "Error Load User" + e.getMessage();
        }
        return expertList;
    }
    
    public ArrayList<ExpertAssign> getExpertAssignList() {
        ArrayList<ExpertAssign> expertList = new ArrayList<>();
        String sql = "select *  from [ExpertAssign]";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {

                int userID = rs.getInt(1);
                String subjectID = rs.getString(2).trim();               


                expertList.add(new ExpertAssign(userID, subjectID));
            }
        } catch (SQLException e) {
            status = "Error Load User" + e.getMessage();
        }
        return expertList;
    }
    
    public boolean checkSubjectAssign(String subjectID) {
        boolean subjectExit = false;
        String sql = "select * from ExpertAssign where subjectID = '"+subjectID+"'";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            if(rs.next() == false) {
                subjectExit = false;
            } else {
                subjectExit = true;
            }
        } catch (SQLException e) {
            status = "Error Load User" + e.getMessage();
        }
        return subjectExit;
    }
    
    public void insertAssignExpert(int userID, String subjectID) {
        String sql = "insert into [ExpertAssign] values(?,?)";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, userID);
            ps.setString(2, subjectID);
            
            ps.execute();
        } catch (SQLException e) {
            status = "Error Assign expert" + e.getMessage();
        }
    }
    
    public void updateAssignExpert(int userID, String subjectID) {
        String sql = "update [ExpertAssign] set userID = ?, subjectID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, userID);
            ps.setString(2, subjectID);
            
            ps.execute();
        } catch (SQLException e) {
            status = "Error Assign expert" + e.getMessage();
        }
    }
    
    public void deleteExpertAssign(String subjectID) {
        String sql = "delete from ExpertAssign where subjectID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, subjectID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Delete" + e.getMessage();
        }
    }

    public void insertUser(String userName, String password, String fullName,
            String email, String avatar, String description, int roleID, boolean statusDB, Date registerDay) {
        String sql = "insert into [User] values(?,?,?,?,?,?,?,?,?)";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, fullName);
            ps.setString(4, email);
            ps.setString(5, avatar);
            ps.setString(6, description);
            ps.setInt(7, roleID);
            ps.setBoolean(8, statusDB);
            ps.setDate(9, registerDay);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void updateUser(int UserID, String userName, String password, String fullName,
            String email, String avatar, String description, int roleID, boolean statusDB, String registerDay) {
        String sql = "Update [User] set userName = ?, password = ?,fullName = ?,email = ?,  avatar = ?, description = ?, roleID = ?, status = ?, registerDay = '" + registerDay + "'"
                + "where userID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
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

    public void updateUserStatus(int userID, boolean statusDB) {
        String sql = "update [User] set status = ? where userID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(2, userID);
            ps.setBoolean(1, statusDB);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Delete" + e.getMessage();
        }
    }

    public void deleteUser(int userID) {
        String sql = "delete from [User] where userID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, userID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Delete" + e.getMessage();
        }
    }

    public void updateUserProfile(int UserID, String userName, String password, String fullName,
            String email, String description) {
        String sql = "Update [User] set userName = ?, password = ?,fullName = ?,email = ?, description = ? where userID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(6, UserID);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, fullName);
            ps.setString(4, email);
            ps.setString(5, description);
//            ps.setDate(9, (java.sql.Date) registerDay);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void updateUserRole(int userID, int roleID) {
        String sql = "update [User] set roleID = ? where userID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(2, userID);
            ps.setInt(1, roleID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Delete" + e.getMessage();
        }
    }

    public User checkLogin(String username, String password) {
        String sql = " SELECT [userID]\n"
                + "                      ,[userName]\n"
                + "                      ,[password]\n"
                + "                      ,[fullName]\n"
                + "                      ,[email]\n"
                + "                      ,[avatar]\n"
                + "                      ,[description]\n"
                + "                      ,[roleID]\n"
                + "                      ,[status]\n"
                + "                      ,[registerDay]\n"
                + "                  FROM [dbo].[User]\n"
                + "                  WHERE Username = ? AND [Password] = ?";
        try ( PreparedStatement st = con.prepareStatement(sql);) {
            st.setString(1, username);
            st.setString(2, password);
            try ( ResultSet rs = st.executeQuery();) {
                if (rs.next()) {
                    return new User(rs.getInt("userID"), rs.getString("userName"), rs.getString("password"), rs.getString("fullName"), rs.getString("email"), rs.getString("avatar"), rs.getString("description"), rs.getInt("roleID"), rs.getBoolean("status"), rs.getDate("registerDay"));
                }
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    public User checkDupAcc(String username, String fullname, String email) {
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
                + "  WHERE Username = ? OR fullName =? OR email = ?";
        try ( PreparedStatement st = con.prepareStatement(sql);) {
            st.setString(1, username);
            st.setString(2, fullname);
            st.setString(3, email);
            try ( ResultSet rs = st.executeQuery();) {
                if (rs.next()) {
                    User acc = new User(rs.getInt("userID"), rs.getString("userName"), rs.getString("password"), rs.getString("fullName"), rs.getString("email"), rs.getString("avatar"), rs.getString("description"), rs.getInt("roleID"), rs.getBoolean("status"), rs.getDate("registerDay"));
                    return acc;
                }
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    // search theo tên username 
    public List<User> search(String keyword) {
        List<User> list = new ArrayList<>();
//        String sql = "select * from [User] where userName like '"+keyword+"'";
        String sql = "select * from [User] where userName like ? ";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, "%" + keyword + "%");
            try ( ResultSet rs = ps.executeQuery();) {
                while (rs.next()) {
                    list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getBoolean(9), rs.getDate(10)));
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void closeConnection() {
        try {
            con.close();
        } catch (SQLException ex) {
            status = "Error!!" + ex.getMessage();
        }
    }

//    public static void main(String[] args) {
//        UserDAO u = new UserDAO();
//        u.loadUser();
//        String search = "admin";
//        System.out.println(u.getExpertAssignList());
//    }
}
