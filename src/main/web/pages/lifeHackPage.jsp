<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/27/2019
  Time: 10:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="jspf/import.jspf"%>
    <title>Life hack</title>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <%@ include file="jspf/header.jspf"%>
    </nav>
</div>
<div class="container" style="display: flex; justify-content: center">
    <form action="${pageContext.request.contextPath}/main" method="post" id="life-hack-form">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">
                    <strong>
                        Name: ${lifeHack.name}<br>
                        Username: ${lifeHack.username}<br>
                        Category: ${lifeHack.lifeHackCategory}<br>
                        Description:<br>
                        ${lifeHack.description}<br>
                        <img style="width: 100%" src="data:image/jpeg;base64,${lifeHack.pictureEnc}" /><br>
                        <p class="card-text">Date and time of post:<br>
                            ${lifeHack.dateOfPosting}<br></p>
                    </strong>
                </h5>

            </div>
            <div class="card-footer">
                <c:if test="${role == 'GUEST'}">
                    <b>Please log in to see and add comments</b>
                </c:if>

                <c:if test="${role == 'ADMIN' || role == 'USER'}">
                    <c:if test="${isAdded == 'notAdded'}">
                        <form action="${pageContext.request.contextPath}/main" method="post" id="add-to-favorite">
                            <button type="submit"  class="btn btn-primary">Add to favorite</button>
                            <input type="hidden" name="command" value="add_to_favorite">
                            <input type="hidden" name="lifeHackId" value="${lifeHack.lifeHackId}">
                        </form>
                    </c:if>
                    <c:if test="${isAdded == 'added'}">
                        <form action="${pageContext.request.contextPath}/main" method="post" id="delete-from-favorite">
                            <button type="submit"  class="btn btn-primary">Delete from favorite</button>
                            <input type="hidden" name="command" value="delete_from_favorite">
                            <input type="hidden" name="lifeHackId" value="${lifeHack.lifeHackId}">
                        </form>
                    </c:if>
                    <div>
                        <c:if test="${addCommentError == 'true'}">
                            <b style="color: red">${addCommentErrorMessage}</b>
                        </c:if>

                    </div>
                    <form action="${pageContext.request.contextPath}/main" method="post" id="add-comment">
                        <b>Input comment:</b>
                        <textarea name="comment" class="form-control"></textarea>
                        <button type="submit" class="btn btn-primary">Add comment</button>
                        <input type="hidden" name="command" value="add_comment">
                        <input type="hidden" name="lifeHackId" value="${lifeHack.lifeHackId}">
                    </form>
                    <c:if test="${commentsStatus == 'notShowed'}">
                        <form action="${pageContext.request.contextPath}/main" method="post" id="show-comments">
                            <button type="submit"  class="btn btn-primary">Show comments</button>
                            <input type="hidden" name="command" value="show_comments">
                            <input type="hidden" name="lifeHackId" value="${lifeHack.lifeHackId}">
                        </form>

                    </c:if>
                    <c:if test="${commentsStatus == 'showed'}">
                        <form action="${pageContext.request.contextPath}/main" method="post" id="show-comments">
                            <button type="submit"  class="btn btn-primary">Hide comments</button>
                            <input type="hidden" name="command" value="hide_comments">
                            <input type="hidden" name="lifeHackId" value="${lifeHack.lifeHackId}">
                        </form>
                        <c:if test="${comments == null || fn:length(comments) == 0}">
                            No comments
                        </c:if>
                        <c:if test="${comments != null || fn:length(comments) != 0}">
                            <c:forEach var="comment" items="${comments}">
                                <form action="${pageContext.request.contextPath}/main" method="post" id="offer-form">
                                        User: ${comment.username}<br>
                                        Role: ${comment.userRole}<br>
                                        ${comment.description}<br>
                                        Date: ${comment.dateOfComment}<br>
                                    <c:if test="${role == 'ADMIN' || comment.username == user.username}">
                                        <button type="submit"  class="btn btn-primary">Delete comment</button>
                                        <input type="hidden" name="command" value="delete_comment">
                                        <input type="hidden" name="lifeHackId" value="${lifeHack.lifeHackId}">
                                        <input type="hidden" name="commentId" value="${comment.commentId}">
                                    </c:if>

                                </form>
                            </c:forEach>
                        </c:if>
                    </c:if>

                </c:if>
            </div>
        </div>


    </form>
</div>
</body>
</html>
