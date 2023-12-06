
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">  
        <style>
            .dropdown-toggle::after {
                content: none;
            }
            .dropdown-toggle {
                background-color: transparent;
            }
        </style>
    </head>
    <body style="background-color: #e8e8e8; overflow-x: hidden">
        <%@include file="Header.jsp" %>
        <c:set var="orders" value="${requestScope.list}"></c:set>
        <div class="row mt-5">
                                  
            <div class="container bg-white p-3">
                <h1 class="mb-3 mt-3">History Purchase</h1>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="col-1">Order ID</th>
                            <th class="col-1">Name</th>
                            <th class="col-1">Phone</th>
                            <th class="col-3">Address</th>                           
                            <th class="col-1">Total Money</th>
                            <th class="col-3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr id="table-${order.orderid}">
                                <th>${order.orderid}</th>
                                <td>${order.name}</td>
                                <td>${order.phone}</td>
                                <td>${order.address}</td>
                                <th>$${order.totalmoney}</th>
                                <td>
                                    <a href="order?id=${order.orderid}" class="btn btn-info mr-2">View</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${ orders != null}">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination  justify-content-end">
                            <li class="page-item ${requestScope.page == 1 ? "disabled" :""}"><a class="page-link" href="history-purchase?page=${requestScope.page-1}">Previous</a></li>
                                <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                                <li class="page-item ${requestScope.page == i ?"active" :""}" ><a href="history-purchase?page=${i}" class="page-link" >${i}</a></li>
                                </c:forEach>
                            <li class="page-item ${requestScope.page == requestScope.endPage ? "disabled" :""} ${requestScope.endPage == 0 ? "disabled" :""}"><a class="page-link" href="history-purchase?page=${requestScope.page+1}">Next</a></li>
                        </ul>
                    </nav>
                </c:if>
            </div>
        </div>
        <div class ="Footer" style="margin-top: 200px">
            <%@include file="Footer.jsp" %>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
