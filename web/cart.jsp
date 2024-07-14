<%-- 
    Document   : cart
    Created on : Mar 8, 2023, 8:52:31 PM
    Author     : toden
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="helper" class="util.helper"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/header.jsp" %>
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <c:if test="${sessionScope.Cart!=null&&sessionScope.Cart.size()>0}">
                    <table class="table" style="margin-top: 100px">
                        <thead class="table">
                            <tr class="table">
                                <th scope="col">#</th>
                                <th scope="col">Product</th>
                                <th scope="col">Img</th>
                                <th scope="col">Ammount</th>
                                <th scope="col">Total</th>
                                <th scope="col" colspan="2"></th>
                            </tr>
                        </thead>

                        <tbody class="table">

                            <c:forEach items="${sessionScope.Cart}" var="cart" varStatus="loop">
                                <tr class="table-primary">
                                    <th scope="row">${loop.index+1}</th>
                                    <th>${cart.getProductName()}</th>
                                    <th><img src="${cart.getImage()}" width="200" height="200" style="border-radius: 15px;" alt="alt"/></th>
                                    <th>${cart.getAmmount()}</th>
                                    <th>${helper.convertBigNum(cart.getAmmount()*cart.getPrice())}</th>
                                    <th><a href="cart?aid=${cart.getAccountId()}&pid=${cart.getProductId()}&buy=1"><button style="background-color: greenyellow" type="button" class="btn">Buy</button></a></th>
                                    <th><a href="cart?aid=${cart.getAccountId()}&pid=${cart.getProductId()}&del=1"><button style="background-color: greenyellow" type="button" class="btn">Delete</button></a></th>

                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                    <div class="row m-3">
                        <div class="col-md-12 bg-light text-right">
                            <c:set var="total" value="${0}"/>
                            <c:forEach var="cart" items="${sessionScope.Cart}">
                                <c:set var="total" value="${total + cart.getAmmount()*cart.getPrice()}" />
                            </c:forEach>
                            <div class="badge bg-primary text-wrap" style="width: 150px; height: 40px; font-size: 15px;">
                                Total Bill: <c:out value="${helper.convertBigNum(total)}" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 bg-light text-right">
                            <form id="frmAll" action="cart" method="get">
                                <button type="button" id="btnBuyAll" name="btnBuyAll" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Buy all</button>
                                <button type="submit" name="btnDelAll" class="btn btn-warning">Delete all</button>
                                <input hidden name="pid" value="${sessionScope.Cart.get(0).getAccountId()}">
                            </form>
                        </div>
                    </div>
                </c:if>
                <div class="row">
                    <div class="col">
                        <c:if test="${sessionScope.Cart==null||sessionScope.Cart.size()==0}">

                            <div class="col bg-light" style="margin-top: 100px; background-color: white">
                                <h4 style="margin-left: 45%">Cart Empty</h4>
                            </div>
                            <div class="text-center">
                                <a href="ProductList"><i class="fa-solid fa-cart-plus fa-2xl" style="font-size: 100px; margin-top: 100px"></i></a>
                            </div>

                        </c:if>
                    </div>
                </div>


            </div>
        </div>

        <-<!-- Modal -->

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Invoice</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="card">
                            <div class="card-body mx-4">
                                <div class="container">
                                    <p class="my-5 mx-5" style="font-size: 30px;">Thank for your purchase</p>
                                    <div class="row">
                                        <ul class="list-unstyled">
                                            <li class="text-black">${sessionScope.Account.getCustomer_name()}</li>
                                            <li class="text-muted mt-1"><span class="text-black">Invoice</span> #12345</li>
                                            <li class="text-black mt-1"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${now}" /></li>
                                        </ul>
                                        <hr>
                                    </div>
                                    <c:set var="total" value="${0}"/>

                                    <c:forEach items="${sessionScope.Cart}" var="cart">
                                        <c:set var="total" value="${total + cart.getAmmount()*cart.getPrice()}" />
                                        <div class="row">
                                            <div class="col-xl-10">
                                                <p>${cart.getAmmount()} ${cart.getProductName()}</p>
                                            </div>
                                            <div class="col-xl-2">
                                                <p class="float-end">${helper.convertBigNum(cart.getAmmount()*cart.getPrice())} </p>
                                            </div>
                                            <hr style="border: 2px solid black;">
                                        </div><!-- comment -->

                                    </c:forEach>
                                    <div class="row text-black">

                                        <div class="col-xl-12">
                                            <p class="float-end fw-bold">Total: ${helper.convertBigNum(total)}
                                            </p>
                                        </div>
                                        <hr style="border: 2px solid black;">
                                    </div>
                                    <div class="text-center" style="margin-top: 90px;">
                                        <a><u class="text-info">View in browser</u></a>
                                        <p>Thank you for supporting Anyshop. </p>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
                                    <button id="btnSave" type="button" class="btn btn-primary">Done recive</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        $('#btnSave').click(function(){
                            $('#btnBuyAll').prop('type','submit');
                            $('#btnBuyAll').click();
                        })

                    </script>
                    </body>
                    </html>
