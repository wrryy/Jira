<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>GoJira's Users Panel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="menu">
    <a href="/panel/project">Projects</a>
    <a href="/panel/task">Tasks</a>
    <a href="/panel/user"><strong>Users</strong></a>
    <a href="/panel/status">Status</a>
    <a href="/panel/Priority">Priority</a>
<%@ include file="../menu.jsp" %>
</div>
<div class=" div column-form">
    <div class="bb">
        <f:form action="/add/user" method="post" modelAttribute="newuser">
            <h3>Add new User:</h3>
            <div>
                Username: <f:input path="userName"/><f:errors path="userName" class="bg-danger text-danger"/>
            </div>
            <div>
                First Name: <f:input path="firstName"/><f:errors path="firstName" class="bg-danger text-danger"/>
            </div>
            <div>
                Last Name: <f:input path="lastName"/><f:errors path="lastName" class="bg-danger text-danger"/>
            </div>
            <div>
                Password: <f:password path="password"/><f:errors path="password" class="bg-danger text-danger"/>
            </div>
            <div>
                E-mail: <f:input type="email" path="email" /><f:errors path="email" class="bg-danger text-danger"/>
            </div>
            <div>
                <input type="submit" value="Create new User"/>
            </div>
        </f:form>
    </div>
</div>
<div class="div column-list">
    <div class="bb">
        <p><h3>Users List</h3></p>
        <div class="cont">
        <c:forEach items="${users}" var="usr">
            <h5><strong>Full Name: </strong> ${usr.fullName} </h5>
            <h5><strong>Username: </strong> ${usr.userName}</h5>
            <h5><strong>Email: </strong> ${usr.email}</h5>
            <h6 class="text-info"><a href="/delete/user?id=${usr.id}">Delete</a></h6>
            <hr>
        </c:forEach>
        </div>
    </div>
</div>
</body>
</html>