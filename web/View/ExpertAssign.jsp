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
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div style="padding-top: 20px; margin-left: 10%;">
            <c:forEach items="${lstEA}" var="e">
                <c:if test="${role == 1}">
                    <c:forEach items="${lstSubject}" var="s">
                        <c:if test="${e.getSubjectID() == s.getSubjectID()}">
                            <p>${s.getSubjectName()}</p>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${role == 2}">
                    <c:forEach items="${lstCourse}" var="ss">
                        <c:if test="${e.getSubjectID() == ss.getCourseID()}">
                            <p>${ss.getCourseName()}</p>
                        </c:if>
                    </c:forEach>
                </c:if>

            </c:forEach>
        </div>
    </body>
</html>
