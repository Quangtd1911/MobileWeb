<%-- 
    Document   : productList
    Created on : Mar 5, 2023, 3:48:01 PM
    Author     : toden
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.helper"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content_Language" content="vi">
        <title>JSP Page</title>
        <%@include file="../Component/header.jsp" %>
    </head>
    <body>
         <%@include file="../Component/navbar.jsp" %>
        <div class="container">
            <h4>Product List</h4>
            <form method="post" action="ProductList">
                <button type="submit" name="btnAdd" class="btn btn-primary">Thêm product</button>
            </form>
             <form id="cateForm" action="ProductList" method="get">
                <select name="cateSelect" id="cateSelect" style="width: 100px; margin: 2px;" class="form-select" aria-label="Default select example">
                    <option>Tất cả</option>
                    <c:forEach items="${sessionScope.cl}" var="cl">
                        <option ${requestScope.cs==cl.getCategory_id()?"selected":""} value="${cl.getCategory_id()}">${cl.getName()}</option>
                    </c:forEach>
                </select> 
            </form>
            <div class="row">
                <c:forEach items="${sessionScope.p}" var="p" begin="${sessionScope.page.getStartItem()}" end="${sessionScope.page.getLastItem()}">
                    <div class="col-sm-3 mb-2">                       
                        <img class="mt-2" style="border: solid #f5f2f2; border-radius: 20px" src="${p.img}" width="300" height="300" alt="alt"/>
                        <p style="font-size: 23px">${p.productName}</p>
                        <p style="font-size: 23px">Giá: ${helper.convertBigNum(p.listPrice)}</p>
                        <div style="display: inline-block">
                            <form method="post" action="ProductList">
                                <button type="submit" name="btnDel" class="btn btn-danger">Xóa</button>
                                <button type="submit" name="btnUpdate" class="btn btn-info">Update</button>
                                <input hidden name="pid" value="${p.productId}">
                            </form>
                            
                        </div>
                    </div>
                </c:forEach>
                <%@include file="../Component/pagination.jsp" %>
            </div>
        </div>
                <script>
            $(document).ready(function () {
                $('#cateSelect').change(function(){
                    $('#cateForm').submit();
                });
            });

           
        </script>
    </body>
</html>
