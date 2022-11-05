<%-- 
    Document   : SubjectManager
    Created on : Oct 13, 2022, 8:05:01 AM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            .clear {
                clear: both;
            }

            .text-white { /*thay thành chữ trắng*/
                color: #fff !important;
            }

            .text-center {
                text-align: center;
            }

            .pull-right {
                float: right !important;
            }

            .btn {
                color: #fff;
                background-color: #000;
                text-decoration: none;
                padding: 11px 16px;
                display: inline-block;
                margin-top: 16px;
                border: none;
                appearance: none;
                -webkit-appearance: none;
            }

            .btn:hover {
                color: #000;
                background-color: #ccc;
                cursor: pointer;
            }

            .row {
                margin-left: -8px;
                margin-right: -8px;
            }

            /* thêm element giả (thẻ div) sau thẻ row */
            .row::after {
                content: "";
                display: block;
                clear: both;
            }

            .col {
                float: left;
                padding-left: 8px;
                padding-right: 8px;
            }

            .col_2_3{
                width: 200px;
                height: 300px;
            }

            .col-fouth {
                width: calc(100% /4);
            }

            .col-third {
                width: calc(100% /3);
            }

            .col-half {
                width: calc(100% /2);
            }

            .col-full {
                width: 100%;
            }

            .mt-8 {
                margin-top: 8px !important;
            }

            .m-8 {
                margin: 8px !important;
            }

            .mt-16 {
                margin-top: 16px !important;
            }

            .mt-32 {
                margin-top: 32px !important;
            }
            .contactForm {
                display: none;
                position: fixed;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                background-color: rgba(0, 0, 0, 0.4);
                align-items: center;
                justify-content: center;
            }

            .contactForm.open {
                display: flex;
            }

            .contactFormClose{
                display: inline-block;
                font-size: 30px;
                width: 30px;
                height: 30px;
            }

            .contactFormClose:hover {
                background: red;
                color: white;
                cursor: pointer;
            }

            .inner_contact_form {
                display: flex;
                background: white;
                width: 60%;
                height: 60%;
            }

            .pic {
                display: inline-block;
                width: 40%;
            }
            .pic img{
                width: -webkit-fill-available;
                height: -webkit-fill-available;
            }

            .form {
                display: inline-block;
            }
            
            .form-group{
                display: flex;
                margin-bottom: 20px;
            }
            .form-control{
                height: 30px;
                margin-left: 30px;
                width: 500px;
                padding: 5px 10px;
            }
            .courseTxt{
                width: 50%;
                margin-left: 5%;
            }
        </style>
    </head>
    <body>
        <%@ include file="../Header.jsp" %>
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
                                <p style="margin-top: 10px; margin-bottom: 10px;">Expert: 
                                    <c:forEach begin="0" end="${assignlist.size()}" step="1" var="i">                          
                                        <c:if test="${assignlist[i].getSubjectID().equals(s.getSubjectID())}">
                                            <c:forEach begin="0" end="${expertlist.size()-1}" step="1" var="e">
                                                <c:if test="${assignlist[i].getUserID()==expertlist[e].userID}">
                                                    ${expertlist[e].fullName}
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach></p>
                            </div>
                        </a>
                        <form action="AssignExpertController" method="get">
                            <input style="padding: 5px 10px; border: none; border-radius: 8px; background-color: #4275FC;
                                   color: white; cursor: pointer;" type="submit" value="Assign"> 
                            <input type="text" name="courseID" value="${course.courseID}" hidden>
                            <input type="text" name="subjectAssignID" value="${s.subjectID}" hidden>
                            <select style="padding: 5px 10px; border: none; border-radius: 8px; background-color: #ccc;" name="expertAssignID">
                                <option value="0">none</option>
                                <c:forEach begin="0" end="${expertlist.size()-1}" step="1" var="e">
                                    <option value="${expertlist[e].userID}">${expertlist[e].userName}</option>
                                </c:forEach>
                            </select>
                        </form>
                        <button style="margin-top: 10px; padding: 10px 20px; border:none; border-radius: 8px; background-color: #00ff33;
                                color: purple; cursor: pointer">Edit Subject</button>
                    </div>



                    <!--//pup up-->

                </c:forEach>
            </div>
            
            <!--update subject-->
            
            
            
            
            <!--end update subject-->
            
            
            
            
            
            

            <!--pup up-->



        </div>
        <div style="text-align: center; margin-top: 50px; margin-bottom: 50px; ">
            <button style="padding: 10px 20px; background-color: #4255ff; color: white; border: none; border-radius: 8px;
                    font-size: 20px; cursor: pointer" class="btn mt-16 js-openContactForm">Add Subject</button>
        </div>




            
                <!--add subject-->
                
                
                
        <div style="padding-top: 100px; padding-left: 20%;" id="mydiv" class="contactForm js-contactForm ${open}">
            <div style="width: 80%; border-radius: 8px;" class="inner_contact_form">
                <div style="border-radius: 8px 0 8px 0; width: 50px;background-color: red; color: white;" class="contactFormClose js-closeContactForm">
                    <p style="font-size: 18px; width: 50px; padding-top: 5px; " class="ti-close">Close</p>      
                </div>
                <div style="margin-left: 20px; margin-bottom: 20px; margin-top: 50px;" class="form">
                    <div >
                        
                        <!--add subject-->
                        
                        
                        <form action="#" method="post">
                            <div style="margin-bottom: 50px; margin-left:30px;" class="modal-header">						
                                <h3 class="modal-title">Add Course</h3>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <p class="courseTxt">SubjectID</p>
                                    <input name="id" type="text" class="form-control" placeholder="Nhập subject ID" required>
                                    <input name="courseID" type="text" class="form-control" value="${course.courseID}" hidden="">
                                </div>
                                <div class="form-group">
                                    <p class="courseTxt">SubjectName</p>
                                    <input name="name" type="text" class="form-control" placeholder="Nhập course name" required>
                                </div>
                                                                                        
                                <div class="form-group">
                                    <p class="courseTxt">Description</p>
                                    <input name="description" type="text" class="form-control" placeholder="Nhập mô tả" required>
                                </div>
                               


                            </div>
                            <div style="margin-left: 30px;" class="modal-footer">                           
                                <input style=" border-radius: 8px;" type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

                                <!--end add subjetc-->
        </div>

        <script>
            const contactFormOpen = document.querySelectorAll('.js-openContactForm');
            const contactFormClose = document.querySelectorAll('.js-closeContactForm');
            const contactForm = document.querySelector('.js-contactForm');

            for (const Btn of contactFormOpen) {
                Btn.addEventListener('click', show);
            }

            function showContactForm() {
                contactForm.classList.add('open');
            }

            for (const Btn of contactFormClose) {
                Btn.addEventListener('click', hide);
            }

            function hide() {
                document.getElementById('mydiv').style.display = 'none';
            }
            function show() {
                document.getElementById('mydiv').style.display = 'block';
            }

            function hideContactForm() {
                contactForm.classList.remove('hide');
                alert("Send success!!");
            }
        </script>






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
