<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>GoJira's Priority Panel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="menu">
    <a href="/panel/project">Projects</a>
    <a href="/panel/task">Tasks</a>
    <a href="/panel/user">Users</a>
    <a href="/panel/status">Status</a>
    <a href="/panel/priority"><strong>Priority</strong></a>
<%@ include file="../menu.jsp" %>
</div>
<div class=" div column-form">
    <div class="bb">
        <f:form action="/add/priority" method="post" modelAttribute="priority">
            <h3>Add new Priority:</h3>
            <div>
                Name: <f:input path="name"/><f:errors path="name" class="bg-danger text-danger"/>
            </div>
            <div>
                <label>Active: <f:checkbox path="active"/></label>
                <f:errors path="active" class="bg-danger text-danger"/>
            </div>
            <div>
                <input type="submit" value="Create new Priority"/>
            </div>
        </f:form>
    </div>
</div>
<div class="div column-list">
    <div class="bb">
        <p><h3>Priority List</h3></p>
        <div class="cont">
        <c:forEach items="${prios}" var="prior">
            <h5><strong>Name: </strong> ${prior.name} </h5>
            <h5><strong>Active: </strong> ${prior.active}</h5>
            <h6 class="text-info"><a href="/delete/priority?id=${prior.id}">Delete</a></h6>
            <hr>
        </c:forEach>
        </div>
    </div>
</div>
</body>
</html>