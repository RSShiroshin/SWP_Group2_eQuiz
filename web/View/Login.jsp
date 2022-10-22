<%-- 
    Document   : login
    Created on : Oct 4, 2022, 8:30:58 AM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="${pageContext.request.contextPath}/css/profileCss.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="contentLogin">
            <div class="left">
                
            </div>
            <div class="right">
                <div class="nameTitle">
                      <a style="color: black;" href="${pageContext.request.contextPath}/View/register.jsp">Sign up</a>
                    <a style="color: #939bb4" href="${pageContext.request.contextPath}/View/Login.jsp">Log in</a>
                </div>
                <form action="login" method="post">
                    <div class="infoUser">
                        <p style="color: red; background-color: #fcd3d3; width: fit-content">${message}</p>
                        <input type="text" name="id" placeholder="Nhập địa chỉ email hoặc tên người dùng của bạn">
                        <input type="password" name="pass" placeholder="Nhập mật khẩu">
                        <input type="submit" value="Log In">

                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
