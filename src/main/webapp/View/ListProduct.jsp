<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Show all product</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        #content {
            margin: 25px 25px 0 350px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <jsp:include page="/View/Index.jsp"></jsp:include>
    <div style="margin-left: 220px" id="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3"><a class="btn btn-warning" href="/admin?ac=add_product">Add New Product</a></div>
                <div class="col-md-6"></div>
                <div class="col-md-3">
                    <form action="/admin?ac=search_product" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control" name="search" placeholder="">
                            <input class="btn btn-primary" type="submit" value="Search">
                        </div>
                    </form>
                </div>
            </div>

            <div style="margin-top: 20px" class="row">
                <table style="margin-top: 50px ; color: black" class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Color</th>
                        <th scope="col">Description</th>
                        <th scope="col">Category</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <c:forEach items='${requestScope["products"]}' var="product">
                        <tr>
                            <td>${product.getId()}</td>
                            <td>${product.getName()}</td>
                            <td>${product.getPrice()}</td>
                            <td>${product.getQuantity()}</td>
                            <td>${product.getColor()}</td>
                            <td>${product.getDes()}</td>
                            <td>${product.getCategory().getName()}</td>
                            <td>
                                <a class="btn btn-primary" href="/admin?ac=edit_product&id=${product.getId()}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd"
                                              d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>
                                    Edit
                                </a>

                                <a class="btn btn-danger" href="/admin?ac=delete_product&id=${product.getId()}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-trash" viewBox="0 0 16 16">
                                        <path
                                                d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z">
                                        </path>
                                        <path fill-rule="evenodd"
                                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z">
                                        </path>
                                    </svg>
                                    Delete
                                </a>

                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="row">
                <div style="margin-top: 25px" class="col-md-3">
                    Showing 0 to 0 of 0 entries
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-8">
                    <div class="col-md-3"></div>
                    <div style="margin-top: 25px ; float: right" class="col-md-3"> Show
                        <select class="selectpicker">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                        <span>Entries</span>
                    </div>
                    <div style="float: right ; margin-top: 17px" class="col-md-6">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">...</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
