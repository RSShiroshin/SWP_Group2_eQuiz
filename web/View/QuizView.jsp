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
            .Quiz {
                border: 1px solid;
                width: 50%;
                display: inline-block;
            }
            
            .QuizQuestion {
                margin: 8px;
                border: 1px solid;
            }
        </style>
    </head>
    <body>
        <div class="Quiz">
            <form action="QuizReviewController" method="post">
                <c:forEach items="${quizQuestion}" var="question">
                    <div class="QuizQuestion">
                        <p>${question.getContent()}</p>
                        <input type="text" name="question${question.getQuestionID()}" value="${question.getQuestionID()}"> </br>
                        <c:forEach items="${quizAnswer}" var="answer">
                            <c:if test="${question.getQuestionID() == answer.getQuestionID()}">
                                <input type="radio" name="answer${answer.getQuestionID()}" value="${answer.getAnswerID()}">${answer.getContent()} </br>    
                            </c:if>
                        </c:forEach>
                    </div>           
                </c:forEach>
                
                <input type="submit" value="SUBMIT">
            </form>
            
            
        </div>
    </body>
</html>
