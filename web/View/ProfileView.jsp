<%-- 
    Document   : Profile
    Created on : Oct 4, 2022, 8:11:58 AM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/profileCss.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div id = "profileContainer" >
            
            <div id = "profileInfo">
                <div id="topProfile">
                    <img src="Img/avt.png" width="70px" height="70px" alt="Avatar"/>
                    <div class="profileName">
                        <h2>${loginUser.getUserName()}</h2>
                        <p>${loginUser.getFullName()}</p>
                    </div>  
                </div>
                <div >Password: ${loginUser.getPassword()}</div>
                <div>Email: ${loginUser.getEmail()}</div>  
                <div>Description: ${loginUser.getDescription()}</div> 
            </div>
            
            <div id="profileFunction" style="margin-top: 20px;">
                <h2>Function</h2>
                <p class = "function">Edit Profile Form (Sau lam pop-up)</p>     
                
                <form action="ChangeProfileController" method="get">
                    <input type="text" name="userID" value="${loginUser.getUserID()}" hidden>
                    UserName: <input type="text" name="userName" value="${loginUser.getUserName()}"></br>
                    Password: <input type="text" name="Password" value="${loginUser.getPassword()}"></br>
                    Full Name: <input type="text" name="fullName" value="${loginUser.getFullName()}"></br>
                    Email: <input type="text" name="email" value="${loginUser.getEmail()}"></br>
                    Description: <input type="text" name="description" value="${loginUser.getDescription()}"></br>
                    <input type="submit" value="Submit Change">
                </form>
            </div>
            
            <div class="profileCourse" style="display: block; margin-top: 16px; border: 1px solid">
                <p>load cac course da dang ky o duoi</p>
            </div>
        </div>
        
    </body>
</html>
