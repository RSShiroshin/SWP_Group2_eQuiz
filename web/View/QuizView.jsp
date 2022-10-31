<%-- 
    Document   : QuizView
    Created on : Oct 11, 2022, 7:45:32 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            input[type="radio"] {
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
            /*            input[type="radio"]:checked + label {
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
                        }
                        input[type="radio"]#control_05:checked + label {
                            background: red;
                            border-color: red;
                        }*/
            p {
                font-weight: 900;
            }
            /*end*/

        </style>
    </head>
    <body>
        <%@ include file="HeaderQuiz.jsp" %>
        <div id="contentQuiz">


            <div class="Quiz">
                <form action="QuizReviewController" method="post">
                    <c:forEach items="${quizQuestion}" var="question">
                        <span>
                            <div class="QuizQuestion">
                                <p style="padding-top: 20px; font-size: 20px;font-weight: 300; text-align: left; margin-left: 50px; opacity: 0.8">Câu hỏi</p>
                                <p style="margin-bottom: 50px; padding-top: 20px; font-size: 24px; margin-left: 50px; margin-right: 50px;
                                   font-weight: 400;text-align: justify">${question.getContent()}</p>
                                <p style="margin-bottom: 20px;padding-top: 20px; font-size: 20px; text-align: left; margin-left: 50px;
                                   font-weight: 300;opacity: 0.8">Chọn đáp án đúng</p>
                                <div style="text-align: left; display: flex;">
                                    <div style="margin-left: 50px; display: flex; flex-wrap: wrap;" class="radio-toolbar">
                                        <c:forEach items="${quizAnswer}" var="answer">
                                            <c:if test="${question.getQuestionID() == answer.getQuestionID()}">
                                                <!--code-->
                                                <!--<div>-->

                                                <input type="radio" id="answer${answer.getQuestionID()}" name="answer${answer.getQuestionID()}" />


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
        </div>


        <script>
            function checkAns(e) {
                var x = document.getElementById(e);
                x.check = 'click';
            }
        </script>
    </body>
</html>
