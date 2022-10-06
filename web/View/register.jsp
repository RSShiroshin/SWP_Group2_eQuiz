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
        <link href="css/profileCss.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="contentLogin">
            <div class="left">

            </div>
            <div class="right">
                <div class="nameTitle">
                    <a style="color: black;" href="#">Đăng ký</a>
                    <a style="color: #939bb4" href="#">Đăng nhập</a>
                </div>
                <form action="#" method="post">
                    <div class="infoUserR">
                        <p>TÊN</p>
                        <input type="text" name="user" placeholder="Nhập tên của bạn">
                        <p>TÊN ĐĂNG NHẬP</p>
                        <input type="text" name="name" placeholder="Nhập của bạn">
                        <p>EMAIL</p>
                        <input type="text" name="id" placeholder="Nhập địa chỉ email của bạn">
                        <p>MẬT KHẨU</p>
                        <input type="password" name="pass" placeholder="Nhập mật khẩu">
                        <p>XÁC NHẬN MẬT KHẨU</p>
                        <input type="password" name="repass" placeholder="Nhập lại mật khẩu">
                        <button type="button">Đăng ký</button>
                        <div class="sendLogin">
                            <p>Bạn đã có tài khoản?</p>
                            <a href="#">Đăng nhập</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
