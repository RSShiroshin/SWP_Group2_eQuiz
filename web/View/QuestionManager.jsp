<%-- 
    Document   : AddCourse
    Created on : Oct 6, 2022, 2:20:13 PM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/adminCss.css" type="text/css" rel="stylesheet"/>
        <style>
            .infoUserR input{
                width: 100%;
                height: 50px;
                margin-top: 5px;
                padding-left: 10px;
                border: 2px black solid;
                border-radius: 5px;
            }
            .infoUserR input:focus{
                border: 2px orange solid;
                outline: none;
            }

            .infoUserR p{
                margin-top: 15px;
                font-size: 14px;
                font-weight: initial;
                color: #939bb4;
            }

            a{
                text-decoration: none;
                margin-left: 5px;
                margin-top: 15px;
            }
            .contentCourse{
                background-color: #f6f7fb;
                height: fit-content;
            }
            .addCourse{
                margin-left: 20%;
                margin-right: 20%;
            }

            .addImg{
                text-align: center;
                background-color: white;
                margin-top: 20px;
                margin-bottom: 20px;
                height: fit-content;
                padding: 20px 0;
                width: 100%;
                border-radius: 10px;
                border: 1px black dashed;
            }
            .question{
                height: 200px;
                background-color: white;
                margin-top: 10px;
                display: flex;
            }
            .quesLeft{
                width: 50%;
                padding-top: 20px;
            }
            .quesRight{
                width: 50%;
                padding-top: 20px;
            }

            .quesLeft input, .quesRight input{
                border: none;
                border-bottom: 1px solid black;
                margin-left: 10px;
                width: 90%;
                margin-bottom: 10px;
                height: 40px;
            }
            .quesLeft p, .quesRight p{
                margin-left: 10px;
            }
            .createCourse input{
                padding: 20px 20px;
                background-color: #4255ff;
                color: white;
                border: none;
                border-radius: 8px;
                float: right;
                margin-bottom: 20px;

            }
            .createCourse{

            }
            .addTag{
                /*display: block;*/
                width: 100%;
                height: 80px;
                border: none;
                border-radius: 8px;
                margin-top: 20px;
                margin-bottom: 20px;
                background-color: white;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div class="contentCourse">
            <div class="addCourse">

                <div class="addImg">
                    <form action="QuestionManagerController" method="get">
                        <input type="hidden" name="subjectID" value="${subjectID}">
                        <p>numQues</p>
                        <input type="text" name="numQues">
                        <p>numAns</p>
                        <input type="text" name="numAns">                        
                        <input type="submit" value="Submit">
                    </form>
                </div>
                <div class="addQuiz">
                    <form action="QuestionManagerController" method="post">                        
                        <input type="hidden" name="numQues" value="${cookie.numQues.getValue()}">
                        <input type="hidden" name="subjectID" value="${subjectID}">                       


                        <div id="content">
                            <input type="text" name="ques1"><br>
                            <p>THUẬT NGỮ</p>
                            <div id="addQ">
                            <input type="text" id="id" name="ques1ans1"><br>
                            <input type="text" id="id" name="ques1ans2"><br> 
                            <input type="text" id="id" name="ques1ans3"><br> 
                            <input type="text" id="id" name="ques1ans4"><br>
                            </div>
                            <button type="button" id="demo1">Add Ques</button>
                            <p>ĐỊNH NGHĨA</p>
                        </div>
                        <div>                            
                            <button type="button" id="demo">Change Content</button>
                        </div>



                        
                        <input type="submit" value="Submit">



                    </form>


                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#demo").click(function () {
                    $.ajax({
                        url: "Ajaxdemo",
                        type: 'GET',
                        data: {quesNum: "${cookie.numQues.getValue()}"},
                        success: function (data) {
                            var row = document.getElementById("content");
                            row.innerHTML += data;
                        }
                    });
                });
            });
            $(document).ready(function () {
                $("#demo1").click(function () {
                    $.ajax({
                        url: "Ajaxdemo",
                        type: 'POST',
                        data: {quesNum: "${cookie.numQues.getValue()}"},
                        success: function (data) {
                            var row = document.getElementById("addQ");
                            row.innerHTML += data;
                        }
                    });
                });
            });
        </script>
    </body>
</html>
