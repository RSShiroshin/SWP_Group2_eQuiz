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
                height: 156px;
                background-color: white;
                border-radius: 8px;
                margin-left: 60px;
                margin-top: 40px;
                padding-bottom: 50px;
                text-align: center;
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
        </style>
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div class="HomeContent">
            <div style="padding-left: 10%;">
                <div class="cate col-md-3 mb-5">
                    <h3>Course Categories</h3>
                    <ul class="list-group">
                        <c:forEach items="${listCategories}" var="cc">
                            <a href="filter-category?categoryId=${cc.categoryID}">${cc.categoryName}</a>
                        </c:forEach>
                    </ul>
                </div>
                <div class="topStar">
                    <h3>List Courses</h3>
                    <div class="star">
                        <c:forEach items="${listCourses}" var="c"> 
                            <div class="starElement">
                                <a style="text-decoration: none; color: black"  href="DetailCourseController?courseID=${c.courseID}">
                                    <img class="" src="https://www.studytienganh.vn/upload/2021/06/106293.jpg" height="100%" width="100%" alt="..." />

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
                        <nav aria-label="Page navigation example">
                            <ul class="pagination d-flex justify-content-center">
                                <c:if test="${page>1}">
                                    <li class="page-item"><a class="page-link" href="home?page=${page-1}"><</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${totalPage}" var="i">                                
                                    <li class="page-item ${i==page?"active":""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${page<totalPage}">
                                    <li class="page-item"><a class="page-link" href="home?page=${page+1}">></a></li>
                                    </c:if>
                            </ul>
                        </nav>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>


    </body>
</html>
