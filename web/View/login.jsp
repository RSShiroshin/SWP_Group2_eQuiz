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
        <style>
            .infoUser .sendR{
                display: flex;
                border: 1px black solid;
                width: 500px;
                padding: 10px 0;
                margin: 30px 0 0 0;
                border-radius: 5px;
                justify-content: center;
            }
            .infoUser p{
                margin-top: 10px;
                font-size: 14px;
                font-weight: initial;
                color: #939bb4;
            }
            a{
                text-decoration: none;
                margin-left: 5px;
                margin-top: 10px;
            }
            .infoUser input:focus{
                border: 2px orange solid;
                outline: none;
                border-radius: 5px;
            }


        </style>
    </head>
    <body>
        <div class="contentLogin">
            <div class="left">

            </div>
            <div class="right">
                <div class="nameTitle">
                    <a style="color: #939bb4;" href="#">Đăng ký</a>
                    <a style="color: black" href="#">Đăng nhập</a>
                </div>
                <form action="#" method="post">
                    <div class="infoUser">
                        <input type="text" name="id" placeholder="Nhập địa chỉ email hoặc tên người dùng của bạn">
                        <input type="password" name="pass" placeholder="Nhập mật khẩu">
                        <button type="button">Log in</button>
                        <div class="sendR">
                            <p>Bạn chưa có tài khoản?</p>
                            <a href="#">Đăng ký</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
