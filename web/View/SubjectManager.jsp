<%-- 
    Document   : SubjectManager
    Created on : Oct 13, 2022, 8:05:01 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/adminCss.css" type="text/css" rel="stylesheet"/>
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
            <div class="profileName">
                <h2>${course.courseID}</h2>
                <p>${course.courseName}</p>
            </div>
            <p class="titleNo">Các Môn Trong Course Này (${num})</p>
            <div class="quizDetail">
                <c:forEach items="${slist}" var="s">
                    <div class="quizBorder">
                        <div class="quizLeft">
                            <p>${s.subjectID}</p>
                        </div>
                        <div class="quizRight">
                            <p><a href="QuestionManagerController?subjectID=${s.subjectID}">${s.subjectName}</a></p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


        <div>
            <form action="SubjectManagerController" method="post">
                <div class="modal-header">						
                    <h4 class="modal-title">Add Subject</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <div class="form-group">
                        <label>SubjectID</label>
                        <input name="id" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>SubjectName</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>                                                                                   
                    <div class="form-group">
                        <label>Description</label>
                        <input name="description" type="text" class="form-control" required>
                    </div>
                    <input name="courseID" type="text" value="${course.courseID}" hidden>



                </div>
                <div class="modal-footer">                 
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>

        </div>

    </body>
</html>
