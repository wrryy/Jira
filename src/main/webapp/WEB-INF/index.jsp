<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Welcome to GoJira</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<%@ include file="menu.jsp" %>
<br>
<div class=" div column-form">
    <div class="bb">
        <h3 style="margin-top: 35px">Latest Projects</h3>
        <c:forEach items="${projects}" var="proj">
            <h5> Title: ${proj.name}</h5>
            <h6 class="text-info">Created: ${proj.createdd} </h6>
            <h5> Description: ${proj.description}</h5>
            <hr>
        </c:forEach>
    </div>
</div>
<div class="div column-list">
    <div class="bb">
            <h3>Latest Activities:</h3>
        <div class="cont">
            <c:forEach items="${activities}" var="act">
                <h5> ${act}</h5>
                <hr>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
