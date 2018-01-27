<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Register new Twitter account</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<f:form action="register" method="post" modelAttribute="user">
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
        <input type="submit" value="Create new account"/>
    </div>
</f:form>
</body>
</html>