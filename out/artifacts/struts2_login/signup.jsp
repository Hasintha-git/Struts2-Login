<%--
  Created by IntelliJ IDEA.
  User: Hasintha
  Date: 8/30/2021
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>Sign up Page</title>
    <link rel="stylesheet" href="assets/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="body">


<form action = "postReq">

        <div class="mb-3">
            <label for="inputUserName" class="form-label">UserName</label>
            <input type="text" name="registration.userName" class="form-control" id="inputUserName" >
        </div>

        <div class="mb-3">
            <label for="inputemail" class="form-label">email</label>
            <input type="email" name="registration.email" class="form-control" id="inputemail" >
        </div>

        <div class="mb-3">
            <label for="inputaddress" class="form-label">address</label>
            <input type="text" name="registration.address" class="form-control" id="inputaddress" >
        </div>
    <div class="mb-3">
        <label for="inputPassword" class="form-label">Password</label>
        <input type="text" name="registration.password" class="form-control" id="inputPassword" >
    </div>
    <div class="mb-3">
        <a href="signin.jsp">Sign in here</a>
    </div>

    <div class="mb-3">
    <button type="submit" class="btn btn-primary">Submit</button>
    </div>

</form>
<div style="width: 400px;height: 400px;padding: 0;margin: 0">
    <%@include file="assets/img/home-bg.svg" %>
</div>
</body>
</html>
