<%-- 
    Document   : ExpertAssign
    Created on : Oct 18, 2022, 10:26:12 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-color: #f6f7fb;
            }
            .starElement{
                width: 310px;
                height: 200px;
                background-color: white;
                border-radius: 8px;
                margin-left: 60px;
                margin-top: 40px;
                padding-bottom: 50px;
                text-align: center;
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div style="padding-top: 20px; margin-left: 10%;display: flex; flex-wrap: wrap">
            <c:forEach items="${lstEA}" var="e">
                <c:if test="${role == 1}">
                    <c:forEach items="${lstSubject}" var="s">
                        <c:if test="${e.getSubjectID() == s.getSubjectID()}">
                            <p>${s.getSubjectName()}</p>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${role == 2}">
                    <!--<div style="display: flex; flex-wrap: wrap">-->
                        <c:forEach items="${lstCourse}" var="ss">
                            <c:if test="${e.getSubjectID() == ss.getCourseID()}">
                                <div class="starElement">
                                    <a style="text-decoration: none; color: black"  href="DetailCourseController?courseID=${ss.courseID}">
                                        <img class="" src="Img/courseImg.png" height="100%" width="100%" alt="..." />

                                        <div>
                                            <p style="margin-top: 10px;">${ss.getCourseName()}</p>
                                        </div>
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                    <!--</div>-->
                </c:if>

            </c:forEach>
        </div>
    </body>
</html>
