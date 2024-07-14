<%-- 
    Document   : navbar
    Created on : Mar 5, 2023, 4:03:04 PM
    Author     : toden
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 100px">
    <div class="container-fluid">
        <a class="navbar-brand" href="ProductList">AnyStore</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="ProductList">Home</a>
                </li>
                <c:if test="${Account != null}">

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Profile">Profile</a>
                    </li>
                </c:if>
                <c:if test="${Account.roleId == 2 || Account.roleId == 3}">
                    <!--                    <li class="nav-item">
                                            <a class="nav-link" href="#">Manager Account</a>
                                        </li>-->
                    <li class="nav-item">
                        <a class="nav-link" href="managerCategory">Manager Category</a>

                    </li>
                </c:if>


            </ul>
            <form method="get" action="ProductList" class="d-flex" style="margin-right: 50px">
                <input name="search" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
                <c:choose>
                    <c:when test="${sessionScope.Account!=null}">
                        <div class="ml-4 d-flex mt-3 mr-3">
                            <i class="fa-solid fa-user-tie fa-2xl m-2"></i>
                            <a href="#"><h5>${Account.getAccountName()}</h5></a>

                            <c:if test="${sessionScope.Cart!=null&&sessionScope.Cart.size()>0}">
                                <a href="cart.jsp"><i class="fa-solid fa-cart-arrow-down fa-2xl m-2"></i></a>
                                </c:if>
                                <c:if test="${sessionScope.Cart==null||sessionScope.Cart.size()==0}">
                                <a href="cart.jsp"><i class="fa-solid fa-cart-shopping fa-2xl m-2" style="color: black"></i></a>
                                </c:if>
                        </div>
                        <a href="LogOut" style="margin-left: 5px;"><button name="logout" style="width: 100px; height: 50px" class="btn btn-primary" type="button">Log Out</button></a>
                    </c:when>
                    <c:otherwise>
                        <a href="signIn.jsp" style="margin-left: 5px;"><button style="width: 100px; height: 50px" class="btn btn-primary" type="button">Sign In</button></a>
                    </c:otherwise>    
                </c:choose>


            </form>
        </div>
    </div>
</nav>