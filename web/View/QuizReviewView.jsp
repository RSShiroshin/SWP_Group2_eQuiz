<%-- 
    Document   : QuizReviewView
    Created on : Oct 11, 2022, 10:00:06 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .Quiz {
                /*border: 1px solid;*/
                width: 70%;
                display: inline-block;
                margin: 50px 15% 50px 15%;
            }
            
            .QuizQuestion {
                margin: 8px 8px 40px 8px;
                /*border: 1px solid;*/
                background-color: white;
                border-radius: 8px;
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
                padding: 20px 20px;
                
            }
            
            .correct {
                background-color: #00ff33;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                
            }
            .false {
                background-color: #ff6666;
            }
            body{
                 background-color: #f6f7fb;
            }
        </style>
    </head>
    <body>
        <!--<h1>${quizReviewID}</h1>-->
        <div class="Quiz">
                <!--<input type = "text" name="quizID" value="${quizID}">-->
                <c:forEach items="${check}" var="question">
                    <div class="QuizQuestion">
                        <h3 style="margin-bottom: 30px;">${question.getQuestion().getContent()}</h3>  
                        <c:if test="${question.isIsCorrect() == true}"> <p style="padding: 5px 10px; border-radius: 8px;box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;" class="correct">CORRECT</p> </c:if>
                        <c:if test="${question.isIsCorrect() == false}"> <p style="padding: 5px 10px; border-radius: 8px;box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;" class="false">FALSE</p> </c:if>
                        
                        <c:forEach items="${quizAnswer}" var="answer">
                            <c:if test="${question.getQuestion().getQuestionID() == answer.getQuestionID()}">
                                
                                <p style="padding: 5px 10px; border-radius: 8px;" <c:if test="${answer.isAnswer() == true}">class = "correct"</c:if>>${answer.getContent()}</p> 
                                
                            </c:if>
                        </c:forEach>
                    </div>           
                </c:forEach>    
        </div>
                <div style=" margin-bottom: 50px; margin-left: 45%">
                    <p style="text-decoration: none; color: white; padding: 20px 50px; background-color: #4255ff;
                       border-radius: 8px; font-size: large; width: 50px; cursor: pointer"  onclick="history.back()">Finish</p>
                </div>
    </body>
</html>
