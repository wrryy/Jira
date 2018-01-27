<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>GoJira's Status Panel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="menu">
    <a href="/panel/project">Projects</a>
    <a href="/panel/task">Tasks</a>
    <a href="/panel/user">Users</a>
    <a href="/panel/status"><strong>Status</strong></a>
    <a href="/panel/priority">Priority</a>
<%@ include file="../menu.jsp" %>
</div>
<div class=" div column-form">
    <div class="bb">
        <f:form action="/add/status" method="post" modelAttribute="status">
            <h3>Add new Status:</h3>
            <div>
                Name: <f:input path="name"/><f:errors path="name" class="bg-danger text-danger"/>
            </div>
            <div>
                <label>Active: <f:checkbox path="active"/></label>
                <f:errors path="active" class="bg-danger text-danger"/>
            </div>
            <div>
                <input type="submit" value="Create new Status"/>
            </div>
        </f:form>
    </div>
</div>
<div class="div column-list">
    <div class="bb">
        <p><h3>Status List</h3></p>
        <div class="cont">
        <c:forEach items="${stats}" var="stat">
            <h5><strong>Name: </strong> ${stat.name} </h5>
            <h5><strong>Active: </strong> ${stat.active}</h5>
            <h6 class="text-info"><a href="/delete/status?id=${stat.id}">Delete</a></h6>
            <hr>
        </c:forEach>
        </div>
    </div>
</div>
</body>
</html>