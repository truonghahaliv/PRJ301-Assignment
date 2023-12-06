<%-- 
    Document   : home
    Created on : Oct 30, 2023, 10:31:38 PM
    Author     : Dan
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <title>TrgShop</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <link rel="stylesheet" href=""/>
        <style>


            .header__left{
                margin-left: 40px;
                font-size:18px;
                color: lightgoldenrodyellow;
                font-weight: bold;
                width:250px;
            }
            .header__right{
                font-size:24px;
                font-weight: bold;
                width:250px;
            }

            .header__right{
                margin-right: 30px;
                display: flex;
                justify-content: space-between;
                align-items: center;

            }
            .register-button {
                background-color: #58abff;
                color: white;
                border: none;
                padding: 8px 15px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
                margin-left: 10px;
            }

            .register-button:hover {
                background-color: #58abff;
            }
            .login-button {
                background-color: #58abff;
                color: white;
                border: none;
                padding: 8px 15px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
                margin-left: 10px;

            }

            .login-button:hover {
                background-color: #58abff;
            }
            .header__logo{
                width: 160px;
                height: 160px;
                border-radius: 50%;
                border: 2px solid green;
                overflow: hidden;
            }


            .header__right p{
                text-align: right;
            }


            .banner img{
                width: 100%;
            }
            .highlight{
                display: flex;
                margin-top: 10px;
            }
            .highlight__image{
                width: 30%;
            }
            .highlight__image img{
                width: 100%;
            }
            .highlight__content{
                width: 90%;
                margin-left: 20px;

            }
            .highlight__content h1{
                margin-top: 0;
                font-family: 'Ephesis', cursive;
                color: red;
            }
            .highlight__content p{
                font-weight: bold;
                font-family: 'Ephesis', cursive;
                color: rgb(250, 65, 96);
            }
            .highlight__image img{
                width: 100%;
            }

            .highlight__content h3{
                color: #3399ff;
                background-image: url(/image/icon-hyt.png);
            }
            .highlight__content p:nth-child(5){
                color: rgb(250, 65, 96);
            }

            .seller{
                margin-bottom: 40px;
            }
            .seller__title{
                text-align: center;
                color: #58abff;
                font-weight: 700;
            }
            .seller__list{
                display: flex;
                justify-content:space-around;
                margin: 0 24px;
            }
            .seller__list__item{
                text-align:center;
                border: 4px solid grey;
                max-width: 20%;
                border-radius: 8px;
                overflow: hidden;
            }
            .seller__list__item__details{
                margin: 10px;
            }
            .seller__list__item__details img{
                width: 100%;
            }
            .seller__list__item__details h3{
                color: green;
                font-weight: 600;
            }
            .seller__list__item__details p{
                color: red;
            }
            .seller__list__item__details div{
                color:white;
                background-color: orangered;
                padding: 10px;
                border-radius: 4px;
                width: fit-content;
                margin: auto;
                cursor: pointer;
            }
            .footer{
                text-align: center;
                background-color: lightpink;
                color:white;
            }
            .footer__content {
                padding: 10px;
                color: black;
            }

            body {
                margin: 0;
            }
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }</style>

    </head>

    <body>
        <%@include  file="Header.jsp"%>
        <div class="seller widn">
            <h1 class="seller__title">OUR SHOES</h1>
            <div class="seller__list d-flex flex-wrap justify-content-between">
                <c:forEach var="product" items="${listproduct}">

                    <div class="seller__list__item mr-4 mt-2">
                        <div class="seller__list__item__details">
                            <form action="add-to-cart" method="post">
                                <img src="img/${product.image}" style="width: 250px;height: 312px;object-fit: cover "alt="Shoe img"/>
                                <h3 style="height: 70px;color: #58abff">${product.productName}</h3>
                                <p style="margin-top: -10px">Price : ${product.price}$</p>
                                <p style="margin-top: -15px">Quantity : ${product.quantity}</p>
                                <p style="margin-top: -15px">Sold Quantity: ${product.sold_quantity}</p>
                                Quantity: <input type="number" min="1" style="height: 30px"value="1" max="${product.quantity}"  name="quantity">
                                <br>
                                <input type="text" value="${product.productId}" name="productId" hidden="">
                                <br>
                                <input class="btn btn-success"style="border: cornsilk; margin-top: -20px" type="submit" value="Add to Cart">
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div style="clear: both;"></div>
        </div><!--Kết thúc shoeslist-->
        <c:if test="${requestScope.listproduct != null}">
            <nav aria-label="Page navigation example">
                <ul class="pagination  justify-content-end">
                    <li class="page-item ${requestScope.page == 1 ? "disabled" :""}"><a class="page-link" href="home?page=${requestScope.page-1}">Previous</a></li>
                        <c:forEach begin="1" end="${requestScope.endPage}" var="i">

                        <li class="page-item ${requestScope.page ==i ?"active" :""}" ><a href="home?page=${i}" class="page-link" >${i}</a></li>
                        </c:forEach>
                    <li class="page-item ${requestScope.page == requestScope.endPage || requestScope.endPage == 0 ? "disabled" :""}"><a class="page-link" href="home?page=${requestScope.page+1}">Next</a></li>
                </ul>
            </nav>
        </c:if>
        <%@include file="Footer.jsp" %>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</html>
