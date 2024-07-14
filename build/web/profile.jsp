<%-- 
    Document   : profile
    Created on : Oct 26, 2022, 4:45:43 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <%@include file="../Component/setupCss.jsp" %>
        <style>
            .form-control:focus {
                box-shadow: none;
                border-color:  #003d99
            }

            .profile-button {
                background: rgb(0, 102, 255);
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #003d99;
                padding: 8px 12px;
            }

            .profile-button:focus {
                background:  #003d99;
                box-shadow: none
            }

            .profile-button:active {
                background:  #003d99;
                box-shadow: none
            }

            .back:hover {
                color: #003d99;
                cursor: pointer
            }

            .labels {
                font-size: 18px
            }

            .form-control{
                margin-bottom: 10px;
                margin-top: -5px;
            }

            .add-experience:hover {
                background:  #003d99;
                color: #fff;
                cursor: pointer;
                border: solid 1px  #003d99
            }
        </style>
    </head>
    <body>

        <!-- Section: Design Block -->
        <div class="container rounded bg-white mt-5 mb-5 ">
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 border">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Profile Settings</h4>
                        </div>
                        <form action="Profile" method="post">
                            <div class="row mt-3">
                                <input type="text" class="form-control" placeholder="fullname" value="${Account.getAccountId()}" 
                                       name="AccountId" hidden="">
                            </div>
                            <div class="col-md-12"><label class="labels">Account Name</label>
                                <input type="text" class="form-control" placeholder="fullname" value="${Account.getAccountName()}" 
                                       name="account_name">
                            </div>
                            <div class="col-md-12"><label class="labels">Customer Name</label>
                                <input type="text" class="form-control" placeholder="fullname" value="${Account.getCustomer_name()}" 
                                       name="customer_name">
                            </div>
                            <div class="col-md-12"><label class="labels">Phone</label>
                                <input type="text" class="form-control" placeholder="fullname" value="${Account.getPhone()}" 
                                       name="phone">
                            </div>
                            <div class="col-md-12"><label class="labels">Address</label>
                                <input type="text" class="form-control" placeholder="fullname" value="${Account.getAddress()}" 
                                       name="address">
                            </div>
                            <div class="col-md-12"><label class="labels">Email</label>
                                <input type="text" class="form-control" placeholder="fullname" value="${Account.email}" 
                                       name="email" readonly="">
                            </div>


                    </div>
                                       <div class="mt-5 text-center" style="padding-bottom: 20px"><button class="btn btn-primary profile-button" type="submit">Save
                            Profile</button>
                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
    <!-- Section: Design Block -->

    <!--Footer->
    <%@include file="../Component/footer.jsp" %>
    <!--Footer-->

    <!--Script-->
    <!--Script-->

</body>
</html>
