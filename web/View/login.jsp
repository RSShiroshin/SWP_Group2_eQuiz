<%-- 
    Document   : login
    Created on : Oct 4, 2022, 8:30:58 AM
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
        <div class="contentLogin">
            <div class="left">

            </div>
            <div class="right">
                <div class="nameTitle">
                    <a href="#">Đăng nhập</a>
                    <a href="#">Đăng ký</a>
                </div>
                <form action="#" method="post">
                    <div class="infoUser">
                        <input type="text" name="id" placeholder="Nhập địa chỉ email hoặc tên người dùng của bạn">
                        <input type="password" name="pass" placeholder="Nhập mật khẩu">
                        <input style="background-color: appworkspace" type="submit" value="Đăng ký">
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
