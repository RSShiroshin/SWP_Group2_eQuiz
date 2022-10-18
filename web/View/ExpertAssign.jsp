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
    </head>
    <body>
    <c:forEach items="${lstEA}" var="e">
        <c:if test="${role == 1}">
            <c:forEach items="${lstSubject}" var="s">
                <c:if test="${e.getSubjectID() == s.getSubjectID()}">
                    <p>ten mon: ${s.getSubjectName()}</p>
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${role == 2}">
            <c:forEach items="${lstCourse}" var="ss">
                <c:if test="${e.getSubjectID() == ss.getCourseID()}">
                    <p>ten mon: ${ss.getCourseName()}</p>
                </c:if>
            </c:forEach>
        </c:if>

    </c:forEach>
</body>
</html>
