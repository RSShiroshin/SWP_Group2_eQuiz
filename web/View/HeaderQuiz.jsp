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
                padding-top: 100px; /* Location of the box */
                margin-left: 500px;
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
                margin-left: 0;
                padding: 20px;
                border: 1px solid #939bb4;
                border-radius: 10px;
                width: 700px;
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
                width: 100%;
                /*position: fixed;*/
                background-color: white;
                /*z-index: 1;*/
                box-shadow: rgba(33, 35, 38, 0.1) 0px 10px 10px -10px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="top">
                <a href="/QuizPracticeBeta/home">
                    <img src="Img/logo.png" width="95px" height="55px" alt="Quizlut"/>
                </a>
                <div style="text-align: center; width: 100%">
                    <p style="margin-top: 5px;">20/20</p>
                    <p style="margin-top: -3px;">SWR</p>

                </div>



            </div>
            <div class="topR">
                <div style="margin-top: 10px">
                    <button style="padding: 10px 20px; border: 1px solid silver; border-radius: 8px; font-weight: 300; background-color: #fefefe" id="myBtn">Tuỳ chọn</button>
                </div>
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
                <form action="#">
                    <div>
                        <!--<input style="text-decoration: none; color: black;" type="button" value="Reset">-->
                        <input style="text-decoration: none; color: white; background-color: #4255ff;
                               padding: 10px 200px;cursor: pointer; border:none; border-radius: 8px; font-size: 24px;" type="button" value="Tạo bài kiểm tra mới">
                    </div>
                    <div style=" margin-bottom: 20px; border-bottom: 1px solid #939bb4; padding-bottom: 10px;">
                        <p style="margin-top: 15px; margin-left: 5px;font-size: 20px; font-weight: 200;">GIỚI HẠN CÂU HỎI </p>
                        <div>
                            <input style="width: 30px;padding-left: 10px; border:none; border-bottom: 1px solid orange; outline: none" type="text" name="name" value="20">
                            <input style="width: 40px; border:none; outline: none" type="text" id="id" value="/20" disabled="">
                        </div>
                    </div>
                </form>

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
