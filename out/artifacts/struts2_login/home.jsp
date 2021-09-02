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
    <div class="dropdown">
        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
            Select number of registration
        </a>

        <ul class="dropdown-menu" id="registrationCombo" aria-labelledby="dropdownMenuLink">
            <option >5</option>
            <option >10</option>
            <option >15</option>
        </ul>
    </div>

    <div style="display:flex;flex-direction: row;justify-content: flex-end;padding: 20px">
        <input type="text" placeholder="enter email" class="input-user" name="email" id="searchemail" required="">
        <button  type="submit" class="btnSignin" id="btnSearch" name="search" >search</button>

    </div>
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
        <tbody id="tblRegistration" name="tblRegistration" style="color: #333333;cursor: pointer;">
        </tbody>
    </table>

    <label id="lblResponse"></label>
    <br>
    <div style="display: flex;justify-content: center;align-items: center;padding: 20px">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" id="Previous" >Previous</a></li>
                <li class="page-item"><a class="page-link" id="Next" >Next</a></li>
            </ul>
        </nav>
    </div>

</div>


<div id="popup" class="overlay">
    <div class="popup">
        <h2>Update Details</h2>
        <a class="close" href="#">&times;</a>
        <div class="content">

            <div>
                <label style="color: blue">email</label>
                <br>
                <input type="text" placeholder="e mail" class="input-user" name="email" id="email" required="">
                <span class="underline"></span>
            </div>
            <div>
                <label style="color: blue">user name</label>
                <br>
                <input type="text"  placeholder="user name" class="input-user" name="userName" id="userName" required="">
                <span class="underline"></span>
            </div>
            <div>
                <label style="color: blue">address</label>
                <br>
                <input type="text" placeholder="address" class="input-user" name="address" id="address" required="">
                <span class="underline"></span>
            </div>

            <div class="input-box-3">
                <button  type="submit" class="btnSignin" id="btnUpdate" name="update" >Update</button>
            </div>
        </div>
    </div>
</div>


<%--    delete popup--%>
<div id="deleteRow" class="overlay">
    <div class="popup">
        <h2>Confirm Delete</h2>
        <a class="close" href="#">&times;</a>
        <div class="content-2">
            <div class="input-box-3">
                <div style="display: flex;flex-direction: row;justify-content: space-between">
                    <button  type="submit" class="btnSignin" id="delete" name="delete" >remove</button>
                    <a style="width: 60px"></a>
                    <button  type="submit" class="btnSignin" id="btnCancel" >cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--</div>--%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<%--<script src="assets/HomePage.js"></script>--%>
<script>
    let countTo=0;
    let countFrom=5;

    $("#registrationCombo").click(function (evt){
        countTo=0;
        countFrom=$(evt.target).closest("option").text();
        loadData()
    });

    $("#Previous").click(function (){
        if(countTo!=0){
            countTo=countTo-countFrom;
            countFrom=countFrom;
            loadData()
        }
    });

    $("#Next").click(function () {
        countTo=countTo+countFrom;
        countFrom=countFrom;
        loadData()
    });


    var setPassword;
    window.onload=(function (){
        loadData();
    })

    function loadData(){
        $("#tblRegistration").empty();
        $.ajax({
            url: 'loadData',
            dataType : "json",
            async: true,
            data:{
                "countTo":countTo,
                "countFrom":countFrom,
            },
            success: function (response,textState, xhr) {
                for (var i=0; i<response.length; i++) {
                    <%--var row = `<tr><td>${cus.email}</td><td>${cus.userName}</td><td>${cus.address}</td><td>${cus.contact}</td><td>${cus.password}</td><td>${cus.role}</td></tr>`;--%>
                    var row = $('<tr><td >' + response[i].email+ '</td><td>' + response[i].userName + '</td><td>' + response[i].address + '</td><td><a id="up" href="#popup" ><img src="assets/img/update.png" alt=""></a></td><td><a id="delete" href="#deleteRow"><img src="assets/img/delete.png" alt=""></a></td></tr>');
                    $("#tblRegistration").append(row);
                    setPassword=response[i].password;
                }
            }
        });
    }

    $("#tblRegistration").click(function (evt){
        let email = $(evt.target).closest("tr").children('td:eq(0)').text();
        let userName = $(evt.target).closest("tr").children('td:eq(1)').text();
        let adress = $(evt.target).closest("tr").children('td:eq(2)').text();


        $("#email").val(email)
        $("#userName").val(userName)
        $("#address").val(adress)

    })
    $("#btnUpdate").click(function (){
        let email = $("#email").val();
        let userName = $("#userName").val();
        let adress = $("#address").val();
        let password=setPassword;

       $.ajax({
           url: 'updateData',
           dataType: 'json',
           async: true,
           data:{
               email:email,
               userName:userName,
               address:adress,
               password:password,
           },
           success: function (response,textState, xhr) {
               loadData();
               $("#lblResponse").text(response);
           }
       })
    });

    $("#delete").click(function (){
        let email = $("#email").val();

        $.ajax({
            url: 'deleteData',
            dataType: 'json',
            async: true,
            data:{
                email:email,
            },
            success: function (response,textState, xhr) {
                loadData();
                $("#lblResponse").text(response);
            }
        })
    });


    $("#btnSearch").click(function (){
        let email = $("#searchemail").val();
        $("#tblRegistration").empty();
        $.ajax({
            url: 'searchData',
            dataType: 'json',
            async: true,
            data:{
                email:email,
            },
            success: function (response,textState, xhr) {
                if($("#tblRegistration").empty()) {
                    for (var i = 0; i < response.length; i++) {
                        <%--var row = `<tr><td>${cus.email}</td><td>${cus.userName}</td><td>${cus.address}</td><td>${cus.contact}</td><td>${cus.password}</td><td>${cus.role}</td></tr>`;--%>
                        var row = $('<tr><td >' + response[i].email+ '</td><td>' + response[i].userName + '</td><td>' + response[i].address + '</td><td><a id="up" href="#popup" ><img src="assets/img/update.png" alt=""></a></td><td><a id="delete" href="#deleteRow"><img src="assets/img/delete.png" alt=""></a></td></tr>');
                        $("#tblRegistration").append(row);
                        setPassword=response[i].password;
                    }
                }
            }
        })
    })
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</body>
</html>
