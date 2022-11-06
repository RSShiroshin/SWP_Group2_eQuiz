<%-- 
    Document   : Profile
    Created on : Oct 4, 2022, 8:11:58 AM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/profileCss.css" type="text/css" rel="stylesheet"/>
        <style>
            #profileContainer{
                margin-left: 10%;
                margin-right: 10%;
            }

            /*//pupup*/
            .open-button {
                background-color: #4255ff;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                opacity: 0.8;
                /*position: fixed;*/
                top: 40%;
                left: 10%;
                width: 280px;
                border-radius: 8px;
                margin-top: 20px;
            }
            .pass-button {
                background-color: #04AA6D;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                opacity: 0.8;
                /*position: fixed;*/
                top: 40%;
                left: 10%;
                width: 280px;
                border-radius: 8px;
                margin-top: 20px;
                margin-left: 50px;
            }
            /* The popup form - hidden by default */
            .form-popup {
                display: none;
                position: fixed;
                top: 100px;
                left: 20%;
                border: 3px solid #f1f1f1;
                /*z-index: 9;*/
                border-radius: 8px;
                box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;
            }

            /* Add styles to the form container */
            .form-container {
                width: 800px;
                padding: 10px;
                background-color: white;
            }

            /* Full-width input fields */
            .form-container input[type=text], .form-container input[type=password] {
                width: 90%;
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

            .infor div{
                margin-top: 10px;
            }
            .infor div p{
                font-size: large;
                font-weight: bold;
                margin-right: 10px;
            }
            body
            {
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
                color: white;
                background-color: #4255ff;
                text-decoration: none;
                padding: 11px 16px;
                display: inline-block;
                margin-top: 16px;
                border: none;
                appearance: none;
                -webkit-appearance: none;
            }

            .btn:hover {
                color: white;
                background-color: #4275FC;
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
        <%@ include file="Header.jsp" %>
        <div id = "profileContainer" >

            <div id = "profileInfo">
                <div style="border-bottom: 1px solid black; padding-bottom: 20px;" id="topProfile">
                    <img src="Img/avt.png" width="70px" height="70px" alt="Avatar"/>
                    <div class="profileName">
                        <h2>${userLogin.getUserName()}</h2>
                        <p>${userLogin.getFullName()}</p>
                    </div>  
                </div>
                <div class="infor" style="margin-top: 50px">
                    <!--                    <div style="display: flex;"><p>Password: </p> **********</div>-->
                    <div style="display: flex;"><p>Email: </p> ${userLogin.getEmail()}</div>
                    <div style="display: flex;"><p>Description: </p> ${userLogin.getDescription()}</div> 
                </div>
            </div>

            <!--//pup up-->
            <button class="open-button" onclick="openForm()">Edit Profile</button>
            <p href="#"  class="btn mt-16 js-openContactForm pass-button">Change Password</p>
            <div class="form-popup" id="myForm">
                <form action="ChangeProfileController" method="get" class="form-container">
                    <input type="text" name="userID" value="${userLogin.getUserID()}" hidden>
                    <input type="text" name="userName" value="${userLogin.getUserName()}" hidden>
                    <!--<p>Password:</p>--> <input type="text" name="Password" value="${userLogin.getPassword()}" hidden></br>                  
                    <p>Full Name:</p> <input type="text" name="fullName" value="${userLogin.getFullName()}"></br>
                    <p>Email:</p> <input type="text" name="email" value="${userLogin.getEmail()}"></br>
                    <p>Description:</p> <input type="text" name="description" value="${userLogin.getDescription()}"></br>
                    <input type="submit" class="btn" value="Submit Change">
                    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                </form>
            </div><!-- comment -->
        </div>

        <div style="padding-top: 100px; padding-left: 20%;" id="mydiv" class="contactForm js-contactForm ${open}">
            <div style="width: 80%; border-radius: 8px;" class="inner_contact_form">
                <div style="border-radius: 8px 0 8px 0; width: 50px;background-color: red; color: white;" class="contactFormClose js-closeContactForm">
                    <p style="font-size: 18px; width: 50px; padding-top: 5px; " class="ti-close">Close</p>      
                </div>
                <div style="margin-left: 20px; margin-bottom: 20px; margin-top: 50px;" class="form">
                    <div >
                        
                        <!--add subject-->
                        
                        
                        <form action="ChangePassword" method="post">
                            <div style="margin-bottom: 50px; margin-left:30px;" class="modal-header">						
                                <h3 class="modal-title">Thay đổi mật khẩu</h3>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <p class="courseTxt">Mật khẩu cũ</p>
                                    <input name="id" type="password" name="oldpass" class="form-control" placeholder="Mật khẩu cũ" required>
                                     <c:if test="${not empty requestScope.error1}">
                                        <a style="color:red">${requestScope.error1}</a>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <p class="courseTxt">Mật khẩu mới</p>
                                    <input name="name" type="password" name="newpass" class="form-control" placeholder="Mật khẩu mới" required>
                                </div>
                                                                                        
                                <div class="form-group">
                                    <p class="courseTxt">Nhập lại mật khẩu mới</p>
                                    <input name="description" name="repass" type="password" class="form-control" placeholder="Nhập lại mật khẩu mới" required>
                                    <c:if test="${not empty requestScope.error}">
                                        <a style="color:red">${requestScope.error}</a>
                                    </c:if>
                                </div>
                            </div>
                            <div style="margin-left: 30px;" class="modal-footer">                           
                                <input style=" border-radius: 8px;" type="submit" class="btn btn-success" value="Thay đổi">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

                                <!--end add subjetc-->
        </div>

        <script>
            function openForm() {
                document.getElementById("myForm").style.display = "block";
            }

            function closeForm() {
                document.getElementById("myForm").style.display = "none";
            }
        </script>
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
    </body>
</html>
