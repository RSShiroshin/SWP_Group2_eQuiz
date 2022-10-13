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
                border: 1px solid;
                width: 50%;
                display: inline-block;
            }
            
            .QuizQuestion {
                margin: 8px;
                border: 1px solid;
            }
            
            .correct {
                background-color: #00ff33;
            }
            .false {
                background-color: #ff6666;
            }
        </style>
    </head>
    <body>
        <h1>${quizReviewID}</h1>
        <div class="Quiz">
                <input type = "text" name="quizID" value="${quizID}">
                <c:forEach items="${check}" var="question">
                    <div class="QuizQuestion">
                        <p>${question.getQuestion().getContent()}</p>  
                        <c:if test="${question.isIsCorrect() == true}"> <p class="correct">CORRECT</p> </c:if>
                        <c:if test="${question.isIsCorrect() == false}"> <p class="false">FALSE</p> </c:if>
                        
                        <c:forEach items="${quizAnswer}" var="answer">
                            <c:if test="${question.getQuestion().getQuestionID() == answer.getQuestionID()}">
                                
                                    <p <c:if test="${answer.isAnswer() == true}">class = "correct"</c:if>>${answer.getContent()}</p> 
                                
                            </c:if>
                        </c:forEach>
                    </div>           
                </c:forEach>    

        </div>
    </body>
</html>
