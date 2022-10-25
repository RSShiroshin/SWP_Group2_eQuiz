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
    </head>
    <body>
         <%@ include file="Header.jsp" %>
        <div class="adminTable">
            <table>
                <tr>
                    <th>CourseID</th>
                    <th>CourseName</th>                   
                    <th>Description</th>
                    <th>CategoryName</th>
                    <th>Thumbnail</th>
                    <th>Delete</th>
                    <th>Update</th>
                    
                </tr>

                <c:forEach items="${clist}" var="c">
                    <tr>
                        <td>${c.courseID}</td>
                        <td><a href="SubjectManagerController?courseID=${c.courseID}">${c.courseName}</a></td>
                        <td>${c.description}</td>
                       <td><c:forEach items="${cclist}" var="cc">
                                        <c:if test="${c.categoryID==cc.categoryID}">
                                            ${cc.categoryName}
                                        </c:if>
                           </c:forEach></td>
                                           
                        <td>aaaa</td> 
                        <td><a href="CourseDeleteUpdateController?courseID=${c.courseID}&type=0">Delete</a></td>
                        <td>Update</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
       
        <div>
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
        
    </body>
</html>
