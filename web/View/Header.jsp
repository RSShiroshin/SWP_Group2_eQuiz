<%-- 
    Document   : Home
    Created on : Oct 3, 2022, 8:18:55 PM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
        <style>
            a{
                text-decoration: none;
                color: black;
            }
            body {
                font-family: Arial, Helvetica, sans-serif;
            }
            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 70px; /* Location of the box */
                margin-left: 750px;
                left: 0;
                top: 0;
                width: fit-content; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                border: none;
                
            }
            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin-left: 440px;
                padding: 20px;
                border: 1px solid #939bb4;
                border-radius: 10px;
                width: 300px;
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            }
            /* The Close Button */
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;

            }
            .btn-option{
                margin-top: 20px;
                margin-left: 10px;
            }
            .btn-option a{
                padding: 10px 15px;
                background-color: orange;
                border-radius: 8px;
            }
            .topR input:focus{
                outline: none;
                background-color: #f0f0f0;
                width: 400px;
            }

            .topR input{
                border: none;
                background-color: #f0f0f0;
                color: black;
                font-weight: 500;
                height: 40px;
                width: 300px;
                border-radius: 8px;
                margin-top: 10px;
                padding-left: 10px;
                font-size: 15px;
            }
            .header{
                background-color: white;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="top">
                <a href="/QuizPracticeBeta/home">
                    <img src="Img/logo.png" width="95px" height="55px" alt="Quizlut"/>
                </a>
                <a style="" href="/QuizPracticeBeta/home">
                    <p>Trang chủ</p>
                </a>

                <c:if test="${userLogin!=null}">
                    <a style="" href="ProfileController?userID=${sessionScope.userLogin.userID}">
                        <p>Profile Manager</p>
                </a>
                </c:if>                
                <c:if test="${sessionScope.userLogin.getRole() == 0}" >
                    <a style="color: darkblue;" href="CourseManagerController">
                        <p style="background-color: greenyellow; padding: 5px; border-radius: 8px; margin-top: 15px">Course Manager</p></a>                   
                    <a style="color: darkblue;" href="UserManagerController">
                        <p style="background-color: greenyellow; padding: 5px; border-radius: 8px; margin-top: 15px">User Manager</p>
                    </a>
                </c:if>
                <c:if test="${sessionScope.userLogin.getRole() == 1||sessionScope.userLogin.getRole() == 2}" >
                    <a href="LibraryExpertController?userID=${sessionScope.userLogin.userID}"><p>Thư viện của bạn</p></a>                                  
                </c:if>               

            </div>
            <div class="topR">
                <form action="search" class="d-flex mx-auto">
                    <input class="form-control me-2" 
                           type="search" 
                           id="search" placeholder="Tìm kiếm học phần, môn học" name="keyword"
                           aria-label="Search"
                           />
                    <i class="bi bi-search"></i>
                    </button>
                </form>
                <c:if test="${sessionScope.userLogin != null}">
                    <img id="myBtn" src="Img/avt.png" width="50px" height="50px" alt="Avatar"/>
                </c:if>
                <c:if test="${sessionScope.userLogin == null}">
                    <div class="btn-option">
                        <a style="color: white" href="login">Đăng Nhập</a>
                        <a style="color: white" href="RegisterController">Đăng Ký</a>
                    </div>
                </c:if>
            </div>
            <div>

            </div>


        </div>
        <!-- Trigger/Open The Modal -->

        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close"></span>
                <div style="display: flex; margin-bottom: 20px; border-bottom: 1px solid #939bb4; padding-bottom: 10px;">
                    <img id="myBtn" src="Img/avt.png" width="50px" height="50px" alt="Avatar"/>
                    <p style="margin-top: 15px; margin-left: 5px;font-size: large">${sessionScope.userLogin.getEmail()}</p>
                </div>
                    <div>
                        <a href="ProfileController" style="text-decoration: none; color: black;display: block;
                           margin-bottom: 10px;">Hồ sơ</a>
                        <a href="LogoutController" style="text-decoration: none; color: black;">Đăng xuất</a>
                    </div>
            </div>

        </div>

        <script>
            var modal = document.getElementById("myModal");
            var btn = document.getElementById("myBtn");
            var span = document.getElementsByClassName("close")[0];
            btn.onclick = function () {
                modal.style.display = "block";
            }
            span.onclick = function () {
                modal.style.display = "none";
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>

    </body>
</html>
