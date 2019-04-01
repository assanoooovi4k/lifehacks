<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/29/2019
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include  file="../jspf/import.jspf"%>
    <title>Users list</title>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <%@ include file="../jspf/header.jspf"%>
    </nav>
</div>
<div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">User id</th>
            <th scope="col">Status</th>
            <th scope="col">Username</th>
            <th scope="col">First name</th>
            <th scope="col">Second name</th>
            <th scope="col">Email</th>
            <th scope="col">Block/Unlock</th>
            <th scope="col">Make admin</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <form action="${pageContext.request.contextPath}/main" method="post" id="offer-form">
                <tr>
                <td>${user.userId}</td>
                <td>
                    <c:if test="${!user.blocked}">
                        Not blocked
                    </c:if>
                    <c:if test="${user.blocked}">
                        Blocked
                    </c:if>
                </td>
                <td>${user.username}</td>
                <td>${user.firstName}</td>
                <td>${user.secondName}</td>
                <td>${user.email}</td>
                <td>
                    <c:if test="${!user.blocked}">
                        <form action="${pageContext.request.contextPath}/main" method="post" id="block">
                            <button type="submit"  class="btn btn-primary">Block user</button>
                            <input type="hidden" name="command" value="block_user">
                            <input type="hidden" name="userId" value="${user.userId}">
                        </form>
                    </c:if>

                    <c:if test="${user.blocked}">
                        <form action="${pageContext.request.contextPath}/main" method="post" id="unlock">
                            <button type="submit"  class="btn btn-primary">Unlock user</button>
                            <input type="hidden" name="command" value="unlock_user">
                            <input type="hidden" name="userId" value="${user.userId}">
                        </form>
                    </c:if>
                </td>

                <td>
                    <form action="${pageContext.request.contextPath}/main" method="post" id="make-admin">
                        <button type="submit"  class="btn btn-primary">Make admin</button>
                        <input type="hidden" name="command" value="make_admin">
                        <input type="hidden" name="userId" value="${user.userId}">
                    </form>
                </td>
                </tr>
            </form>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
