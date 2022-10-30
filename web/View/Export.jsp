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
    </head>
    <body>
        <input type="radio" >
        <button id ="copy" onclick="myFunction()">Copy text</button>
        <textarea id="myInput" readonly>${data}</textarea>
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
        </script>
    </body>
</html>
