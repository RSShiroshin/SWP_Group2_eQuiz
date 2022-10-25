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
            .starElement{
                width: 310px;
                height: fit-content;
                background-color: white;
                border-radius: 8px;
                margin-right: 60px;
                margin-top: 40px;
                padding-bottom: 50px;
                text-align: center;
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            }
            .quizDetail {
                display: flex;
                flex-wrap: wrap;
            }
            body{
                background-color: #f6f7fb;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div id="topProfile">
            <div style="height: 150px; background-color: darkcyan; margin-left: -25%; color: white; display: flex">
                <div style="width: 70%">
                    <p style="margin-left: 30%; padding-top: 20px;font-size: 20px">${num} Môn Trong Course Này</p>
                    <%--<c:forEach items="${courseList}" var="c">--%>
                    <p style="margin-left: 30%; padding-top: 20px; font-size: 50px">${course.courseName}</p>
                    <%--</c:forEach>--%>
                </div>
                <div>
                    <!--dung ajax de xu ly dang ky-->
                    <c:if test="${statusRegister == 1}">
                        <div  style="margin-top: 60px;">                            
                            <a style="background-color: greenyellow; border: none; padding: 20px 40px; color: darkblue;font-size: large; font-weight: 600;
                               border-radius: 8px; margin-left: -100px;
                               cursor: pointer;" href="#">Go To Course</a>
                        </div>
                    </c:if>
                    <c:if test="${statusRegister == 0}">
                        <div style="margin-top: 60px;">                            
                            <a style="background-color: greenyellow; border: none; padding: 20px 40px; color: darkblue;font-size: large; font-weight: 600;
                               border-radius: 8px; margin-left: -100px;
                               cursor: pointer;" href="EnrollCourse?cid=${cId}">ENROLL</a>
                        </div>
                    </c:if>
                </div>
            </div>
            <div id="content1"></div>
            <p class="titleNo">Các Môn Trong Course Này (${num})</p>
            <div class="quizDetail">
                <c:forEach items="${slist}" var="s">


                    <div class="starElement">
                        <a style="text-decoration: none; color: black"  href="#">
                            <img class="" src="Img/courseImg.png" height="100%" width="100%" alt="" />
                            <div>
                                <p style="margin-top: 10px; font-weight: bold">${s.subjectID}</p>
                                <p style="margin-top: 10px;">${s.subjectName}</p>
                            </div>
                        </a>
                    </div>



                    <!--//pup up-->

                </c:forEach>
            </div>
            <!--pup up-->



        </div>
            <div style="text-align: center; margin-top: 50px; ">
                <button style="padding: 10px 20px; background-color: #4255ff; color: white; border: none; border-radius: 8px;
                        font-size: 20px; cursor: pointer">Add Subject</button>
        </div>









        <div style="display: none">
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
