<%-- 
    Document   : vcl
    Created on : Oct 28, 2023, 1:23:17 AM
    Author     : Dan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Username</th>
                    <th scope="col">fullname</th>
                </tr>
            </thead>
            <tbody>
                
                    <c:forEach items="${account}" var="a" >
                        <tr>
                             <td>${a.accountId} </td>
                            <td>${a.username} </td>
                            <td>${a.fullname} </td>
                        </tr>
                    </c:forEach>
                
                
            </tbody>
        </table>
    </body>
</html>
