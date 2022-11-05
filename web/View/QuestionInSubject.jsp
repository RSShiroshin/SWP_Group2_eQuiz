<%-- 
    Document   : SubjectDetail
    Created on : Oct 20, 2022, 9:03:32 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            body{
                background-color: #f6f7fb;
                /*                background-color: #00ff33;*/
            }
            .adminTable{
                padding-top: 50px;
                margin-left: 15%;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <c:if test="${!empty listQuizTaken}">
        <div style="margin-left: 15%;margin-right: 15%; margin-top: 50px;" class="quizTaken">
            <h2 style="margin-left: 15px; margin-bottom: 20px;">Lịch sử kiểm tra</h2>
            <!--Your quiz in this subject <br>--> 
            <table style="width: 120%;" >
                <tr>
                    <td style="border: 1px solid;border-radius: 8px;padding: 10px 20px; background-color: #4255ff; color: white ">Time Start</td>
                    <td style="border: 1px solid; border-radius: 8px;padding: 10px 20px; background-color: #4255ff; color: white">Score</td>
                </tr>
                
                    <c:forEach begin="1" end="12" step="1" items="${listQuizTaken}" var="quiz">
                        <c:if test="${quiz.getSubjectID() == sid}">
                            <tr>
                                <td class="${quiz.getQuizID()}" style="border: 1px solid; height: 40px;border-radius: 8px;padding: 0 20px;">${quiz.getTimeStart()}</td>
                                <td class="${quiz.getQuizID()}" style="border: 1px solid;border-radius: 8px;padding: 0 20px;">${quiz.getScore()}</td>
                                <td><a style="border: none; padding: 10px 30px; background-color: #4255ff; color: white;
                                       border-radius: 8px;"
                                       onMouseOver="this.style.backgroundColor = '#427EFB'"
                                       onMouseOut="this.style.backgroundColor = '#4255ff'"
                                       href="QuizViewScoreController?quizReviewID=${quiz.getQuizID()}">VIEW</a></td>
                            </tr>
                        </c:if>
                    </c:forEach>
                
            </table>
        </div>
        </c:if>
        <div class="adminTable">
            <!--            <table>
                            <tr>
                                <th>Question ID</th>
                                <th>Content</th>                   
                                <th>Explain</th>
                                <th>Subject Name</th>
                            </tr>-->

            <h2 style="margin-left: 15px; margin-bottom: 20px;">Học phần</h2>
            <c:if test="${sessionScope.userLogin == null}">
                <c:forEach items="${listQuestion}" begin="0" end="19" var="q">
                    <c:if test="${q.subjectID==sid}">
                        <div  style="width: 80%; height: fit-content; background-color: white; margin-bottom: 50px;
                              padding: 20px 20px; border-radius: 8px; display: flex;
                              box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 0px 1px;">
                            <div style="width: 40%; border-right: 1px solid #939bb4; margin-right: 10px;" class="quesSub">
                                <c:set var="str1" value="${q.content}"/>  
                                <c:set var="str2" value="${fn:split(str1, '/')}" />  
                                <c:if test="${not empty str2}">
                                    <c:forEach items="${str2}" var="s">
                                        <p>${s}</p>

                                    </c:forEach>
                                </c:if>
                                <div style="margin-top: 20px;">
                                    <c:forEach items="${listAns}" var="a">
                                        <c:if test="${a.getQuestionID() == q.getQuestionID()}">
                                            <p>${a.getContent()}</p>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div style="width: 40%">
                                <c:forEach items="${listAns}" var="a">
                                    <c:if test="${a.getQuestionID() == q.getQuestionID()}">
                                        <c:if test="${a.isAnswer() ne false}">
                                            <p style="margin-left: 10px;">${a.getContent()}</p>
                                        </c:if>
                                    </c:if>
                                </c:forEach>

                            </div>
                        </div>
                        <!--lam hien cau hoi-->
                    </c:if>
                </c:forEach>

            </c:if>
            <c:if test="${sessionScope.userLogin != null}">
                <c:forEach items="${listQuestion}" var="q">
                    <c:if test="${q.subjectID==sid}">
                        <div  style="width: 80%; height: fit-content; background-color: white; margin-bottom: 50px;
                              padding: 20px 20px; border-radius: 8px; display: flex;
                              box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 0px 1px;">
                            <div style="width: 40%; border-right: 1px solid #939bb4; margin-right: 10px;" class="quesSub">
                                <c:set var="str1" value="${q.content}"/>  
                                <c:set var="str2" value="${fn:split(str1, '/')}" />  
                                <c:if test="${not empty str2}">
                                    <c:forEach items="${str2}" var="s">
                                        <p>${s}</p>

                                    </c:forEach>
                                </c:if>
                                <div style="margin-top: 20px;">
                                    <c:forEach items="${listAns}" var="a">
                                        <c:if test="${a.getQuestionID() == q.getQuestionID()}">
                                            <p>${a.getContent()}</p>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div style="width: 40%">
                                <c:forEach items="${listAns}" var="a">
                                    <c:if test="${a.getQuestionID() == q.getQuestionID()}">
                                        <c:if test="${a.isAnswer() ne false}">
                                            <p style="margin-left: 10px;">${a.getContent()}</p>
                                        </c:if>
                                    </c:if>
                                </c:forEach>

                            </div>
                        </div>
                        <!--lam hien cau hoi-->
                    </c:if>

                </c:forEach>
            </c:if>
            <!--</table>-->
            <c:if test="${sessionScope.userLogin == null}">
                <div style="margin-top: 60px; text-align: center">                            
                    <a style="background-color: greenyellow; border: none; padding: 20px 40px; color: darkblue;font-size: large; font-weight: 600;
                       border-radius: 8px; margin-left: 0;
                       cursor: pointer;" href="EnrollCourse?cid=${cId}">ENROLL NOW!</a>
                </div>
            </c:if>
        </div>
    </body>
</html>
