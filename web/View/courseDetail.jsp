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
                justify-content: center;
            }

            .quizBorder .quizLeft{
                width: 200px;
                /*border: 1px black solid;*/
                padding: 20px 20px;
            }
            .quizBorder .quizLeft p{
                border-right: 1px black solid;

            }
            .quizBorder .quizRight{
                width: 500px;
                padding: 20px 10px;
                /*border: 1px black solid;*/
            }
            body{
                background-color: #f6f7fb;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>   
        <input type="text" id="usId" value="${sessionScope.userLogin.getUserID()}" hidden="">
        <input type="text" id="cId" value="${cId}" hidden="">
        <div id="topProfile">
            <div style="height: 150px; background-color: darkcyan; margin-left: -25%; color: white; display: flex">
                <div style="width: 70%">
                    <p style="margin-left: 30%; padding-top: 20px;font-size: 20px">${num} Môn Trong Course Này</p>
                    <c:forEach items="${courseList}" var="c">
                        <c:if test="${c.getCourseID().equals(cId)}">
                            <p style="margin-left: 30%; padding-top: 20px; font-size: 50px">${c.getCourseName()}</p>
                        </c:if>
                    </c:forEach>
                </div>
                <div>
                    <!--dung ajax de xu ly dang ky-->
                    <c:if test="${statusRegister == 1}">
                        <div>                            
                            <button style="background-color: greenyellow; border: none; padding: 20px 40px; color: darkblue;font-size: large; font-weight: 600;
                                    border-radius: 8px; margin-top: 40px; margin-left: -100px;" type="button">Go to Course</button>
                        </div>
                    </c:if>
                    <c:if test="${statusRegister == 0}">
                        <div>                            
                            <button style="background-color: greenyellow; border: none; padding: 20px 40px; color: darkblue;font-size: large; font-weight: 600;
                                    border-radius: 8px; margin-top: 40px; margin-left: -100px;
                                    cursor: pointer;" onclick="enroll()" type="button">ENROLL</button>
                        </div>
                    </c:if>
                </div>
            </div>
            <div id="content1"></div>
            <p class="titleNo">Các Môn Trong Course Này (${num})</p>
            <div class="quizDetail">
                <c:forEach items="${slist}" var="s">
                    <div class="quizBorder">
                        <div class="quizLeft">
                            <p style="font-size: large">${s.subjectID}</p>
                        </div>
                        <div class="quizRight">
                            <a href="SubjectDetail?subjectID=${s.subjectID}"><p>${s.subjectName}</p></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>


                                        function enroll() {

                                            var id = document.getElementById("usId").value;
                                            $.ajax({
                                                url: "Ajaxdemo",
                                                type: "post", //send it through get method
                                                data: {
                                                    id: id,
                                                    cid: cId,
                                                    type: 2
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content1");
                                                    row.innerHTML += data;
                                                    window.location.reload();
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }


        </script>
    </body>
</html>
