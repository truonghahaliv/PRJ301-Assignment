
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <style>
            .dropdown-toggle::after {
                content: none;
            }
            .dropdown-toggle {
                background-color: transparent;
            }
            .nav-link {
                color: white
            }
            .nav-link:hover {
                background-color: #ccc;
                color: #17a2b8
            }
        </style>
    </head>
    <body>
        <c:set var="listOrder" value="${requestScope.listOrder}"></c:set>
        <c:set var="listProduct" value="${requestScope.listProduct}"></c:set>
        <c:set var="order" value="${requestScope.order}"></c:set>
        <div class="d-flex">
            <%@include file="SideBarAdmin.jsp" %>  
            <div class="row">
                <div class="container bg-white mt-4">     
                    <div class="col-md-6 mt-5 mb-5 mx-auto">
                        <!-- REVIEW ORDER -->
                        <div class="card">
                            <div class="card-header d-flex align-items-center justify-content-between" >
                                <div style="font-size: 22px;color: chocolate;font-weight: bold; font-style: italic"">Review Order #${order.orderid}</div>
                        </div>
                        <div class="card-body ">
                            <c:forEach var="orderItem" items="${listOrder}">
                                <div class="form-group row">
                                    <c:forEach var="product" items="${listProduct}">
                                        <c:if test="${product.productId == orderItem.productid}">
                                            <div class="col-sm-3 col-3">
                                                <img class="img-fluid" src="img/${product.image}" />
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach var="product" items="${listProduct}">
                                        <c:if test="${product.productId == orderItem.productid}"> 

                                            <div class="col-sm-6 col-6">
                                                <div class="col-12" style="font-weight: bold;font-size: 18px">${prod.name}</div>
                                                <div class="col-12"><small style="font-weight: bold ;font-style: italic;font-size: 14px">Quantity: <span style="font-weight: lighter ;font-style: normal">${orderItem.quantity}</span></small></div>
                                                <div class="col-12"><small style="font-weight: bold ;font-style: italic;font-size: 14px">Price: <span style="font-weight: lighter ;font-style: normal">$${product.price}</span></small></div>
                                            </div>

                                            <div class="col-sm-3 col-3 text-right">
                                                <h6><span>$</span><span class="price">${product.price * orderItem.quantity}</span></h6>
                                            </div>

                                        </c:if>
                                    </c:forEach>                                  
                                </div>
                            </c:forEach>
                            <hr />
                            <div class="form-group row">
                                <div class="col-12">
                                    <strong>Order Total</strong>
                                    <span class="float-right" style="font-weight: bold"><span>$</span><span>${requestScope.order.totalmoney}</span></span>
                                    <input type="text" class="totalOrder" value="" name="total" hidden="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            const totalPrice = document.querySelector('.totalPrice');
            const prices = document.querySelectorAll('.price');
            let total = 0;
            prices.forEach((value) => {
                let price = +(value.innerHTML);
                total += +(value.innerHTML);
            });
            totalPrice.innerHTML = total;
        </script>
    </body>
</html>
