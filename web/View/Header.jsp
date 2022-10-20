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
                margin-left: 700px;
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
                margin-left: 500px;
                padding: 20px;
                border: 1px solid #939bb4;
                border-radius: 10px;
                width: 30%;
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
                
                

                <c:if test="${sessionScope.userLogin.getRole() == 0}" >
                    <a href="CourseManagerController"><p>Course Management</p></a>
                    <a style="" href="ProfileController?userID=${sessionScope.userLogin.userID}">
                    <p>Profile Management</p>
                </a>
                </c:if>
                <c:if test="${sessionScope.userLogin.getRole() == 1}" >
                    <a href="LibraryExpertController?userID=${sessionScope.userLogin.userID}"><p>Thư viện của bạn</p></a>
                    <a style="" href="ProfileController?userID=${sessionScope.userLogin.userID}">
                    <p>Profile Management</p>
                </a>
                </c:if>
                <c:if test="${sessionScope.userLogin.getRole() == 2}" >
                    <a href="LibraryExpertController?userID=${sessionScope.userLogin.userID}"><p>Thư viện của bạn</p></a>
                    <a style="" href="ProfileController?userID=${sessionScope.userLogin.userID}">
                    <p>Profile Management</p>
                </a>
                </c:if>

            </div>
            <div class="topR">
                <form action="search" class="d-flex mx-auto">
                    <input class="form-control me-2" 
                           type="search" 
                           id="search" placeholder="Tìm kiếm tại đây" name="keyword"
                           aria-label="Search"
                           />
                    <i class="bi bi-search"></i>
                    </button>
                </form>
                <img id="myBtn" src="Img/avt.png" width="50px" height="50px" alt="Avatar"/>
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
                <div style="display: flex; margin-bottom: 20px; border-bottom: 1px solid #939bb4">
                    <img id="myBtn" src="Img/avt.png" width="50px" height="50px" alt="Avatar"/>
                    <p style="margin-top: 15px; margin-left: 5px;">${sessionScope.userLogin.getEmail()}</p>
                </div>
                <c:if test="${sessionScope.userLogin != null}">
                    <div>
                        <a href="ProfileController" style="text-decoration: none; color: black;display: block;
                           margin-bottom: 10px;">Hồ sơ</a>
                        <a href="LogoutController" style="text-decoration: none; color: black;">Đăng xuất</a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.userLogin == null}">
                    <div>
                        <a href="login" style="text-decoration: none; color: black;">Đăng nhập</a>
                    </div>
                </c:if>
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
