<%-- 
    Document   : UserManager
    Created on : Oct 5, 2022, 8:38:45 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/profileCss.css" type="text/css" rel="stylesheet"/>
        
        <style>
            .UserManagerList {
                margin-top: 16px;
                
            }
            
            .UserManagerList>table{
                border: 1px solid;       
            }
            td {
                padding: 8px;
                border: 1px solid;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        
        <div class="UserManagerFunction">
            <button>Search:</button> <input type="text" name="searchUserTxt">
            <p>Filter</p>
        </div>
        
        <div class="UserManagerList">
            <h2>UserList</h2>
            <table>
                <tr style="background-color: cornsilk">
                    <td>UserID</td>
                    <td>UserName</td>
                    <td>FullName</td>
                    <td>Email</td>
                    <td>Avatar</td>
                    <td>Description</td>
                    <td>Registed Day</td>
                    <td>Role</td>
                    <td>Status</td>
                </tr>
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <td>${user.getUserID()}</td>
                        <td>${user.getUserName()}</td>
                        <td>${user.getFullName()}</td>
                        <td>${user.getEmail()}</td>
                        <td>${user.getAvatar()}</td>
                        <td>${user.getDescription()}</td>
                        <td>${user.getRegisterDay()}</td>
                        <td><a href="RoleChangeController?userID=${user.getUserID()}&roleID=${user.getRole()}"> ${roleNameList[user.getRole()]} </a> </td>
                        <td><a href="UserStatusChangeController?userID=${user.getUserID()}&status=${user.isStatus()}"> ${user.isStatus()==true?"Active":"Banned"} </a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        
    </body>
</html>
