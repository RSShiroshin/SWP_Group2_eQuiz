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
import java.util.List;

/**
 *
 * @author DELL
 */
public class CourseDAO extends DBContext {

    private Connection con;
    private String status;
    private ArrayList<Course> courseList;
    private ArrayList<CourseCategory> categoryList;

    public CourseDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception ex) {
            status = "Error!!" + ex.getMessage();
        }
    }

    public ArrayList<Course> getCourseList() {
        return courseList;
    }

    public ArrayList<CourseCategory> getCategoryList() {
        return categoryList;
    }

    public void loadCourse() {
        courseList = new ArrayList<>();
        String sql = "select *  from Course";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                String courseID = rs.getString(1).trim();
                String courseName = rs.getString(2).trim();
                String description = rs.getString(3);
                int categoryID = rs.getInt(4);
                String thumbnail = rs.getString(5);
                courseList.add(new Course(courseID, courseName, description, categoryID, thumbnail));
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
    }

    public void insertCourse(String courseID, String courseName, String description,
            int categoryID, String thumbnail) {
        String sql = "insert into Course values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, courseID);
            ps.setString(2, courseName);
            ps.setString(3, description);
            ps.setInt(4, categoryID);
            ps.setString(5, thumbnail);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void updateCourse(String courseID, String courseName, String description,
            int categoryID, String thumbnail) {
        String sql = "Update Course set courseName = ?, description = ?,categoryID = ?,thumbnail = ? "
                + "where courseID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(5, courseID);
            ps.setString(1, courseName);
            ps.setString(2, description);
            ps.setInt(3, categoryID);
            ps.setString(4, thumbnail);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    //Chỉ được thực hiện khi đã xóa hết các Subject bên trong nó hoặc không có Subject nào tham chiếu đến
    public void deleteCourse(String courseID) {
        String sql = "delete from Course where courseID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, courseID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Delete" + e.getMessage();
        }
    }

    public void loadCourseCategory() {
        categoryList = new ArrayList<>();
        String sql = "select * from CourseCategory";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int categoryID = rs.getInt(1);
                String categoryName = rs.getString(2);
                categoryList.add(new CourseCategory(categoryID, categoryName));
            }
        } catch (SQLException e) {
            status = "Error Load CourseCategory" + e.getMessage();
        }
    }

    public void insertCourseCategory(
            String categoryName) {
        String sql = "insert into CourseCategory values(?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, categoryName);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void updateCourseCategory(
            int categoryID, String thumbnail) {
        String sql = "update CourseCategory set categoryName = ? where categoryID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(2, categoryID);
            ps.setString(1, thumbnail);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    //Chỉ được thực hiện khi khong có Course nào tham chiếu đến
    public void deleteCourseCategory(int categoryID) {
        String sql = "delete from CourseCategory where categoryID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, categoryID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Delete" + e.getMessage();
        }
    }

    // lọc courses theo phân loại (lọc theo categoryid)
    public List<Course> getCoursesByCategoryId(int categoryId) {
        List<Course> list = new ArrayList<>();
        try {
            String sql = "select * from Course where categoryID = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // hiển thị courses theo phân trang
    public List<Course> getCoursesWithPagging(int page, int PAGE_SIZE) {
        List<Course> list = new ArrayList<>();
        try {
            String sql = "select * from Course order by courseID offset (?-1)*? row fetch next ? rows only";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // search theo tên course 
    public List<Course> search(String keyword) {
        List<Course> list = new ArrayList<>();
        try {
            String sql = "select * from Course where courseName like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // lấy course theo id để hiển thị detail course (hiển thị các subject trong course)
    public Course getCourseById(int CourseId) {
        try {
            String sql = "select * from Course where courseID = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, CourseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course product = new Course(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
                return product;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

}
class using{
    public static void main(String[] args) {
        CourseDAO dao = new CourseDAO();      
        dao.loadCourseCategory();
        for (CourseCategory courseCategory : dao.getCategoryList()) {
            System.out.println(courseCategory.getCategoryName());
        }
    }
}
