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
                margin-bottom: 20px;
                background-color: white;
                width: 900px;
                height: 200px;
                border-radius: 8px;
                justify-content: center;
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
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
            .open-button {
                background-color: #f6f7fb;
                /*                color: white;
                                padding: 16px 20px;*/
                border: none;
                cursor: pointer;
                /*opacity: 0.8;*/
                /*position: fixed;*/
                /*bottom: 23px;*/
                /*right: 28px;*/
                /*width: 280px;*/
            }

            /* The popup form - hidden by default */
            .form-popup {
                display: none;
                border-radius: 8px;
                /*position: fixed;*/
                bottom: 0;
                left: 300px;
                border: 3px solid #f1f1f1;
                z-index: 9;
                width: 900px;
            }

            /* Add styles to the form container */
            .form-container {
                max-width: 900px;
                padding: 10px;
                background-color: white;
            }

            /* Full-width input fields */
            .form-container input[type=text], .form-container input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
            }

            /* When the inputs get focus, do something */
            .form-container input[type=text]:focus, .form-container input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

            /* Set a style for the submit/login button */
            .form-container .btn {
                background-color: #04AA6D;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 100%;
                margin-bottom:10px;
                opacity: 0.8;
            }

            /* Add a red background color to the cancel button */
            .form-container .cancel {
                background-color: red;
            }

            /* Add some hover effects to buttons */
            .form-container .btn:hover, .open-button:hover {
                opacity: 1;
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">


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

            function openForm(e) {
                document.getElementById(e).style.display = "block";
            }

            function closeForm() {
                document.getElementById("myForm").style.display = "none";
            }
            


        </script>
    </body>
</html>
