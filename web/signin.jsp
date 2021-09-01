<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>Sign in Page</title>
    <link rel="stylesheet" href="assets/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="body">
<form  >
    <div class="mb-3">
        <label for="inputemail" class="form-label">email</label>
        <input type="email" name="registration.email" class="form-control" id="inputemail" >
    </div>

    <div class="mb-3">
        <label for="inputPassword" class="form-label">Password</label>
        <input type="text" name="registration.password" class="form-control" id="inputPassword" >
    </div>

    <div class="mb-3">
    <a href="signup.jsp">Sign up here</a>
    </div>
    <button type="button" id="btnSend" class="btn btn-primary">Submit</button>
    <br>


    <label id="lblResponse" style="padding-top: 30px;color: gray;font-size: 14px"></label>

</form>

<div style="width: 400px;height: 400px;padding: 0;margin: 0">
    <%@include file="assets/img/home-bg.svg" %>
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script>

    $("#btnSend").click(function (){
        let mail = $("#inputemail").val();
        let password = $("#inputPassword").val();
        $.ajax({
            url: 'getReq',
            dataType : "json",
            async: true,
            data:{
                email:mail,
                password:password,
            },

            success: function (response,textState, xhr) {
                if (response==="success"){
                    window.location.href="home.jsp";
                }else if (response==="fail"){
                    $("#lblResponse").text("Password not match");
                }else{
                    $("#lblResponse").text("Email not found please sign up");
                }
            }
        });
    })
</script>
</body>
</html>
