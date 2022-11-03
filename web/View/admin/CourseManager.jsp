<%-- 
    Document   : CourseManager
    Created on : Oct 13, 2022, 8:05:01 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/adminCss.css" type="text/css" rel="stylesheet"/>
        <style>
            body{
                background-color: #f6f7fb;
            }
            th, td {
                border: 1px solid #4255ff;
                border-radius: 8px;
            }
        </style>
    </head>
    <body>
        <%@ include file="../Header.jsp" %>
        <div class="adminTable">
            <form id="form1" action="CourseManagerController" method="get">
                <table>
                    <tr>
                        <th>Course ID</th>
                        <th>Course name</th>
                        <th>Description</th>
                        <th>CategoryName</th>
                        <th>Thumbnail</th>
                        <th>Detail</th>
                        <th>Update</th>
                        <th>Delete</th>                    
                    </tr>
                    <input type="text" name = "type" value="2" hidden>
                    <c:forEach items="${clist}" var="c">
                        <tr>
                            <td><p style="border: none;" type="text">${c.courseID}</p>
                            <input type="text" name = "${c.courseID}" value="${c.courseID}" class="${c.courseID}"  disabled="" hidden>
                            </td>
                            <td><input style="height: 100%; width: 100%; padding: 10px; border: none; background-color: #f6f7fb;
                                       font-size: 15px; outline: none;
                                       border-radius: 8px;" type="text" class="${c.courseID}" value="${c.courseName}" disabled="" name="${c.courseID}0"></td>
                            <td><input style="height: 100%; width: 100%; padding: 10px; border: none; background-color: #f6f7fb;
                                       font-size: 15px; outline: none;
                                       border-radius: 8px;" type="text" class="${c.courseID}" value="${c.description}" name="${c.courseID}1" disabled=""></td>
                            <td><select class="${c.courseID}" style="border: none;
                                        width: 100%; padding: 10px 0; background-color: #f6f7fb; outline: none;
                                        border-radius: 8px;" class="form-select" aria-label="Default select example" name="${c.courseID}2" disabled>
                                    <c:forEach items="${cclist}" var="o">
                                        <c:if test="${c.categoryID==o.categoryID}">
                                            <option value="${o.categoryID}" selected>${o.categoryName}</option>
                                        </c:if>
                                        <option value="${o.categoryID}">${o.categoryName}</option>
                                    </c:forEach>
                                </select>

                            <td><input style="height: 100%; width: 100%; padding: 10px; border: none; background-color: #f6f7fb;
                                       font-size: 15px; outline: none;
                                       border-radius: 8px;" type="text" class="${c.courseID}" value="${c.thumbnail}" name="${c.courseID}3" disabled=""></td>    
                            <td><input style="width: 100%; padding: 10px 0; border: none; outline: none;
                                       background-color: #00ff33; border-radius: 8px; cursor: pointer; color: #4255ff" type="button" value="Detail" onclick="location.href = 'SubjectManagerController?courseID=${c.courseID}'"></td>
                            <td style=""><input style="width: 100%; padding: 10px 0; border: none; outline: none;
                                                background-color: #00ff33; border-radius: 8px; cursor: pointer; color: #4255ff" onclick="update('${c.courseID}')" type="button" value="Update"></td>                        
                            <td style=""><input style="width: 100%; padding: 10px 0; border: none; outline: none;
                                                background-color: #00ff33; border-radius: 8px; cursor: pointer; color: #4255ff" type="button" value="Delete" onclick="location.href = 'CourseManagerController?type=1&courseID=${c.courseID}';"></td>                        
                        </tr>
                    </c:forEach>

                </table>
            </form>
        </div>

        <div >
            <form action="CourseManagerController" method="post">
                <div class="modal-header">						
                    <h4 class="modal-title">Add Course</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <div class="form-group">
                        <label>CourseID</label>
                        <input name="id" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>CourseName</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select name="category" class="form-select" aria-label="Default select example">
                            <c:forEach items="${cclist}" var="o">
                                <option value="${o.categoryID}">${o.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>                                                         
                    <div class="form-group">
                        <label>Description</label>
                        <input name="description" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Thumnail</label>
                        <input name="thumbnail" type="text" class="form-control" required>
                    </div>


                </div>
                <div class="modal-footer">                           
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>

        <div style="background-color: #4255ff; padding: 10px 2px; color: white; width: 100px;float: right; margin-right: 40px;
             text-align: center; margin-top: 20px;margin-bottom: 20px;">
            <button style="background-color: #4255ff;border: none;color: white;" type="submit" form="form1" value="Apply">Apply</button>
        </div>



        <script language="javascript" type="text/javascript">
            function update(event) {
                var x = document.getElementsByClassName(event);
                for (var i = 0; i < x.length; i++) {
                    x[i].disabled = false;
                    x[i].style.backgroundColor = "#FAF0E6";
                }
            }
        </script>
    </body>
</html>
