<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/29/2019
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="../jspf/import.jspf"%>
    <c:set var="pagePass" value="pages/adminPanel.jsp"/>
    <title>Admin panel</title>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <%@ include file="../jspf/header.jspf"%>
    </nav>
</div>
<div>
    <p>Count of users: ${countOfUsers}</p>
    <p>Count of active users: ${countOfActiveUsers}</p>
    <p>Count of blocked users: ${countOfBlockedUsers}</p>
    <p>Count of life hacks: ${countOfLifeHacks}</p>
    <p>Count of offered life hacks: ${countOfOfferedLifeHacks}</p>
    <p>Count of submitted life hacks: ${countOfSubmittedLifeHacks}</p>
    <p>Count of rejected life hacks: ${countOfRejectedLifeHacks}</p>
    <form action="${pageContext.request.contextPath}/main" method="post" id="manage-users">
        <button type="submit" class="btn btn-primary">Manage users</button>
        <input type="hidden" name="command" value="manage_users">
    </form>

    <form action="${pageContext.request.contextPath}/main" method="post" id="manage-life-hacks">
        <button type="submit" class="btn btn-primary">Manage life hacks</button>
        <input type="hidden" name="command" value="manage_life_hacks">
    </form>

    <form action="${pageContext.request.contextPath}/main" method="post" id="users-offers">
        <button type="submit" class="btn btn-primary">Users offers</button>
        <input type="hidden" name="command" value="users_offers">
    </form>
</div>
</body>
</html>
