<%-- 
    Document   : SubjectView
    Created on : Oct 11, 2022, 7:45:10 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="QuizGenerateController" method="get">
            <input type="text" name="SubjectID" value="ACC101">
            Number of Question in Quiz: <input type="number" name = "questionNum">
            <input type="submit" value="Let's Quiz">
        </form>
    </body>
</html>
