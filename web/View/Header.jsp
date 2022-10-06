<%-- 
    Document   : Home
    Created on : Oct 3, 2022, 8:18:55 PM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="header">
            <div class="top">
                <img src="Img/logo.png" width="95px" height="55px" alt="Quizlut"/>
                <p>Trang chủ</p>
                <p>Loại Quiz</p>
                <p>Thư viện của bạn</p>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/QuizPracticeBeta/home">Home</a></li>
                <input type="submit" value="Tạo" name="crate" />
                
            </div>
            <div class="topR">
                <input type="search" id="search" placeholder="Tìm kiếm tại đây" name="keyword">
                <img src="Img/avt.png" width="50px" height="50px" alt="Avatar"/>
            </div>
            <div>
            <form action="search" class="d-flex mx-auto">
                    <input class="form-control me-2" 
                           type="search" 
                           placeholder="Tìm kiếm tại đây" 
                           aria-label="Search"
                           name="keyword"
                           />
                    <button type="submit" class="btn btn-secondary">
                        <i class="bi bi-search"></i>
                    </button>
                </form>
            </div>


        </div>


    </body>
</html>
