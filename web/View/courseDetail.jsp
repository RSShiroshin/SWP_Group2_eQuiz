<%-- 
    Document   : courseDetail
    Created on : Oct 4, 2022, 8:28:25 AM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/course.css" type="text/css" rel="stylesheet"/>
        <style>
            *{
                margin: 0;
                padding: 0;
            }

            .contentCourse{
                background-color: #f6f7fb;
            }
            .profileName{
                padding-top: 20px;
                font-size: larger;
                font-weight: bold;
            }

            #topProfile{
                margin-left: 20%;
            }

            .titleNo{
                margin-top: 40px;
            }

            .quizBorder{
                display: flex;
                margin-top: 20px;
                background-color: white;
                width: 700px;
                border-radius: 5px;
            }

            .quizBorder .quizLeft{
                width: 200px;
                /*border: 1px black solid;*/
                padding: 10px 10px;
            }
            .quizBorder .quizLeft p{
                border-right: 1px black solid;

            }
            .quizBorder .quizRight{
                width: 500px;
                padding: 10px 10px;
                /*border: 1px black solid;*/
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>        
        <div id="topProfile">
            <p class="titleNo">Các Môn Trong Course Này (${num})</p>
            <div class="quizDetail">
                <c:forEach items="${slist}" var="s">
                    <div class="quizBorder">
                        <div class="quizLeft">
                            <p>${s.subjectID}</p>
                        </div>
                        <div class="quizRight">
                            <a href="SubjectDetail?subjectID=${s.subjectID}"><p>${s.subjectName}</p></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
