<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Customer list</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.dhtmlx.com/suite/edge/suite.css">
    <script src="https://cdn.dhtmlx.com/suite/edge/suite.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css"
          integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q=="
          crossorigin="anonymous"
          referrerpolicy="no-referrer"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js"
            integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<a href="${pageContext.request.contextPath}" class="link-dark">Go to home page!</a>
<br/>
<div class="myForm">
    <section class="w-100 p-4 text-center d-flex justify-content-center">
        <form action="${pageContext.request.contextPath}/sets" method="POST" style="width: 26rem;">
            <div class="form-outline mb-4">
                <input type="text" name="username" id="username" class="form-control" placeholder="Username"/>
            </div>
            <div class="container">
                <select name="plist" class="selectpicker" aria-label="size 3 select example" multiple>
                    <c:forEach var="purchase" items="${purchaseList}">
                        <option value="${purchase.purchaseId}">${purchase.title}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-primary btn-block mb-4">Add</button>
        </form>
    </section>
</div>

<div id="myGrid" style="width: 25%; margin: auto;"></div>

<script>
    const deleteURL = "${pageContext.request.contextPath}/sets/delete";

    let list = [];
    for (let it of ${customerList}) {
        it.action = "<form action='" + deleteURL + "' method='POST'>" +
            "<input type='hidden' name='id' value='" + it.customerId + "'/>" +
            "<button type='submit' class='btn'>" +
            "<i class='fa-solid fa-trash'></i>" +
            "</button>" +
            "</form>";
        list.push(it);
    }

    const grid = new dhx.Grid("myGrid", {
        columns: [
            {id: "customerId", type: "ro", header: [{text: "ID"}, {content: "inputFilter"}], adjust: "header"},
            {id: "username", type: "ro", header: [{text: "Username"}, {content: "selectFilter"}], autoWidth: true},
            {id: "action", header: [{text: "Action"}], htmlEnable: true, align: "center", adjust: "header"},
        ],
        data: list,
        filterMode: "simple",
    });
    grid.events.on("cellDblClick", function (row, column, e) {
        window.location.href = "${pageContext.request.contextPath}/sets/set/" + row.customerId;
    });
</script>
</body>
</html>
