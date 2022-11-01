<%-- 
    Document   : FooterContract
    Created on : Oct 22, 2022, 9:34:22 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./fonts/themify-icons/themify-icons.css">
        <style>
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
                color: #fff;
                background-color: #000;
                text-decoration: none;
                padding: 11px 16px;
                display: inline-block;
                margin-top: 16px;
                border: none;
                appearance: none;
                -webkit-appearance: none;
            }

            .btn:hover {
                color: #000;
                background-color: #ccc;
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
                height: 50%;
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
            body{

            }
        </style>
    </head>
    <body >
        <!--phần BEGIN: CONTACT-->
        <div style="background-color: #3ccfcf;">
            <div style=" width: 70%; margin: 40px 15% 0 15%; padding-bottom: 50px; padding-top: 20px;" id="contact" class="content-section">
                <div>
                    <h2 class="section-heading">CONTACT</h2>
                    <p class="section-sub-heading">Drop your problem here!</p>
                </div>

                <div class="row contact-content">
                    <div style="display: flex; width: 100%; justify-content: space-between" class="col col-half s-col-full contact-info">
                        <div>
                            <p style="margin-top: 10px;"><i class="ti-location-pin"></i>Hòa Lạc, Thạch Thất</p>
                            <p style="margin-top: 10px;"><i class="ti-mobile"></i>Phone: <a href="tel:+84 364151863">+84 364151863</a></p>
                            <p style="margin-top: 10px;"><i class="ti-email"></i> Email: <a href="mailto:khaihay78@mail.com">khaihay78@mail.com</a></p>
                        </div>

                        <div>
                            <p style="border-radius: 8px;" class="btn mt-16 js-openContactForm">OPEN CONTACT FORM</p>
                        </div>
                    </div>  
                </div>

            </div>
        </div>
        <!--phần END: CONTACT-->

        <div id="mydiv" class="contactForm js-contactForm ${open}">
            <div class="inner_contact_form">
                <div class="contactFormClose js-closeContactForm">
                    <i class="ti-close"></i>      
                </div>
                <div class="pic">
                    <img src="Img/support-img.png" alt="Quizlut"/>
                </div>
                <div class="form">
                    <h2 class="m-8 col-full">Contact us</h2>
                    <form class="Contact_Form" action="Contact" method="post" enctype="multipart/form-data">
                        <label for="subject">What is your problem:</label>
                        <input type="text" name="viewID" value="home" hidden>
                        <select style="height: 40px; border-radius: 8px;" name="subject">
                            <option value="Question">Question</option>
                            <option value="Quiz">Quiz</option>
                            <option value="Interface">Interface</option>
                            <option value="Other">Other</option>
                        </select> </br></br>
                        <textarea name="message" rows="4" cols="50" ></textarea>
                        <input class="js-closeContactForm" type = 'submit' value = 'SEND' style="font-size: 20px;"><br/>
                    </form>
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
    </body>
</html>
