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

            #addQ input{
                width: 100%;
                height: 50px;
                margin-top: 10px;
                border: none;
                border-bottom: 1px solid black;
                margin-bottom: 10px;
                border-radius: 8px;
            }



            #addQ1 input{
                width: 80%;
                height: 50px;
                margin-top: 10px;
                border: none;
                border-bottom: 1px solid black;
                margin-bottom: 10px;
                border-radius: 8px;

            }

            input:focus{
                outline: none !important;
            }
            #content,#content1 {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
            }

            .addQuiz{
                width: 100%;
            }

            #demo{
                margin-top: 50px;
                margin-bottom: 50px;
            }

            #btnSubmit{
                width: 200px;
                height: 50px;
                border: none;
                background-color: #4255ff;
                color: white;
                border-radius: 8px;
            }
        </style>
    </head>
    <body>
        <%@ include file="../Header.jsp" %>
        <div class="contentCourse">
            <div style="padding-top: 30px;" class="addCourse">
                <div style="padding: 10px 10px; border-radius: 8px; background-color: #4275FC; color: white">
                    <p style="text-transform: uppercase; margin-bottom: 10px;">Sample File for User to Import Question:</p>
                    <a style="color: orange; font-weight: bold" href="Files/demo.txt" download>Download</a>
                </div>
                <div class="addImg">

                    <form action="ImportQuestionController" method="post" enctype="multipart/form-data">
                        <input type="file" name="file">

                        <input type="hidden" name="subjectID" value="SWT301">
                        <input style="padding: 10px 20px; border: none; border-radius: 8px; background-color: #4275FC; color: white" type="submit" value="Upload">

                        <input type="hidden" name="subjectID" value="${subjectID}">
                        <input type="submit" value="Upload">

                    </form>
                </div>
                <div style="text-align: center">
                    <a style="padding: 10px 200px; background-color: #4275FC; color: white; border-radius: 8px;" href="ExportQuestionController?subjectID=${subjectID}">Export</a>
                </div>
                <div class="addQuiz">
                    <form action="QuestionManagerController" method="post">                        
                        <input type="hidden" name="numQues" value="${cookie.numQues.getValue()}">
                        <input type="hidden" name="subjectID" value="${subjectID}">                                                    
                        <div id="content1"></div>
                        <div style="" id="content">
                            <%! int i=1; %> 
                            <c:forEach items="${qlist}" var="q">
                                <div id="addQ1" style="width: 50%;  margin-top: 40px;">
                                    <input type="text" id="q1" name="ques<%out.print(i);%>" placeholder="Câu hỏi" value="${q.content}"><br>
                                    <p>THUẬT NGỮ </p>
                                </div>
                                <div id="addQ2" style="width: 50%;  margin-top: 40px;">
                                    <div id="addQ">
                                        <%! int j=1; %>
                                        <c:forEach items="${alist}" var="a">

                                            <c:if test="${a.questionID==q.questionID}">

                                                <input type="text" id="id1" name="ques<%out.print(i);%>ans<%out.print(j++);%>" placeholder="Đáp án A" value="${a.content}" ><br>
                                            </c:if>
                                        </c:forEach>
                                        <input type="hidden" name="numAnsQues<%out.print(i);%>" value="<%out.print(j);%>">
                                        <% j=1; %>
                                        <% i++; %>
                                    </div>
                                    <!--<button type="button" id="demo1">Add Ques</button>-->
                                    <p>ĐỊNH NGHĨA</p>
                                </div>

                            </c:forEach>
                        </div>

                        <div>                            
                            <button style="width: 100%; height: 80px;
                                    background-color: white; border: 1px dotted black;
                                    border-radius: 8px; cursor: pointer;
                                    font-size: 50px; font-weight: 100" onclick="addMore()" type="button" id="demo">+</button>
                        </div>
                        <input id="btnSubmit" type="submit" value="Submit">
                    </form>





                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>


                                        function addMore() {

                                            var q = document.getElementById("q1").value;
                                            var a1 = document.getElementById("id1").value;
                                            var a2 = document.getElementById("id2").value;
                                            var a3 = document.getElementById("id3").value;
                                            var a4 = document.getElementById("id4").value;
                                            $.ajax({
                                                url: "Ajaxdemo",
                                                type: "get", //send it through get method
                                                data: {quesNum: "${cookie.numQues.getValue()}",
                                                    q1: q,
                                                    a1: a1,
                                                    a2: a2,
                                                    a3: a3,
                                                    a4: a4
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content1");
                                                    row.innerHTML += data;
                                                    document.getElementById("q1").value = "";
                                                    document.getElementById("id1").value = "";
                                                    document.getElementById("id2").value = "";
                                                    document.getElementById("id3").value = "";
                                                    document.getElementById("id4").value = "";
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }


        </script>


    </body>
</html>
