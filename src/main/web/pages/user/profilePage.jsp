<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="../jspf/import.jspf"%>
    <title>My profile</title>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <%@ include file="../jspf/header.jspf"%>
    </nav>
</div>

<div class="container" style="display: flex; justify-content: center">
    <div class="card" style="width: 30rem;">
        <h1 align="center">My profile</h1>
        <div class="card-body">
            <h5 class="card-title">
                <form action="${pageContext.request.contextPath}/main" method="post" class="col-md-8">
                    Role: ${role}<br>
                    Username: ${user.username}<br>
                    First name: ${user.firstName}<br>
                    Second name: ${user.secondName}<br>
                    Email: ${user.email}<br>
                </form>

                <form action="${pageContext.request.contextPath}/main" method="post" id="go-to-favorite">
                    <button type="submit"  class="btn btn-primary">Favorite life hacks</button>
                    <input type="hidden" name="command" value="find_all_favorite_life_hacks">
                </form>
            </h5>
        </div>
        </div>
    </div>


</div>
</body>
</html>
