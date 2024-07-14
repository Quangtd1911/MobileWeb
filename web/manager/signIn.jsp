<%-- 
    Document   : signIn
    Created on : Mar 6, 2023, 12:41:29 PM
    Author     : toden
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../Component/header.jsp" %>
    </head>
    <body>
        <%@include file="../Component/navbar.jsp" %>
        <div class="container" style="margin-top:200px ">
            <form method="post" action="../AdmSignIn">
                <!-- Email input -->
                <div class="text-center">
                    <h1>Admin SignIn</h1>
                </div>
                <div class="form-floating mb-3">
                    <input type="name" class="form-control" id="floatingInput" name="name">
                    <label for="floatingInput">Account</label>
                </div>

                <!-- Password input -->
                <div class="form-floating mb-4">
                    <input minlength="6" type="password" class="form-control" id="floatingPassword" name="password">
                    <label for="floatingPassword">Password</label>
                </div>

                <!-- 2 column grid layout for inline styling -->
                <div class="row mb-4">
                    <div class="col d-flex justify-content-center">

                        <div class="col">
                            <!-- Simple link -->
                            <a href="../signIn.jsp">Back to sign in</a>
                        </div>

                        <!-- Checkbox -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                            <label class="form-check-label" for="form2Example31"> Remember me </label>
                        </div>
                    </div>

                </div>

                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>

                <!-- Register buttons -->
                <div class="text-center">
                    <p>Not a member? <a href="../register.jsp">Register</a></p>
                    <p>or sign up with:</p>
                    <button type="button" class="btn btn-link btn-floating mx-1">
                        <i class="fab fa-facebook-f"></i>
                    </button>

                    <button type="button" class="btn btn-link btn-floating mx-1">
                        <i class="fab fa-google"></i>
                    </button>

                    <button type="button" class="btn btn-link btn-floating mx-1">
                        <i class="fab fa-twitter"></i>
                    </button>

                    <button type="button" class="btn btn-link btn-floating mx-1">
                        <i class="fab fa-github"></i>
                    </button>
                </div>
            </form>
            Login - register
        </div>


    </body>
</html>
