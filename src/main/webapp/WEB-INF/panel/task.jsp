<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>GoJira's Tasks Panel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body><div class="menu">
    <a href="/panel/project">Projects</a>
    <a href="/panel/task"><strong>Tasks</strong></a>
    <a href="/panel/user">Users</a>
    <a href="/panel/user">Status</a>
    <a href="/panel/priority">Priority</a>

    <%@ include file="../menu.jsp" %>
</div>
<div class=" div column-form">
    <div class="bb">
        <form:form modelAttribute="task" action="/add/task" method="post">
            <h3>Add new Task:</h3>
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
                Assign User:
                <form:errors class="bg-danger text-danger" path="user"/>
                <form:select items="${users}" path="user" itemLabel="fullName" itemValue="id" multiple="false"/>
            </div>
            <div>
                Assign Project:<br>
                <form:errors class="bg-danger text-danger" path="project"/>
                <form:select items="${projects}" path="project" itemLabel="name" itemValue="id"/>
            </div>
            <div>
                Assign status:<br>
                <form:errors class="bg-danger text-danger" path="status"/>
                <form:select items="${stats}" path="status" itemLabel="name" itemValue="id" />
            </div>
            <div>
                Assign priority:<br>
                <form:errors class="bg-danger text-danger" path="priority"/>
                <form:select items="${prios}" path="priority" itemLabel="name" itemValue="id"/>
            </div>
            <input type="submit" value="Add task">
        </form:form>
    </div>
</div>
<div class="div column-list">
    <div class="bb">
        <p><h3>Tasks List</h3></p>
        <div class="cont">
        <c:forEach items="${tasks}" var="task">
            <h5> <strong>Title: </strong>${task.name}</h5>
            <h6 class="text-info"> <strong>Assigned User: </strong>${task.user.fullName} <a style="margin-left: 25px" href="/delete/task?id=${task.id}">Delete Task</a><br>
                <strong>Created: </strong>${task.createdd}<br><strong>Priority:</strong>${task.priority.name}<br><bb  style="float: left"><strong>Status: </strong>${task.status.name}  </bb>
              <br>
               <form action="/add/changestatus">
                   <input type="hidden" name="id" value="${task.id}">
                   <select name="statusId" >
                       <c:forEach  items="${stats}" var="status">
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