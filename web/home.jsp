<%--
  Created by IntelliJ IDEA.
  User: Hasintha
  Date: 8/31/2021
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="assets/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="body-home">
<div class="col-md-8">
    <table class="table table-success table-striped">
        <thead>
        <tr>
            <th>email</th>
            <th>userName</th>
            <th>Address</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody id="tblRegistration" name="tblRegistration" style="color: gray;cursor: pointer;">
        </tbody>
    </table>

</div>
<%--<div id="popup" class="overlay">--%>
<%--    <div class="popup">--%>
<%--        <h2>new user role</h2>--%>
<%--        <a class="close" href="#">&times;</a>--%>
<%--        <div class="content-new-role">--%>
<%--            <div>--%>
<%--                <input type="text" placeholder="add new role" class="input-user" name="txtnewRole" id="txtnewRole" >--%>
<%--                <span class="underline"></span>--%>
<%--            </div>--%>

<%--            <div class="input-box-3">--%>
<%--                <button  type="submit" class="btnSignin" id="btnAddRole" name="btnAddRole" >add role</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<%--<script src="assets/HomePage.js"></script>--%>
<script>
    window.onload=(function (){
        $.ajax({
            url: 'loadData',
            dataType : "json",
            async: true,
            success: function (response,textState, xhr) {
                for (var i=0; i<response.length; i++) {
                    <%--var row = `<tr><td>${cus.email}</td><td>${cus.userName}</td><td>${cus.address}</td><td>${cus.contact}</td><td>${cus.password}</td><td>${cus.role}</td></tr>`;--%>
                    var row = $('<tr><td id="mail">' + response[i].email+ '</td><td>' + response[i].userName + '</td><td>' + response[i].address + '</td><td><a id="up" ><img src="assets/img/update.png" alt=""></a></td><td><a ><img src="assets/img/delete.png" alt=""></a></td></tr>');
                    $("#tblRegistration").append(row);
                }
            }
        });
    })
</script>
</body>
</html>
