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

            .mt-16 {
                margin-top: 16px !important;
            }

            .mt-32 {
                margin-top: 32px !important;
            }
        </style>
    </head>
    <body>
        <!--phần BEGIN: CONTACT-->
                <div id="contact" class="content-section">
                    <div style="background: #99ffff">
                        <h2 class="section-heading">CONTACT</h2>
                        <p class="section-sub-heading">Fan? Drop a note!</p>
                    </div>

                    <div class="row contact-content">
                        <div class="col col-half s-col-full contact-info">
                            <p><i class="ti-location-pin"></i>Hòa Lạc, Thạch Thất</p>
                            <p><i class="ti-mobile"></i>Phone: <a href="tel:+84 364151863">+84 364151863</a></p>
                            <p><i class="ti-email"></i> Email: <a href="mailto:khaihay78@mail.com">khaihay78@mail.com</a></p>
                        </div>

                        <div class="col col-half s-col-full contact-form">
                            <form action="">
                                <div class="row">
                                    <div class="col col-half s-col-full">
                                        <input type="text" name="" placeholder="Name" required id="" class="form-control">
                                    </div>

                                    <div class="col col-half s-col-full s-mt-8">
                                        <input type="email" name="" placeholder="Email" required id="" class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-full mt-8">
                                        <input type="text" name="" placeholder="Message" required id="" class="form-control">
                                    </div>
                                </div>
                                <input class="btn pull-right mt-16 s-full-width" type="submit" value="SEND">
                            </form>
                        </div>
                    </div>
                    
                </div>
                <!--phần END: CONTACT-->
    </body>
</html>
