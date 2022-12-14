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
    private ArrayList<Register> registerList;

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

    public ArrayList<Register> getCourseRegister() {
        return registerList;
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
                String description = "";
                if (rs.getString(3) != null) {
                    description = rs.getString(3).trim();
                }
                int categoryID = rs.getInt(4);
                String thumbnail = null;
                if (rs.getString(5) != null) {
                    if (rs.getString(5).equals("")) {
                        thumbnail = null;
                    } else {
                        thumbnail = rs.getString(5).trim();
                    }
                }
                courseList.add(new Course(courseID, courseName, description, categoryID, thumbnail));
            }
        } catch (SQLException e) {
            status = "Error Load Course" + e.getMessage();
        }
    }

    public void insertCourse(String courseID, String courseName, String description,
            int categoryID, String thumbnail) {
        String sql = "insert into Course values(?,?,?,?,?)";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
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
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
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

    //Ch??? ???????c th???c hi???n khi ???? x??a h???t c??c Subject b??n trong n?? ho???c kh??ng c?? Subject n??o tham chi???u ?????n
    public void deleteCourse(String courseID) {
        String sql = "delete from Course where courseID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, courseID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Delete" + e.getMessage();
        }
    }

    public void loadCourseCategory() {
        categoryList = new ArrayList<>();
        String sql = "select * from CourseCategory";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
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
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, categoryName);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    public void updateCourseCategory(
            int categoryID, String thumbnail) {
        String sql = "update CourseCategory set categoryName = ? where categoryID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(2, categoryID);
            ps.setString(1, thumbnail);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

    //Ch??? ???????c th???c hi???n khi khong c?? Course n??o tham chi???u ?????n
    public void deleteCourseCategory(int categoryID) {
        String sql = "delete from CourseCategory where categoryID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, categoryID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Delete" + e.getMessage();
        }
    }

    // l???c courses theo ph??n lo???i (l???c theo categoryid)
    public List<Course> getCoursesByCategoryId(int categoryId) {
        List<Course> list = new ArrayList<>();
        String sql = "select * from Course where categoryID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, categoryId);
            try ( ResultSet rs = ps.executeQuery();) {
                while (rs.next()) {
                    String courseID = rs.getString(1).trim();
                    String courseName = rs.getString(2).trim();
                    String description = "";
                    if (rs.getString(3) != null) {
                        description = rs.getString(3).trim();
                    }
                    int categoryID = rs.getInt(4);
                    String thumbnail = null;
                    if (rs.getString(5) != null) {
                        if (rs.getString(5).equals("")) {
                            thumbnail = null;
                        } else {
                            thumbnail = rs.getString(5).trim();
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // hi???n th??? courses theo ph??n trang
    public List<Course> getCoursesWithPagging(int page, int PAGE_SIZE) {
        List<Course> list = new ArrayList<>();
        String sql = "select * from Course order by courseID offset (?-1)*? row fetch next ? rows only";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            try ( ResultSet rs = ps.executeQuery();) {
                while (rs.next()) {
                    String courseID = rs.getString(1).trim();
                    String courseName = rs.getString(2).trim();
                    String description = "";
                    if (rs.getString(3) != null) {
                        description = rs.getString(3).trim();
                    }
                    int categoryID = rs.getInt(4);
                    String thumbnail = null;
                    if (rs.getString(5) != null) {
                        if (rs.getString(5).equals("")) {
                            thumbnail = null;
                        } else {
                            thumbnail = rs.getString(5).trim();
                        }
                    }
                    list.add(new Course(courseID, courseName, description, categoryID, thumbnail));
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // searchByCourseName theo t??n course 
    public List<Course> searchByCourseName(String keyword) {
        List<Course> list = new ArrayList<>();
        String sql = "select * from Course where courseName like ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, "%" + keyword + "%");
            try ( ResultSet rs = ps.executeQuery();) {
                while (rs.next()) {
                    list.add(new Course(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Course> searchByCourseID(String keyword) {
        List<Course> list = new ArrayList<>();
        loadCourse();
        for (Course c : getCourseList()) {
            if (c.getCourseID().toLowerCase().contains(keyword.toLowerCase())) {
                list.add(c);
            }
        }
        return list;
    }

    public List<Course> searchBySubjectsName(String keyword) {
        List<Course> list = new ArrayList<>();
        SubjectDAO sdao = new SubjectDAO();
        sdao.loadSubject();
        for (Subject s : sdao.getSubjectList()) {
            if (s.getSubjectName().toLowerCase().contains(keyword.toLowerCase())) {
                list.add(getCourseById(s.getCourseID()));
            }
        }
        return list;
    }

    public List<Course> searchBySubjectsID(String keyword) {
        List<Course> list = new ArrayList<>();
        SubjectDAO sdao = new SubjectDAO();
        sdao.loadSubject();
        for (Subject s : sdao.getSubjectList()) {
            if (s.getSubjectID().toLowerCase().contains(keyword.toLowerCase())) {
                list.add(getCourseById(s.getCourseID()));
            }
        }
        return list;
    }

    // l???y course theo id ????? hi???n th??? detail course (hi???n th??? c??c subject trong course)
    public Course getCourseById(String CourseId) {
        String sql = "select * from Course where courseID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, CourseId);
            try ( ResultSet rs = ps.executeQuery();) {
                while (rs.next()) {
                    String courseID = rs.getString(1).trim();
                    String courseName = rs.getString(2).trim();
                    String description = "";
                    if (rs.getString(3) != null) {
                        description = rs.getString(3).trim();
                    }
                    int categoryID = rs.getInt(4);
                    String thumbnail = null;
                    if (rs.getString(5) != null) {
                        if (rs.getString(5).equals("")) {
                            thumbnail = null;
                        } else {
                            thumbnail = rs.getString(5).trim();
                        }
                    }
                    Course course = new Course(courseID, courseName, description, categoryID, thumbnail);
                    return course;
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void closeConnection() {
        try {
            con.close();
        } catch (SQLException ex) {
            status = "Error!!" + ex.getMessage();
        }
    }

    public static void main(String[] args) {
        CourseDAO cd = new CourseDAO();
        cd.loadCourse();
        System.out.println(cd.getCourseList().get(5).getThumbnail());

    }

    //load register course
    public void loadCourseRegister() {
        registerList = new ArrayList<>();
        String sql = "select * from Register";
        try ( PreparedStatement ps = con.prepareStatement(sql);  ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                int usID = rs.getInt(1);
                String courseID = rs.getString(2);
                registerList.add(new Register(usID, courseID));
            }
        } catch (SQLException e) {
            status = "Error Load registerList" + e.getMessage();
        }
    }

    //insert course register
    public void insertCourseRegister(int usid, String courseId) {
        String sql = "insert into Register values(?,?)";
        try ( PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setInt(1, usid);
            ps.setString(2, courseId);
            ps.execute();
        } catch (SQLException e) {
            status = "Error Insert" + e.getMessage();
        }
    }

}
