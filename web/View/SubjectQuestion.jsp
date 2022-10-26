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

            body{
                background-color: #f6f7fb;
            }
            .adminTable{
                padding-top: 50px;
            }
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

                <c:if test="${sessionScope.userLogin == null}">
                    <c:forEach items="${listQuestion}" begin="0" end="19" var="q">
                        <c:if test="${q.subjectID==sid}">
                            <tr>
                                <td style="width: 3%; text-align: center; border-right: 1px solid black">${q.questionID}</td>
                                <td style="width: 45%; border-right: 1px solid black;padding: 10px 5px">${q.content}</td>
                                <td style="width: 30%; border-right: 1px solid black">${q.explain}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    
                </c:if>
                <c:if test="${sessionScope.userLogin != null}">
                    <c:forEach items="${listQuestion}" var="q">
                        <c:if test="${q.subjectID==sid}">
                            <tr>
                                <td style="width: 3%; text-align: center; border-right: 1px solid black">${q.questionID}</td>
                                <td style="width: 45%; border-right: 1px solid black;padding: 10px 5px">${q.content}</td>
                                <td style="width: 30%; border-right: 1px solid black">${q.explain}</td>
                            </tr>
                        </c:if>

                    </c:forEach>
                </c:if>
            </table>
            <c:if test="${sessionScope.userLogin == null}">
                <div style="margin-top: 60px; text-align: center">                            
                        <a style="background-color: greenyellow; border: none; padding: 20px 40px; color: darkblue;font-size: large; font-weight: 600;
                           border-radius: 8px; margin-left: 0;
                           cursor: pointer;" href="EnrollCourse?cid=${cId}">ENROLL NOW!</a>
                    </div>
            </c:if>
        </div>
    </body>
</html>
