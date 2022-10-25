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
                width: 60%;
                display: inline-block;
                padding-bottom: 50px;
                padding-top: 50px;
            }

            .QuizQuestion {
                margin: 8px;
                background-color: white;
                margin-bottom: 30px;
                border-radius: 8px;
                box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px;
                padding: 10px 20px;
            }
            body{
                text-align: center;
            }
            #contentQuiz{
                background-color: #f6f7fb;
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
                background-color: #ddd;
                padding: 10px 20px;
                font-family: sans-serif, Arial;
                font-size: 16px;
                border: 2px solid #444;
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
                border: 2px solid hsla(150, 75%, 50%, 1);
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
                    border: 2px solid hsla(150, 75%, 45%, 1);
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
            }
            p {
                font-weight: 900;
            }
            /*end*/
        </style>
    </head>
    <body>
        <div id="contentQuiz">
            <div class="Quiz">
                <form action="QuizReviewController" method="post">
                    <span>
                        <c:forEach items="${quizQuestion}" var="question">
                            <div class="QuizQuestion">
                                <p style="margin-bottom: 50px; padding-top: 20px;">${question.getContent()}</p>
                                <div style="text-align: left; display: flex;">
                                    <c:forEach items="${quizAnswer}" var="answer">
                                        <c:if test="${question.getQuestionID() == answer.getQuestionID()}">
                                            <div style="width: 50%" class="radio-toolbar">
                                                <!--code-->
                                                <div>
                                                    <input type="radio" id="control_01" name="answer${answer.getQuestionID()}" value="${answer.getAnswerID()}">
                                                    <label for="control_01">
                                                        <p>${answer.getContent()}</p>
                                                    </label>
                                                </div>
                                                <!--end-->
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>           
                        </span>
                    </c:forEach>

                    <input style="border:none; padding: 20px 80px; background-color: #4255ff; color: white;
                           border-radius: 8px; font-size: 15px; cursor: pointer;" type="submit" value="Kiểm Tra">
                </form>



            </div>
        </div>

<!--        code
        <div>
            <input type="radio" id="control_01" name="select" value="1">
            <label for="control_01">
                <h2>Pfft</h2>
                <p>Awww, poor baby. Too afraid of the scary game sprites? I laugh at you.</p>
            </label>
        </div>
        <div>
            <input type="radio" id="control_02" name="select" value="2">
            <label for="control_02">
                <h2>Wannabe</h2>
                <p>You're not a gaming God by any stretch of the imagination.</p>
            </label>
        </div>
        <div>
            <input type="radio" id="control_03" name="select" value="3">
            <label for="control_03">
                <h2>Daaamn</h2>
                <p>Now we're talking. It's gettin' a bit hairy out there in game land.</p>
            </label>
        </div>
        <div>
            <input type="radio" id="control_04" name="select" value="4" disabled>
            <label for="control_04">
                <h2>Mental</h2>
                <p>Prepare for glory! This is going to be one hell of a no-holds-barred ride.</p>
            </label>
        </div>
        <div>
            <input type="radio" id="control_05" name="select" value="5">
            <label for="control_05">
                <h2>Suicidal</h2>
                <p>You will not live. Strap in and write a heart-felt letter to your loved ones.</p>
            </label>
        </div>
        end-->
    </body>
</html>
