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
                     <a style="color: black;" href="../View/register.jsp">Sign up</a>
                    <a style="color: #939bb4" href="login">Log in</a>
                </div>
                <form action="#" method="post">
                    <div class="infoUser">
                        <input type="text" name="user" placeholder="Nhập tên đăng nhập của bạn">
                        <input type="text" name="email" placeholder="Nhập địa chỉ email của bạn">
                        <input type="password" name="pass" placeholder="Nhập mật khẩu">
                        <input type="password" name="repass" placeholder="Nhập lại mật khẩu">
                        <input type="text" name="fullname" placeholder="Nhập tên đầy đủ của bạn">
                         <input type="submit" value="Đăng ký">

                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
