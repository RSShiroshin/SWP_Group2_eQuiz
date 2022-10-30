<%-- 
    Document   : Admin
    Created on : Oct 6, 2022, 1:43:06 AM
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
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div class="adminTable">
            <table>
                <tr>
                    <th>UserID</th>
                    <th>UserName</th>
                    <th>FullName</th>
                    <th>Email</th>
                    <th>Description</th>
                    <th>Registed Day</th>
                    <th>Role</th>
                    <th>Status</th>
                </tr>

                <c:forEach begin="1" end="10">
                    <tr>
                        <td>1</td>
                        <td>hello</td>
                        <td>Koios</td>
                        <td>hello@gmail.com</td>
                        <td>chao</td>
                        <td>20-02</td>
                        <td>1</td>
                        <td>active</td>
                    </tr>
                </c:forEach>

            </table>
        </div>

    </body>
</html>
