<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>GoJira's Project Panel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="menu">
    <a href="/panel/project"><strong>Projects</strong></a>
    <a href="/panel/task">Tasks</a>
    <a href="/panel/user">Users</a>
    <a href="/panel/user">Status</a>
    <%@ include file="../menu.jsp" %>
</div>
<div class=" div column-form">
    <div class="bb">
        <form:form modelAttribute="project" action="/add/editproject" method="post">
            <form:hidden path="id"/>
            <h3>Edit project ${project.name}:</h3>
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
                <form:errors class="bg-danger text-danger" path="users"/>
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
    <div class="bb ainer">
        <h3>${project.name} Details</h3>
        <h6 class="text-info"><strong>Created: </strong>${project.createdd}
            <a style="margin-left: 5px" href="/delete/project?id=${project.id}">Delete</a></h6>
        <h6 class="text-info"><strong>Assigned users:</strong> <c:forEach items="${project.users}" var="user">
            ${user.fullName},
        </c:forEach></h6>
        <h6 class="text-info"><strong>ID: </strong>${project.identifier}</h6>
        <h5>Description: ${project.description}</h5>
        <div class="cont">
            <c:forEach items="${tasks}" var="task">
                <h5><strong>Task title: </strong>${task.name}</h5>
                <h6 class="text-info"><strong>Assigned User: </strong>${task.user.fullName} <a
                        style="margin-left: 25px" href="/delete/task?id=${task.id}">Delete Task</a><br>
                    <strong>Created: </strong>${task.createdd}<br><strong>Priority:</strong>${task.priority.name}<br>
                    <bb style="float: left"><strong>Status: </strong>${task.status.name}  </bb>
                    <br>
                    <form action="/add/changestatus">
                        <input type="hidden" name="id" value="${task.id}">
                        <select name="statusId">
                            <c:forEach items="${stats}" var="status">
                                <option value="${status.id}">${status.name}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" value="Change status">
                    </form>
                </h6>
                <h5 style="clear: both"> ${task.description}</h5>
                <hr>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>