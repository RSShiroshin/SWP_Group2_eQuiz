<%-- 
    Document   : Search
    Created on : Oct 6, 2022, 12:31:52 AM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/searchCss.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div class="topSearch">
            <input type="search" id="id" value="Hello">
            <p>Tất cả</p>
        </div>
        <div class="contentSearch">
            <div id="courseSearch">
                <p>Học phần</p>
                <div class="borderRs">
                    <c:forEach begin="1" end="3">
                        <a style="border: none;" href="#">
                            <div class="resultCourse">
                                <p>Hello</p>
                                <p class="NoDefine">122 thuật ngữ</p>
                                <div class="author">
                                    <p>name</p>
                                </div>
                            </div>
                        </a>.

                    </c:forEach>
                </div>

            </div>
        </div>

    </body>
</html>
