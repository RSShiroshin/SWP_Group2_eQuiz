<%-- 
    Document   : courseDetail
    Created on : Oct 4, 2022, 8:28:25 AM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/courseDetail.css" type="text/css" rel="stylesheet"/>
        <style>

        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>

        <div style="padding-left: 50px; padding-top: 50px">
        <div class=""><img class="" src="https://www.studytienganh.vn/upload/2021/06/106293.jpg" height="300px" alt="..." /></div>
        <div class="">

            <h1 class="">Course Name: ${listCourses.courseName}</h1>
            <div class="">Course ID: ${listCourses.courseID}</div>
            </br>
            <p class="">Detail Description: This Specialization covers how to write syntactically correct HTML5 and CSS3, and how to create interactive web experiences with JavaScript. Mastering this range of technologies will allow you to develop high quality web sites that, work seamlessly on mobile, tablet, and large screen browsers accessible. During the capstone you will develop a professional-quality web portfolio demonstrating your growth as a web developer and your knowledge of accessible web design. This will include your ability to design and implement a responsive site that utilizes tools to create a site that is accessible to a wide audience, including those with visual, audial, physical, and cognitive impairments.</p>
            <div class="">                          
                </br>
                <input type="submit" value="Learn now!" />
            </div>
        </div>
        </div>


    </body>
</html>
