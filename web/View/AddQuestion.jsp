<%-- 
    Document   : AddCourse
    Created on : Oct 6, 2022, 2:20:13 PM
    Author     : ducda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Học phần của bạn | Quizlut</title>
        <link rel="shortcut icon" href="Img/icon.png"/>
        <link href="css/adminCss.css" type="text/css" rel="stylesheet"/>
        <style>
            .infoUserR input{
                width: 100%;
                height: 50px;
                margin-top: 5px;
                padding-left: 10px;
                border: 2px black solid;
                border-radius: 5px;
            }
            .infoUserR input:focus{
                border: 2px orange solid;
                outline: none;
            }

            .infoUserR p{
                margin-top: 15px;
                font-size: 14px;
                font-weight: initial;
                color: #939bb4;
            }

            a{
                text-decoration: none;
                margin-left: 5px;
                margin-top: 15px;
            }
            .contentCourse{
                background-color: #f6f7fb;
                height: fit-content;    
            }
            .addCourse{
                margin-left: 20%;
                margin-right: 20%;
            }

            .addImg{
                text-align: center;
                background-color: white;
                margin-top: 20px;
                margin-bottom: 20px;
                height: fit-content;
                padding: 20px 0;
                width: 100%;
                border-radius: 10px;
                border: 1px black dashed;
            }
            .question{
                height: 200px;
                background-color: white;
                margin-top: 10px;
                display: flex;
            }
            .quesLeft{
                width: 50%;
                padding-top: 20px;
            }
            .quesRight{
                width: 50%;
                padding-top: 20px;
            }

            .quesLeft input, .quesRight input{
                border: none;
                border-bottom: 1px solid black;
                margin-left: 10px;
                width: 90%;
                margin-bottom: 10px;
                height: 40px;
            }
            .quesLeft p, .quesRight p{
                margin-left: 10px;
            }
            .createCourse input{
                padding: 20px 20px;
                background-color: #4255ff;
                color: white;
                border: none;
                border-radius: 8px;
                float: right;
                margin-bottom: 20px;
                
            }
            .createCourse{
                
            }
            .addTag{
                /*display: block;*/
                width: 100%;
                height: 80px;
                border: none;
                border-radius: 8px;
                margin-top: 20px;
                margin-bottom: 20px;
                background-color: white;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div class="contentCourse">
            <div class="addCourse">
                <p style="font-size: larger; padding-top: 20px;">Tạo học phần mới</p>
                <form action="#" method="post">
                    <div class="infoUserR">
                        <input type="text" name="user" placeholder="Nhập tiêu đề">
                        <p>TIÊU ĐỀ</p>
                        <input type="text" name="name" placeholder="Thêm mô tả">
                        <p>MÔ TẢ</p>
                    </div>
                </form>..
                <div class="addImg">
                    <h2>Thêm hình ảnh</h2>
                    <input type="file" id="id" accept="image/png,image/jpeg">
                </div>
                <div class="addQuiz">
                    <form action="#">
                        <c:forEach begin="1" end="10">
                            <div class="question">
                                <div class="quesLeft">
                                    <p>1</p>
                                    <input type="text" id="id">
                                    <p>THUẬT NGỮ</p>
                                </div>
                                <div class="quesRight">
                                    <p>xoá</p>
                                    <input type="text" id="id">
                                    <p>ĐỊNH NGHĨA</p>
                                </div>
                            </div>
                        </c:forEach>
                        <input type="button" value="+THÊM THẺ" class="addTag">
                        <div class="createCourse">
                            <input type="button" value="TẠO" >
                        </div>
                    </form>


                </div>
            </div>
        </div>

    </body>
</html>
