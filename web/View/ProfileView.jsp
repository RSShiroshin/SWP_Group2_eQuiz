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
        <style>
            #profileContainer{
                margin-left: 10%;
                margin-right: 10%;
            }

            /*//pupup*/
            .open-button {
                background-color: #555;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                opacity: 0.8;
                /*position: fixed;*/
                top: 40%;
                left: 10%;
                width: 280px;
                border-radius: 8px;
                margin-top: 20px;
            }
            /* The popup form - hidden by default */
            .form-popup {
                display: none;
                position: fixed;
                top: 100px;
                left: 20%;
                border: 3px solid #f1f1f1;
                /*z-index: 9;*/
                border-radius: 8px;
                box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;
            }

            /* Add styles to the form container */
            .form-container {
                width: 800px;
                padding: 10px;
                background-color: white;
            }

            /* Full-width input fields */
            .form-container input[type=text], .form-container input[type=password] {
                width: 90%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
            }

            /* When the inputs get focus, do something */
            .form-container input[type=text]:focus, .form-container input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

            /* Set a style for the submit/login button */
            .form-container .btn {
                background-color: #04AA6D;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 100%;
                margin-bottom:10px;
                opacity: 0.8;
            }

            /* Add a red background color to the cancel button */
            .form-container .cancel {
                background-color: red;
            }

            /* Add some hover effects to buttons */
            .form-container .btn:hover, .open-button:hover {
                opacity: 1;
            }

            .infor div{
                margin-top: 10px;
            }
            .infor div p{
                font-size: large;
                font-weight: bold;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div id = "profileContainer" >

            <div id = "profileInfo">
                <div style="border-bottom: 1px solid black; padding-bottom: 20px;" id="topProfile">
                    <img src="Img/avt.png" width="70px" height="70px" alt="Avatar"/>
                    <div class="profileName">
                        <h2>${loginUser.getUserName()}</h2>
                        <p>${loginUser.getFullName()}</p>
                    </div>  
                </div>
                <div class="infor" style="margin-top: 50px">
                    <div style="display: flex;"><p>Password: </p> **********</div>
                    <div style="display: flex;"><p>Email: </p> ${loginUser.getEmail()}</div>
                    <div style="display: flex;"><p>Description: </p> ${loginUser.getDescription()}</div> 
                </div>
            </div>

            <!--//pup up-->
            <button class="open-button" onclick="openForm()">Edit Profile</button>
            <div class="form-popup" id="myForm">
                <form action="ChangeProfileController" method="get" class="form-container">
                    <input type="text" name="userID" value="${loginUser.getUserID()}" hidden>
                    <p>Password:</p> <input type="text" name="Password" value="${loginUser.getPassword()}"></br>
                    <p>Confirm Password:</p> <input type="text" name="Password" value="${loginUser.getPassword()}"></br>
                    <p>Full Name:</p> <input type="text" name="fullName" value="${loginUser.getFullName()}"></br>
                    <p>Email:</p> <input type="text" name="email" value="${loginUser.getEmail()}"></br>
                    <p>Description:</p> <input type="text" name="description" value="${loginUser.getDescription()}"></br>
                    <input type="submit" class="btn" value="Submit Change">
                    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                </form>
            </div><!-- comment -->
        </div>

        <script>
            function openForm() {
                document.getElementById("myForm").style.display = "block";
            }

            function closeForm() {
                document.getElementById("myForm").style.display = "none";
            }
        </script>
    </body>
</html>
