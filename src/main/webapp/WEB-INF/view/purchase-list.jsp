<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Purchase list</title>

    <link rel="stylesheet" type="text/css" href="https://cdn.dhtmlx.com/suite/edge/suite.css">
    <script src="https://cdn.dhtmlx.com/suite/edge/suite.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
          referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

</head>
<body>
<a href="${pageContext.request.contextPath}" class="link-dark">Go to home page!</a>
<br/>
<div class="myForm">
    <section class="w-100 p-4 text-center d-flex justify-content-center">
        <form action="${pageContext.request.contextPath}/kpacs" method="POST" style="width: 26rem;">
            <div class="form-outline mb-4">
                <input type="text" name="title" id="title" class="form-control" placeholder="Title"/>
            </div>
            <div class="form-outline mb-4">
                <input type="date" name="date" id="date" class="form-control" placeholder="Date"/>
            </div>
            <div class="form-outline mb-4">
                <textarea name="description" id="description" class="form-control" rows="4"
                          placeholder="Description"></textarea>
            </div>

            <button type="submit" class="btn btn-primary btn-block mb-4">Add</button>
        </form>
    </section>
</div>

<div id="myGrid"></div>


<script>
    const deleteURL = "${pageContext.request.contextPath}/kpacs/delete";

    let list = [];
    for (let it of ${purchaseList}) {
        it.action = "<form action='" + deleteURL + "' method='POST'>" +
            "<input type='hidden' name='id' value='" + it.purchaseId + "'/>" +
            "<button type='submit' class='btn'>" +
            "<i class='fa-solid fa-trash'></i>" +
            "</button>" +
            "</form>";
        list.push(it);
    }

    const grid = new dhx.Grid("myGrid", {
        columns: [
            {id: "purchaseId", type: "ro", header: [{text: "ID"}, {content: "inputFilter"}], adjust: "header"},
            {id: "title", type: "ro", header: [{text: "Title"}, {content: "selectFilter"}], adjust: "data"},
            {id: "description", type: "ro", header: [{text: "Description"}], autoWidth: true},
            {id: "dateCreated", type: "ro", header: [{text: "Date of creation"}, {content: "selectFilter"}], adjust: "header"},
            {id: "action", header: [{text: "Action"}], htmlEnable: true, align: "center", adjust: "header"},
        ],
        data: list,
        filterMode: "simple",
    });
</script>
</body>
</html>