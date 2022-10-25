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
        <%@ include file="Header.jsp" %>
        <div class="adminTable">
            <table>
                <tr>
                    <th>CourseID</th>
                    <th>CourseName</th>                   
                    <th>Description</th>
                    <th>CategoryName</th>
                    <th>Thumbnail</th>
                </tr>

                <c:forEach items="${clist}" var="c">
                    <tr>
                        <td><p style="border: none;" type="text">${c.courseID}</p></td>
                        <td><a href="SubjectManagerController?courseID=${c.courseID}">${c.courseName}</a></td>
                        <td><input style="height: 100%; width: 100%; padding: 10px; border: none; background-color: #f6f7fb;
                                   font-size: 15px; outline: none;
                                   border-radius: 8px;" type="text" class="${c.courseID}" value="${c.description}" disabled=""></td>
                        <td><select class="${c.courseID}" style="border: none;
                                    width: 100%; padding: 10px 0; background-color: #f6f7fb; outline: none;
                                    border-radius: 8px;" name="category" class="form-select" aria-label="Default select example" disabled>
                                <c:forEach items="${cclist}" var="o">
                                    <c:if test="${c.categoryID==o.categoryID}">
                                        <option value="${o.categoryID}" selected>${o.categoryName}</option>
                                    </c:if>
                                    <option value="${o.categoryID}">${o.categoryName}</option>
                                </c:forEach>
                            </select>
                        <td>aaaa</td>                        
                        <td style=""><input style="width: 100%; padding: 10px 0; border: none; outline: none;
                                            background-color: #00ff33; border-radius: 8px; cursor: pointer; color: #4255ff" onclick="update('${c.courseID}')" type="button" value="Update"></td>                        
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div style="background-color: #4255ff; padding: 10px 2px; color: white; width: 100px;float: right; margin-right: 40px;
             text-align: center; margin-top: 20px;margin-bottom: 20px;">
            <a style="color: white; " href="#">Apply</a>

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
