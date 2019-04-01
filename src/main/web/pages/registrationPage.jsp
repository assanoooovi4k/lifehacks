<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <%@ include file="jspf/import.jspf"%>
    <title>Registration</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registration</title>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <%@ include file="jspf/header.jspf"%>
    </nav>
</div>

<div class="container">
    <h1 align="center">Registration</h1>
    <div>
        <form id="registration-form" action="${pageContext.request.contextPath}/main" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <span style="display: grid" id="error-username-span"></span>
                <input type="text" class="form-control" id="username" name="username"
                       placeholder="Enter username">
            </div>
            <div class="form-group">
                <label for="first-name">First name</label>
                <span style="display: grid" id="error-first-name-span"></span>
                <input type="text" class="form-control" id="first-name" name="first-name"
                       placeholder="Enter first name">
            </div>
            <div class="form-group">
                <label for="second-name">Second name</label>
                <span style="display: grid" id="error-second-name-span"></span>
                <input type="text" class="form-control" id="second-name" name="second-name"
                       placeholder="Enter second name">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <span style="display: grid" id="error-email-span"></span>
                <input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
            </div>

            <div class="form-group">
                <label for="pass1">Password</label>
                <span style="display: grid" id="error-pass-span"></span>
                <input type="password" class="form-control" id="pass1" name="pass1"  placeholder="Enter password">
            </div>

            <div class="form-group">
                <label for="pass2">Confirm password</label>
                <input type="password" class="form-control" id="pass2" name="pass2" placeholder="Enter password">
            </div>
            <div>
                <c:if test="${registrationError == 'true'}">
                    <b style="color: red">${registrationErrorMessage}</b>
                </c:if>
            </div>
            <button type="submit"  class="btn btn-primary">Submit</button>
            <input type="hidden" name="command" value="register_user">
            <input type="hidden" name="page" value="${pagePass}">
        </form>

    </div>
</div>

<%--<script>--%>
    <%--function checkLengthFromMinToMax(string, min, max)--%>
    <%--{--%>
        <%--let temp;--%>
        <%--if(string.length >= min && string.length <= max) {--%>
            <%--temp = true;--%>
        <%--}--%>
        <%--else {--%>
            <%--temp = false;--%>
        <%--}--%>
        <%--return temp;--%>
    <%--}--%>
    <%--function validate(){--%>
        <%--if (checkUsername() && checkPasswords() && checkEmail() && checkNames()){--%>
            <%--console.log("submit")--%>
            <%--document.getElementById('registration-form').submit();--%>
        <%--}else{--%>
            <%--console.log("no submit")--%>
        <%--}--%>
    <%--}--%>

    <%--function checkValidUsername(username)--%>
    <%--{--%>
        <%--return /^[A-Za-z0-9_]+$/.test(username);--%>
    <%--}--%>

    <%--function checkValidName(name)--%>
    <%--{--%>
        <%--return /^[a-z ,.'-]+$/i.test(name);--%>
    <%--}--%>

    <%--function checkValidEmail(email)--%>
    <%--{--%>
        <%--let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;--%>
        <%--return re.test(String(email).toLowerCase());--%>
    <%--}--%>

    <%--function checkPasswords()--%>
    <%--{--%>
        <%--let pass1 = document.getElementById('pass1').value;--%>
        <%--let pass2 = document.getElementById('pass2').value;--%>
        <%--if (!checkLengthFromMinToMax(pass1, 3, 20) && !checkLengthFromMinToMax(pass2, 3, 20)){--%>
            <%--document.getElementById('error-pass-span').innerHTML = "Passwords should be from 3 to 20 symbols";--%>
            <%--return false;--%>
        <%--}else{--%>
            <%--if (pass1 === pass2) {--%>
                <%--return true;--%>
            <%--} else {--%>
                <%--document.getElementById('error-pass-span').innerHTML = "Passwords must be equal";--%>
                <%--return false;--%>
            <%--}--%>

        <%--}--%>
    <%--}--%>

    <%--function checkNames() {--%>
        <%--let firstName = document.getElementById('first-name').value;--%>
        <%--let secondName = document.getElementById('second-name').value;--%>
        <%--if (!checkValidName(firstName))--%>
        <%--{--%>
            <%--document.getElementById('error-first-name-span').innerHTML = "Check first name";--%>
            <%--return false;--%>
        <%--}--%>
        <%--else if (!checkValidName(secondName)){--%>
            <%--document.getElementById('error-second-name-span').innerHTML = "Check second name";--%>
            <%--return false;--%>
        <%--}--%>
        <%--else {--%>
            <%--return true;--%>
        <%--}--%>
    <%--}--%>

    <%--function checkEmail() {--%>
        <%--let email = document.getElementById('email').value;--%>
        <%--if (!checkValidEmail(email))--%>
        <%--{--%>
            <%--document.getElementById('error-email-span').innerHTML = "Check email";--%>
            <%--return false;--%>
        <%--}else{--%>
            <%--return true;--%>
        <%--}--%>
    <%--}--%>

    <%--function checkUsername()--%>
    <%--{--%>
        <%--let username = document.getElementById('username').value;--%>
        <%--if (!checkLengthFromMinToMax(username, 3, 20))--%>
        <%--{--%>
            <%--document.getElementById('error-username-span').innerHTML = "Username should be from 3 to 20 symbols!";--%>
            <%--return false;--%>
        <%--}--%>
        <%--else if (!checkValidUsername(username))--%>
        <%--{--%>
            <%--document.getElementById('error-username-span').innerHTML = "Username should contain only latin characters, numbers and underscore!";--%>
            <%--return false;--%>
        <%--}else{--%>
            <%--return true;--%>
        <%--}--%>
    <%--}--%>
<%--</script>--%>
</body>
</html>

