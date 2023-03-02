<%--
  Created by IntelliJ IDEA.
  User: Oleksii_Drabchak
  Date: 3/2/2023
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8"/>
  <title>Customer</title>
  <link rel="stylesheet" type="text/css" href="https://cdn.dhtmlx.com/suite/edge/suite.css">
  <script src="https://cdn.dhtmlx.com/suite/edge/suite.js"></script>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
        referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<div class="mt-1 mb-4">
  <a href="${pageContext.request.contextPath}/sets" class="link-dark">Go back</a>
  <br/>
  <a href="${pageContext.request.contextPath}" class="link-dark">Go to home page!</a>
</div>

<span>User: ${customer.username}</span>

<div id="myGrid" class="mt-4"></div>
<script>
  const grid = new dhx.Grid("myGrid", {
    columns: [
      {id: "purchaseId", type: "ro", header: [{text: "ID"}, {content: "inputFilter"}], adjust: "header"},
      {id: "title", type: "ro", header: [{text: "Title"}, {content: "selectFilter"}], adjust: "data"},
      {id: "description", type: "ro", header: [{text: "Description"}], autoWidth: true},
    ],
    data: ${customerPurchases},
    filterMode: "simple",
  });
</script>
</body>
</html>
