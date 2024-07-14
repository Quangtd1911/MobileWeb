<%-- 
    Document   : updateProduct
    Created on : Mar 5, 2023, 9:25:53 PM
    Author     : toden
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <form method="post" action="updateProduct">
                <div class="mb-3">
                    <label for="" class="form-label">ProductName</label>
                    <input name="Pname" value="${pU.productName}" class="form-control" id="" aria-describedby="">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Price</label>
                    <input type="number" name="Pprice" value="${pU.listPrice}" class="form-control" id="">
                </div>


                <select name="cid"class="form-select" aria-label="Default select example">
                    <c:forEach items="${cl}" var="cl">
                        <option value="${cl.getCategory_id()}" ${pU.getCategoryId()==cl.getCategory_id()?"selected":""} >
                            ${cl.name}
                        </option>
                    </c:forEach>  
                </select>

                <div class="mb-3">
                    <label for="" class="form-label">ImageLink</label>
                    <input name="img" value="${pU.img}" class="form-control" id="">
                </div>
                
                
                    <input name="pid" value="${pU.productId}" class="form-control" hidden>
                

                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>

    </body>
</html>
