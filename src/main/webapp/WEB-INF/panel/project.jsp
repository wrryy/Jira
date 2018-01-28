<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>GoJira's Projects Panel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="menu">
    <a href="/panel/project"><strong>Projects</strong></a>
    <a href="/panel/task">Tasks</a>
    <a href="/panel/user">Users</a>
    <a href="/panel/status">Status</a>
    <a href="/panel/priority">Priority</a>

    <%@ include file="../menu.jsp" %>
</div>
<div class=" div column-form">
    <div class="bb">
        <form:form modelAttribute="project" action="/add/project" method="post">
            <h3>Add new Project:</h3>
            <div>
                Title:
                <form:input cssClass="form" path="name"/>
                <form:errors class="bg-danger text-danger" path="name"/>
            </div>
            <div>
                Description:
                <form:errors class="bg-danger text-danger" path="description"/>
                <form:textarea cssClass="form" path="description" cols="20" rows="5"/>
            </div>
            <div>
                Assign Users:
                <form:errors class="bg-danger text-danger" path="users" />
                <form:select path="users" multiple="true">
                    <form:option value="0" label="-- Select users --"/>
                    <form:options items="${users}" itemLabel="fullName" itemValue="id"/>
                </form:select>
            </div>
            <input type="submit" value="Add project">
        </form:form>
    </div>
</div>
<div class="div column-list">
    <div class="bb">
        <p><h3>Projects List</h3></p>
        <div class="cont">
        <c:forEach items="${projects}" var="proj">
            <h5> <strong>Title:</strong> ${proj.name}</h5>
            <h6 class="text-info"><strong>Created: </strong>${proj.createdd}   <a style="margin-left: 5px" href="/delete/project?id=${proj.id}">Delete</a>
                | <a href="/add/editproject?id=${proj.id}">Details</a></h6>
            <h6 class="text-info"><strong>Assigned users:</strong> <c:forEach items="${proj.users}" var="user">
                ${user.fullName},
            </c:forEach></h6>
            <h6 class="text-info"><strong>ID: </strong>${proj.identifier}</h6>
            <h5>${proj.description}</h5>
            <hr>
        </c:forEach>
        </div>
    </div>
</div>
</body>
</html>