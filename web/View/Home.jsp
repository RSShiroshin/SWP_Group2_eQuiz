<%-- 
    Document   : Home
    Created on : Oct 3, 2022, 9:24:41 PM
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
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
        <style>
            .starElement{
                width: 310px;
                height: 200px;
                background-color: white;
                border-radius: 8px;
                margin-left: 60px;
                margin-top: 40px;
                padding-bottom: 50px;
                text-align: center;
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            }

            .list-group{
                display: flex;

            }
            .list-group a{
                text-decoration: none;
                color: black;
                margin-right: 10px;
            }
            .cate {
                padding-left: 60px;
                padding-top: 20px;
            }
            ul li {
                list-style-type: none;
                margin-right: 10px;
                padding: 5px 20px;
                background-color: orange;
                border-radius: 8px;
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            }
            .page ul{
                display: flex;
                justify-content: center;
                margin-top: 40px;

            }
            
            .catename{
                border: 1px solid silver;
                padding: 2px 4px;
                border-radius: 8px;
            }
            .catename:hover{
                background-color: silver;
                color: white;
            }
            body{
                background-color: #f6f7fb;
            }
            .starElement:hover{
                box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
            }
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div class="HomeContent">
            <div style="padding-left: 10%;">
                <div style="display: flex" class="cate col-md-3 mb-5">
                    <h3 style="margin-top: 10px; margin-right: 10px;">Categories: </h3>
                    <ul style="margin-top: 10px;" class="list-group">
                        <c:forEach items="${listCategories}" var="cc">
                            <a class="catename" href="filter-category?categoryId=${cc.categoryID}">${cc.categoryName}</a>
                        </c:forEach>
                    </ul>
                </div>
                <div class="topStar">
                    <h3>List Courses</h3>
                    <div class="star">
                        <c:forEach items="${listCourses}" var="c"> 
                            <div class="starElement">
                                <a style="text-decoration: none; color: black"  href="DetailCourseController?courseID=${c.courseID}">
                                    <img class="" src="Img/courseImg.png" height="100%" width="100%" alt="..." />

                                    <div>
                                        <p style="margin-top: 10px;">${c.courseName}</p>
                                    </div>
                                </a>
                            </div>.


                        </c:forEach>
                    </div>
                </div>

                <!--            <div class="topStar">
                                <h3>Gợi ý</h3>
                                <div class="star">
                <c:forEach begin="1" end="8"> 
                    <div class="starElement">
                        <p></p>
                    </div>
    
                </c:forEach>
            </div>
        </div>-->

                <c:choose>
                    <c:when test="${listCourses==null|| listCourses.size()==0}">
                        <div style="text-align: center"><img src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg//assets/a60759ad1dabe909c46a817ecbf71878.png" alt="alt" height="200px"/></div>
                        <div style="text-align: center; color: rgba(0,0,0,.54)">Hãy thử sử dụng các từ khóa chung hơn</div>
                        <div style="text-align: center">Không tìm thấy kết quả nào</div>
                    </c:when>                         
                    <c:otherwise>
                        <div class="page">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination d-flex justify-content-center">
                                    <c:if test="${page>1}">
                                        <li class="page-item"><a class="page-link" href="home?page=${page-1}">Pre</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${totalPage}" var="i">                                
                                        <li class="page-item ${i==page?"active":""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${page<totalPage}">
                                        <li class="page-item"><a class="page-link" href="home?page=${page+1}">Next</a></li>
                                        </c:if>
                                </ul>
                            </nav>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>


    </body>
</html>
