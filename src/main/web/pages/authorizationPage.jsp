<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="jspf/import.jspf"%>
    <title>Authorization</title>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <%@ include file="jspf/header.jspf"%>
    </nav>
</div>

<div class="container">
    <h1 align="center">Authorization</h1>
    <div>
        <form id="autorization-form" action="${pageContext.request.contextPath}/main" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <span style="display: grid" id="error-username-span"></span>
                <input type="text" class="form-control" id="username" name="username"
                       placeholder="Enter username">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <span style="display: grid" id="error-password-span"></span>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
            </div>
            <div>
                <c:if test="${signInError == 'true'}">
                    <b style="color: red">Authorization failed. Please check your data.</b>
                </c:if>
            </div>

            <button type="submit"  class="btn btn-primary">Submit</button>
            <input type="hidden" name="command" value="authorization">
            <input type="hidden" name="page" value="${pagePass}">


        </form>

    </div>
</div>
<script>
    function checkLengthFromMinToMax(string, min, max)
    {
        let temp;
        if(string.length >= min && string.length <= max) {
            temp = true;
        }
        else {
            temp = false;
        }
        return temp;
    }
    function validate(){
        if (checkUsername() && checkPasswords() && checkEmail() && checkNames()){
            console.log("submit")
            document.getElementById('registration-form').submit();
        }else{
            console.log("no submit")
        }
    }

    function checkValidUsername(username)
    {
        return /^[A-Za-z0-9_]+$/.test(username);
    }

    function checkValidName(name)
    {
        return /^[a-z ,.'-]+$/i.test(name);
    }

    function checkValidEmail(email)
    {
        let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    function checkPasswords()//TODO
    {
        let pass1 = document.getElementById('pass1').value;
        let pass2 = document.getElementById('pass2').value;
        if (!checkLengthFromMinToMax(pass1, 3, 20) && !checkLengthFromMinToMax(pass2, 3, 20)){
            document.getElementById('error-pass-span').innerHTML = "Passwords should be from 3 to 20 symbols";
            return false;
        }else{
            if (pass1 === pass2) {
                return true;
            } else {
                document.getElementById('error-pass-span').innerHTML = "Passwords must be equal";
                return false;
            }

        }
    }

    function checkNames() {
        let firstName = document.getElementById('first-name').value;
        let secondName = document.getElementById('second-name').value;
        if (!checkValidName(firstName))
        {
            document.getElementById('error-first-name-span').innerHTML = "Check first name";
            return false;
        }
        else if (!checkValidName(secondName)){
            document.getElementById('error-second-name-span').innerHTML = "Check second name";
            return false;
        }
        else {
            return true;
        }
    }

    function checkEmail() {
        let email = document.getElementById('email').value;
        if (!checkValidEmail(email))
        {
            document.getElementById('error-email-span').innerHTML = "Check email";
            return false;
        }else{
            return true;
        }
    }

    function checkUsername()
    {
        let username = document.getElementById('username').value;
        if (!checkLengthFromMinToMax(username, 3, 20))
        {
            document.getElementById('error-username-span').innerHTML = "Username should be from 3 to 20 symbols!";
            return false;
        }
        else if (!checkValidUsername(username))
        {
            document.getElementById('error-username-span').innerHTML = "Username should contain only latin characters, numbers and underscore!";
            return false;
        }else{
            return true;
        }
    }
</script>
</body>
</html>
