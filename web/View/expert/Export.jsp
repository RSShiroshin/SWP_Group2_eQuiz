<%-- 
    Document   : Export
    Created on : Oct 29, 2022, 2:56:27 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-color: #f6f7fb;
            }
            textarea{
                width: 100%;
                height: 150px;
                padding: 12px 20px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                background-color: #f8f8f8;
                font-size: 16px;
                resize: none;
            }
        </style>
    </head>
    <body>
        <%@ include file="../Header.jsp" %>
        <div style="padding-top: 30px; padding-left: 20%; padding-bottom: 30px; display: flex">
            <input style="width: 30px; height: 30px; margin-right: 20px" type="radio" >
            <button style="padding: 10px 50px; background-color: #4255ff; color: white; border: none; border-radius: 8px;" id ="copy" onclick="myFunction()">Copy text</button>
        </div>
        <div style="margin-left: 10%; margin-right: 10% ">
            <textarea style="resize: none; border-radius: 10px;" cols="100"  id="myInput" readonly>${data}</textarea>
        </div>
        <script>
            function myFunction() {
                // Get the text field
                var copyText = document.getElementById("myInput");
                var copy = document.getElementById("copy");
                // Select the text field
                copyText.select();
                copyText.setSelectionRange(0, 99999); // For mobile devices

                // Copy the text inside the text field
                navigator.clipboard.writeText(copyText.value);
                copy.innerHTML = "Copied";

            }
            var tx = document.getElementsByTagName('textarea');
            for (var i = 0; i < tx.length; i++) {
                tx[i].setAttribute('style', 'height:' + (tx[i].scrollHeight) + 'px;overflow-y:hidden;');
                tx[i].addEventListener("input", OnInput, false);
            }

            function OnInput(e) {
                this.style.height = 'auto';
                this.style.height = (this.scrollHeight) + 'px';
            }
        </script>

    </body>
</html>
