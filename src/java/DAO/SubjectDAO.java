/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Subject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class SubjectDAO {

    private Connection con;
    private String status;
    private ArrayList<Subject> subjectList;

    public SubjectDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            status = "Error!!" + ex.getMessage();
        }
    }

    public ArrayList<Subject> getSubjectList() {
        return subjectList;
    }

    public void loadSubject() {
        subjectList = new ArrayList<>();
        String sql = "select *  from Subject";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                String subjectID = rs.getString(1);
                String subjectName = rs.getString(2);
                String description = rs.getString(3);
                String courseID = rs.getString(4);
                subjectList.add(new Subject(subjectID, subjectName, description, courseID));
            }
        } catch (SQLException e) {
            status = "Error Load Subject" + e.getMessage();
        }
    }

    public void insertSubject(String subjectID, String subjectName, String description, String courseID) {
        String sql = "insert into Subject values(?,?,?,?)";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(4, courseID);
            ps.setString(1, subjectID);
            ps.setString(2, subjectName);
            ps.setString(3, subjectName);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void updateSubject(String subjectID, String subjectName, String description) {
        String sql = "Update Subject set subjectName = ?,description = ? where subjectID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(3, subjectID);
            ps.setString(1, subjectName);
            ps.setString(2, description);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void deleteSubject(String subjectID) {
        String sql = "delete from Subject where subjectID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, subjectID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Delete" + e.getMessage();
        }
    }

    public ArrayList<Subject> getSubjectListByCourseID(String courseID) {
        ArrayList<Subject> subjectByCourse = new ArrayList<>();
        for (Subject subject : getSubjectList()) {
            if (subject.getCourseID().equals(courseID)) {
                subjectByCourse.add(subject);
            }
        }
        return subjectByCourse;
    }
    
    public Subject getSubjectListBySubjectID(String subjectID) {
        loadSubject();
        for (Subject subject : subjectList) {
            if (subject.getSubjectID().equals(subjectID)) {
                return subject;
            }
        }
        return null;
    }
    
    public List<Subject> searchBySubjectsName(String keyword) {
        List<Subject> list = new ArrayList<>();
        loadSubject();
        for (Subject s : getSubjectList()) {
            if(s.getSubjectName().toLowerCase().contains(keyword.toLowerCase())){
                list.add(s);
            }
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
    public static void main(String[] args) {
        SubjectDAO sdao = new SubjectDAO();
        sdao.loadSubject();
        System.out.println(sdao.getSubjectListByCourseID("aa"));
    }
}
