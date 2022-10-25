/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.UserDAO.userList;
import Model.Course;
import Model.ExpertAssign;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ExpertAssignDAO {

    ArrayList<ExpertAssign> listExpertAssign = new ArrayList<>();
    ArrayList<ExpertAssign> listCustomerAssign = new ArrayList<>();
    private Connection con;
    private String status;

    public ExpertAssignDAO(ArrayList<ExpertAssign> listExpertAssign) {
        this.listExpertAssign = listExpertAssign;
        this.listCustomerAssign = listCustomerAssign;
    }

    public ArrayList<ExpertAssign> getExpertAssignList() {
        return listExpertAssign;
    }

    public ArrayList<ExpertAssign> getCustomerAssignList() {
        return listCustomerAssign;
    }

    public ExpertAssignDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            status = "Error!!" + ex.getMessage();
        }
    }

    public void loadExpertAssign() {
        String sql = "select *  from ExpertAssign";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                int courseID = rs.getInt(1);
                String courseName = rs.getString(2).trim();
                listExpertAssign.add(new ExpertAssign(courseID, courseName));
            }
        } catch (SQLException e) {
            status = "Error Load ExpertAssign" + e.getMessage();
        }
    }

    public void loadCustomerAssign() {
        String sql = "select *  from Register";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                int courseID = rs.getInt(1);
                String courseName = rs.getString(2).trim();
                listCustomerAssign.add(new ExpertAssign(courseID, courseName));
            }
        } catch (SQLException e) {
            status = "Error Load ExpertAssign" + e.getMessage();
        }
    }

    public void closeConnection() {
        try {
            con.close();
        } catch (SQLException ex) {
            status = "Error!!" + ex.getMessage();
        }
    }
}
