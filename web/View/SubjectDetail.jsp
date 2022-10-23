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
        <style>

        </style>
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
                        <td style="width: 3%; text-align: center; border-right: 1px solid black">${q.questionID}</td>
                        <td style="width: 45%; border-right: 1px solid black;padding: 10px 5px">${q.content}</td>
                        <td style="width: 30%; border-right: 1px solid black">${q.explain}</td>
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
