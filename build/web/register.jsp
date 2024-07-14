<%-- 
    Document   : register.jsp
    Created on : Mar 9, 2023, 4:37:52 PM
    Author     : toden
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.helper"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/header.jsp" %>
        <link rel="stylesheet" href="css/register.css">
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>
        <section class="h-100 h-custom gradient-custom-2">
            <form action="Register" method="post">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12">
                            <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                                <div class="card-body p-0">
                                    <div class="row g-0">
                                        <div class="col-lg-6">
                                            <div class="p-5">
                                                <h3 class="fw-normal mb-5" style="color: #4835d4;">General Infomation</h3>

                                                <div class="mb-4 pb-2">

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-4 pb-2">

                                                        <div class="form-outline">
                                                            <label class="form-label" for="form3Examplev2">Account Name</label>
                                                            <input name="account" required style="border: solid #ebebeb 3px; width: 400px; border-radius: 30px" type="text" id="form3Examplev2" class="form-control form-control-lg" />

                                                        </div>

                                                    </div>
                                                    <div class="col-md-6 mb-4 pb-2">



                                                    </div>
                                                </div>

                                                <div class="mb-4 pb-2">
                                                    <div class="form-outline">
                                                        <label class="" for="form3Examplev3">Real Name</label>
                                                        <input name="name" required style="border: solid #ebebeb 3px; width: 400px; border-radius: 30px" type="text" id="form3Examplev3" class="form-control form-control-lg" />

                                                    </div>
                                                </div>

                                                <div class="mb-4 pb-2">
                                                    <div class="form-outline">
                                                        <label class="" for="form3Examplev4">Password</label>
                                                        <input name="password" minlength="6" required style="border: solid #ebebeb 3px; width: 400px; border-radius: 30px" type="password" id="form3Examplev4" class="form-control form-control-lg" />

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-4 pb-2 mb-md-0 pb-md-0">

                                                        <div class="form-outline">

                                                        </div>

                                                    </div>
                                                    <div class="col-md-6">



                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-lg-6 bg-indigo text-white">
                                            <div class="p-5">
                                                <h3 class="fw-normal mb-5">Contact Details</h3>

                                                <div class="mb-4 pb-2">
                                                    <div class="form-outline form-white">
                                                        <label class="" for="form3Examplea2">Phone</label>
                                                        <input name="phone" pattern="[0-9]{10}" required style="border: solid white 1px; width: 400px; border-radius: 30px" type="tel" id="form3Examplea2" class="form-control form-control-lg" />

                                                    </div>
                                                </div>

                                                <div class="mb-4 pb-2">

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-5 mb-4 pb-2">

                                                        <div class="form-outline form-white">
                                                            <label class="" for="form3Examplea4">Address</label>
                                                            <input name="address" required style="border: solid white 1px; width: 400px; border-radius: 30px" type="text" id="form3Examplea4" class="form-control form-control-lg" />

                                                        </div>

                                                    </div>
                                                    <div class="col-md-7 mb-4 pb-2">



                                                    </div>
                                                </div>

                                                <div class="mb-4 pb-2">

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-5 mb-4 pb-2">



                                                    </div>
                                                    <div class="col-md-7 mb-4 pb-2">



                                                    </div>
                                                </div>

                                                <div class="mb-4">
                                                    <div class="form-outline form-white">
                                                        <label class="" for="form3Examplea9">Your Email</label>
                                                        <input name="email" required style="border: solid white 1px; width: 400px; border-radius: 30px" type="email" id="form3Examplea9" class="form-control form-control-lg" />
                                                    </div>
                                                    <div><label class="text-danger" for="form3Examplea9">${requestScope.mess}</label></div>
                                                </div>

                                                <div class="form-check d-flex justify-content-start mb-4 pb-3">
                                                    <input required class="form-check-input me-3" type="checkbox" value="" id="form2Example3c" />
                                                    <label class="form-check-label text-white" for="form2Example3">
                                                        I do accept the <a href="#!" class="text-white"><u>Terms and Conditions</u></a> of your
                                                        site.
                                                    </label>
                                                </div>

                                                <button type="submit" class="btn btn-light btn-lg"
                                                        data-mdb-ripple-color="dark">Register</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>

    </body>
</html>
