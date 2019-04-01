<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/26/2019
  Time: 3:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <%@ include file="../jspf/import.jspf"%>
    <title>Create life hack</title>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <%@ include file="../jspf/header.jspf"%>
    </nav>
</div>
<div>
    <div class="container">
        <h1 align="center">Offer life hack</h1>
        <form action="${pageContext.request.contextPath}/main" method="post" id="offer-form" enctype="multipart/form-data">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Category</label>
                <label>
                    <select id="category" name="category"  class="form-control mr-sm-2">
                        <option name = "SAVVY">SAVVY</option>
                        <option name = "MNEMONICS">MNEMONICS</option>
                        <option name = "MEMORY_CARDS">MEMORY CARDS</option>
                        <option name = "TIME_MANAGEMENT">TIME MANAGEMENT</option>
                        <option name = "SOCIAL_ENGINEERING">SOCIAL ENGINEERING</option>
                        <option name = "EASY_TIPS">EASY TIPS</option>
                    </select>
                </label>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Name</label>
                <span id="error-name-of-item-span"></span>
                <input type="text" id="name-of-item" class="form-control" name="name" placeholder="Name">

            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Description</label>
                <input type="text" class="form-control" id="description" name="description" placeholder="Description">
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Picture</label>
            </div>
            <div>
                <input type="file" id="picture" accept="image/x-png, image/jpeg"
                       name="picture">
            </div>


            <div>
                <c:if test="${offerLifeHackError == 'true'}">
                    <b style="color: red">${offerLifeHackErrorMessage}</b>
                </c:if>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <input type="hidden" name="command" value="offer_life_hack">
            <input type="hidden" name="page" value="${pagePass}">
        </form>
    </div>
</div>


</body>
</html>
