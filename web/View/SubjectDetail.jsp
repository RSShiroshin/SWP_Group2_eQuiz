<%-- 
    Document   : SubjectDetail
    Created on : Oct 20, 2022, 9:03:32 AM
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
        <%@ include file="Header.jsp" %>
        <div class="adminTable">
            <table>
                <tr>
                    <th>Question ID</th>
                    <th>Content</th>                   
                    <th>Explain</th>
                    <th>Subject Name</th>
                </tr>

                <c:forEach items="${listQuestion}" var="q">
                    <tr>
                        <td>${q.questionID}</td>
                        <td>${q.content}</td>
                        <td>${q.explain}</td>
                        <td><c:forEach items="${listSubject}" var="cc">
                                <c:if test="${q.subjectID==cc.subjectID}">
                                    ${cc.subjectName}
                                </c:if>
                            </c:forEach></td>

                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
