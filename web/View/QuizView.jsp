<%-- 
    Document   : QuizView
    Created on : Oct 11, 2022, 7:45:32 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
        <title>JSP Page</title>

        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            .Quiz {
                width: 1000px;
                display: inline-block;
                padding-bottom: 100px;
                padding-top: 50px;
            }

            .QuizQuestion {
                margin: 8px;
                background-color: white;
                margin-bottom: 50px;
                border-radius: 8px;
                box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px;
                padding: 10px 20px;
            }
            body{
                text-align: center;
            }
            #contentQuiz{
                background-color: #f6f7fb;
                font-family: hurme_no2-webfont,-apple-system,BlinkMacSystemFont,sans-serif;

            }
            .radio-toolbar {
                margin: 10px;
            }

            .radio-toolbar input[type="radio"] {
                opacity: 0;
                position: fixed;
                width: 0;
            }

            .radio-toolbar label {
                display: inline-block;
                background-color: #f6f7fb;
                padding: 10px 20px;
                font-family: sans-serif, Arial;
                font-size: 16px;
                border: 1px solid silver;
                border-radius: 4px;
            }

            .radio-toolbar label:hover {
                background-color: #dfd;
            }

            /*            .radio-toolbar input[type="radio"]:focus + label {
                            border: 2px dashed #444;
                        }*/

            /*            .radio-toolbar input[type="radio"]:checked + label {
                            background-color: #bfb;
                            border-color: #4c4;
                        }*/

            /*code*/
z            input[type="radio"] {
                display: none;
                &:not(:disabled) ~ label {
                    cursor: pointer;
                }
                &:disabled ~ label {
                    color: hsla(150, 5%, 75%, 1);
                    border-color: hsla(150, 5%, 75%, 1);
                    box-shadow: none;
                    cursor: not-allowed;
                }
            }
            label {
                height: 100%;
                display: block;
                background: white;
                border: 1px solid silver;
                border-radius: 20px;
                padding: 1rem;
                margin-bottom: 1rem;
                text-align: center;
                box-shadow: 0px 3px 10px -2px hsla(150, 5%, 65%, 0.5);
                position: relative;
            }
                        input[type="radio"]:checked + label {
                            background: hsla(150, 75%, 50%, 1);
                            color: hsla(215, 0%, 100%, 1);
                            box-shadow: 0px 0px 20px hsla(150, 100%, 50%, 0.75);
                            &::after {
                                color: hsla(215, 5%, 25%, 1);
                                font-family: FontAwesome;
                                border: 1px solid silver;
                                content: "\f00c";
                                font-size: 24px;
                                position: absolute;
                                top: -25px;
                                left: 50%;
                                transform: translateX(-50%);
                                height: 50px;
                                width: 50px;
                                line-height: 50px;
                                text-align: center;
                                border-radius: 50%;
                                background: white;
                                box-shadow: 0px 2px 5px -2px hsla(0, 0%, 0%, 0.25);
                            }

            /*                        input[type="radio"]#control_05:checked + label {
                                        background: red;
                                        border-color: red;
                                    }*/
            p {
                font-weight: 900;
            }
            /*end*/

/*            input[type="radio"]:hover + label,
            input[type="radio"]:checked + label,
            input[type="radio"]:focus + label {
                fill: rgb(0, 204, 79);
            }*/
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
                <form action="QuizGenerateController" method="get">
                    <div>
                        <!--<input style="text-decoration: none; color: black;" type="button" value="Reset">-->
                        <input style="text-decoration: none; color: white; background-color: #4255ff;
                               padding: 10px 200px;cursor: pointer; border:none; border-radius: 8px; font-size: 24px;" type="submit" value="Tạo bài kiểm tra mới">
                    </div>
                    <div style=" margin-bottom: 20px; border-bottom: 1px solid #939bb4; padding-bottom: 10px;">
                        <p style="margin-top: 15px; margin-left: 5px;font-size: 20px; font-weight: 200;">GIỚI HẠN CÂU HỎI </p>
                        <div>
                            <input style="outline: none; border-radius: 8px; border: none" type="text" name="courseID" value="${courseID}" hidden>
                            <input type="text" name="SubjectID" value="${SubjectID}" hidden>
                            <input style="width: 30px;padding-left: 10px; border:none; border-bottom: 1px solid orange; outline: none" type="text" name="questionNum" value="${quizQuestion.size()}">
                            <input style="width: 40px; border:none; outline: none" type="text" id="id" value="/${maxQuestionNum}" disabled="">
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
        
        <div id="contentQuiz">

            <c:if test="${QuizNull == true}">
                <h1 style="text-align: center; color: red; padding: 32px">Subject has no questions</h1>
            </c:if>
                
            <c:if test="${QuizNull == false}">
                <div class="quizTable" style="width: 200px; height: 300px; position: fixed; background: white; border-radius: 8px;">
                    <c:forEach begin="0" end="${quizQuestion.size()-1}" step="1" var="i">
                        <button style="width: 20%; height: 20px; margin: 8px"><a href="#${i}" style="padding: 3px 14px; text-decoration: none;">${i+1}</a></button>
                    </c:forEach>
                    <input style="border:none; padding: 8px 40px; background-color: #4255ff; color: white;
                           border-radius: 8px; font-size: 15px; cursor: pointer;" type="submit" form="frm" value="Kiểm Tra">
                </div>
                <div class="Quiz">
                    <form id="frm" action="QuizReviewController" method="post">
                        <input type="text" name="quizID" value="${quizID}" hidden="">
                    <c:forEach begin="0" end="${quizQuestion.size()-1}" step="1" var="i">
                        <span>
                            <div class="QuizQuestion" id="${i}">
                                <p style="padding-top: 20px; font-size: 20px;font-weight: 300; text-align: left; margin-left: 50px; opacity: 0.8">Câu hỏi ${i+1}</p>
                                
                                <c:set var="str1" value="${quizQuestion[i].getContent()}"/>  
                                <c:set var="str2" value="${fn:split(str1, '/')}" />  
                                <c:if test="${not empty str2}">
                                    <c:forEach items="${str2}" var="s">
                                        <p style="margin-bottom: 10px; padding-top: 20px; font-size: 24px; margin-left: 50px; margin-right: 50px;
                                   font-weight: 400;text-align: justify">${s}</p>

                                    </c:forEach>
                                </c:if>
                                
                                
                                
                                
                                
                                
                                <input type="text" name="question${quizQuestion[i].getQuestionID()}" value="${quizQuestion[i].getQuestionID()}" hidden>
                                <p style="margin-bottom: 20px;padding-top: 20px; font-size: 20px; text-align: left; margin-left: 50px;
                                   font-weight: 300;opacity: 0.8">Chọn đáp án đúng</p>
                                <div style="text-align: left; display: flex;">
                                    <div style="margin-left: 50px; display: flex; flex-wrap: wrap;" class="">
                                        <c:forEach items="${quizAnswer}" var="answer">
                                            <c:if test="${quizQuestion[i].getQuestionID() == answer.getQuestionID()}">
                                                <!--code-->
                                                <!--<div>-->

                                                <input style="margin-right: 10px;" type="radio" id="answer${answer.getQuestionID()}" name="answer${answer.getQuestionID()}"
                                                       value="${answer.getAnswerID()}"/>


                                                <label for="answer${answer.getQuestionID()}" onclick="checkAns('answer${answer.getAnswerID()}${answer.getQuestionID()}')"
                                                       style="width: 400px; height: 150px; margin-right: 50px;
                                                       margin-top: 10px; margin-left: 10px; margin-right: 10px;">
                                                    <p style="font-weight: 300; font-size: 18px; text-align: left; line-height: 1.5">${answer.getContent()}</p> 
                                                </label>

                                                <!--</div>-->
                                                <!--end-->
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>           
                        </span>
                    </c:forEach>

                    <input style="border:none; padding: 20px 80px; background-color: #4255ff; color: white;
                           border-radius: 8px; font-size: 15px; cursor: pointer;" type="submit" value="Kiểm Tra">
                </form>



            </div>
            </c:if>
            
        </div>


        <script>
//            function checkAns(e) {
//                var x = document.getElementById(e);
//                x.check = 'click';
//            }
        </script>
    </body>
</html>
