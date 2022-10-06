<%-- 
    Document   : courseDetail
    Created on : Oct 4, 2022, 8:28:25 AM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/courseDeltail.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div class="contentCourse">
            <div id="topProfile">
                <div class="profileName">
                    <h2>SWT301 - PT1</h2>
                    <p>Dao Trung Duc</p>
                </div>
                <p class="titleNo">Thuật ngữ trong học phần này (29)</p>
                <div class="quizDetail">
                    <c:forEach begin="1" end="10">
                        <div class="quizBorder">
                            <div class="quizLeft">
                                <p>Hello anh em nhé,Hello anh em nhé,Hello anh em nhé,</p>
                            </div>
                            <div class="quizRight">
                                <p>Hello anh em nhé</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        
    </body>
</html>
