<%-- 
    Document   : CourseManager
    Created on : Oct 13, 2022, 8:05:01 AM
    Author     : DELL
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
            body{
                background-color: #f6f7fb;
            }
            th, td {
                border: 1px solid #4255ff;
                border-radius: 8px;
            }
            .clear {
                clear: both;
            }

            .text-white { /*thay thành chữ trắng*/
                color: #fff !important;
            }

            .text-center {
                text-align: center;
            }

            .pull-right {
                float: right !important;
            }

            .btn {
                color: white;
                background-color: #4255ff;
                text-decoration: none;
                padding: 11px 16px;
                display: inline-block;
                margin-top: 16px;
                border: none;
                appearance: none;
                -webkit-appearance: none;
            }

            .btn:hover {
                color: white;
                background-color: #4275FC;
                cursor: pointer;
            }

            .row {
                margin-left: -8px;
                margin-right: -8px;
            }

            /* thêm element giả (thẻ div) sau thẻ row */
            .row::after {
                content: "";
                display: block;
                clear: both;
            }

            .col {
                float: left;
                padding-left: 8px;
                padding-right: 8px;
            }

            .col_2_3{
                width: 200px;
                height: 300px;
            }

            .col-fouth {
                width: calc(100% /4);
            }

            .col-third {
                width: calc(100% /3);
            }

            .col-half {
                width: calc(100% /2);
            }

            .col-full {
                width: 100%;
            }

            .mt-8 {
                margin-top: 8px !important;
            }

            .m-8 {
                margin: 8px !important;
            }

            .mt-16 {
                margin-top: 16px !important;
            }

            .mt-32 {
                margin-top: 32px !important;
            }
            .contactForm {
                display: none;
                position: fixed;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                background-color: rgba(0, 0, 0, 0.4);
                align-items: center;
                justify-content: center;
            }

            .contactForm.open {
                display: flex;
            }

            .contactFormClose{
                display: inline-block;
                font-size: 30px;
                width: 30px;
                height: 30px;
            }

            .contactFormClose:hover {
                background: red;
                color: white;
                cursor: pointer;
            }

            .inner_contact_form {
                display: flex;
                background: white;
                width: 60%;
                height: 70%;
            }

            .pic {
                display: inline-block;
                width: 40%;
            }
            .pic img{
                width: -webkit-fill-available;
                height: -webkit-fill-available;
            }

            .form {
                display: inline-block;
            }
            .form-group{
                display: flex;
                margin-bottom: 20px;
            }
            .form-control{
                height: 30px;
                margin-left: 30px;
                width: 500px;
                padding: 5px 10px;
            }
            .courseTxt{
                width: 50%;
                margin-left: 5%;
            }
        </style>
    </head>
    <body>
        <%@ include file="../Header.jsp" %>
        <div class="adminTable">
            <form id="form1" action="CourseManagerController" method="get">
                <table>
                    <tr>
                        <th>Course ID</th>
                        <th>Course name</th>
                        <th>Description</th>
                        <th>CategoryName</th>
                        <th>Thumbnail</th>
                        <th>Detail</th>
                        <th>Update</th>
                        <th>Delete</th>                    
                    </tr>
                    <input type="text" name = "type" value="2" hidden>
                    <c:forEach items="${clist}" var="c">
                        <tr>
                            <td><p style="border: none;" type="text">${c.courseID}</p>
                                <input type="text" name = "${c.courseID}" value="${c.courseID}" class="${c.courseID}"  disabled="" hidden>
                            </td>
                            <td><input style="height: 100%; width: 100%; padding: 10px; border: none; background-color: #f6f7fb;
                                       font-size: 15px; outline: none;
                                       border-radius: 8px;" type="text" class="${c.courseID}" value="${c.courseName}" disabled="" name="${c.courseID}0"></td>
                            <td><input style="height: 100%; width: 100%; padding: 10px; border: none; background-color: #f6f7fb;
                                       font-size: 15px; outline: none;
                                       border-radius: 8px;" type="text" class="${c.courseID}" value="${c.description}" name="${c.courseID}1" disabled=""></td>
                            <td><select class="${c.courseID}" style="border: none;
                                        width: 100%; padding: 10px 0; background-color: #f6f7fb; outline: none;
                                        border-radius: 8px;" class="form-select" aria-label="Default select example" name="${c.courseID}2" disabled>
                                    <c:forEach items="${cclist}" var="o">
                                        <c:if test="${c.categoryID==o.categoryID}">
                                            <option value="${o.categoryID}" selected>${o.categoryName}</option>
                                        </c:if>
                                        <option value="${o.categoryID}">${o.categoryName}</option>
                                    </c:forEach>
                                </select>

                            <td><input style="height: 100%; width: 100%; padding: 10px; border: none; background-color: #f6f7fb;
                                       font-size: 15px; outline: none;
                                       border-radius: 8px;" type="text" class="${c.courseID}" value="${c.thumbnail}" name="${c.courseID}3" disabled=""></td>    
                            <td><input style="width: 100%; padding: 10px 0; border: none; outline: none;
                                       background-color: #4255ff; border-radius: 8px; cursor: pointer; color: #fff" type="button" value="Detail" onclick="location.href = 'SubjectManagerController?courseID=${c.courseID}'"></td>
                            <td style=""><input style="width: 100%; padding: 10px 0; border: none; outline: none;
                                                background-color: #4255ff; border-radius: 8px; cursor: pointer; color: #fff" onclick="update('${c.courseID}')" type="button" value="Update"></td>                        
                            <td style=""><input style="width: 100%; padding: 10px 0; border: none; outline: none;
                                                background-color: #4255ff; border-radius: 8px; cursor: pointer; color: #fff" type="button" value="Delete" onclick="location.href = 'CourseManagerController?type=1&courseID=${c.courseID}';"></td>                        
                        </tr>
                    </c:forEach>

                </table>
            </form>
        </div>





        <!--add-->
        <div style="display: flex; justify-content: space-between">
            <div style="">
                <p style="border-radius: 8px; margin-left: 40px; " class="btn mt-16 js-openContactForm">Add Course</p>
            </div>
            <div style="background-color: #4255ff; padding: 10px 2px; color: white; width: 100px;float: right; margin-right: 40px;
                 text-align: center; margin-top: 20px;margin-bottom: 20px;border-radius: 8px;">
                <button style="background-color: #4255ff;border: none;color: white; " type="submit" form="form1" value="Apply">Apply</button>
            </div>
        </div>

        <div style="padding-top: 100px; padding-left: 20%;" id="mydiv" class="contactForm js-contactForm ${open}">
            <div style="width: 80%; border-radius: 8px;" class="inner_contact_form">
                <div style="border-radius: 8px 0 8px 0; width: 50px;background-color: red; color: white;" class="contactFormClose js-closeContactForm">
                    <p style="font-size: 18px; width: 50px; padding-top: 5px; " class="ti-close">Close</p>      
                </div>
                <div style="margin-left: 20px; margin-bottom: 20px; margin-top: 50px;" class="form">
                    <div >
                        <form action="CourseManagerController" method="post">
                            <div style="margin-bottom: 50px; margin-left:30px;" class="modal-header">						
                                <h3 class="modal-title">Add Course</h3>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <p class="courseTxt">CourseID</p>
                                    <input name="id" type="text" class="form-control" placeholder="Nhập course ID" required>
                                </div>
                                <div class="form-group">
                                    <p class="courseTxt">CourseName</p>
                                    <input name="name" type="text" class="form-control" placeholder="Nhập course name" required>
                                </div>
                                <div class="form-group">
                                    <p class="courseTxt">Category</p>
                                    <select style="width: 450px; height: 30px; outline: none" name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${cclist}" var="o">
                                            <option value="${o.categoryID}">${o.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>                                                         
                                <div class="form-group">
                                    <p class="courseTxt">Description</p>
                                    <input name="description" type="text" class="form-control" placeholder="Nhập mô tả" required>
                                </div>
                                <div class="form-group">
                                    <p class="courseTxt">Thumnail</p>
                                    <input name="thumbnail" type="text" class="form-control" placeholder="Nhập ảnh" required>
                                </div>


                            </div>
                            <div style="margin-left: 30px;" class="modal-footer">                           
                                <input style=" border-radius: 8px;" type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <script>
            const contactFormOpen = document.querySelectorAll('.js-openContactForm');
            const contactFormClose = document.querySelectorAll('.js-closeContactForm');
            const contactForm = document.querySelector('.js-contactForm');

            for (const Btn of contactFormOpen) {
                Btn.addEventListener('click', show);
            }

            function showContactForm() {
                contactForm.classList.add('open');
            }

            for (const Btn of contactFormClose) {
                Btn.addEventListener('click', hide);
            }

            function hide() {
                document.getElementById('mydiv').style.display = 'none';
            }
            function show() {
                document.getElementById('mydiv').style.display = 'block';
            }

            function hideContactForm() {
                contactForm.classList.remove('hide');
                alert("Send success!!");
            }
        </script>

        <!--end add-->





        <script language="javascript" type="text/javascript">
            function update(event) {
                var x = document.getElementsByClassName(event);
                for (var i = 0; i < x.length; i++) {
                    x[i].disabled = false;
                    x[i].style.backgroundColor = "#abdbe3";
                }
            }
        </script>
    </body>
</html>
