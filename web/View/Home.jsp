<%-- 
    Document   : Home
    Created on : Oct 3, 2022, 9:24:41 PM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div class="HomeContent">
            <div class="topStar">
                <h3>Yêu thích</h3>
                <div class="star">
                    <c:forEach begin="1" end="8"> 
                        <div class="starElement">
                            <p>SWT301c</p>
                        </div>

                    </c:forEach>
                </div>
            </div>
            
            <div class="topStar">
                <h3>Gợi ý</h3>
                <div class="star">
                    <c:forEach begin="1" end="8"> 
                        <div class="starElement">
                            <p>SSG</p>
                        </div>

                    </c:forEach>
                </div>
            </div>

        </div>

    </body>
</html>
