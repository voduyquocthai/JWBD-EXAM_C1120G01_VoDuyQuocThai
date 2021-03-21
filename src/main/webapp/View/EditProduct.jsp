<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add product</title>
    <style>
        #content{
            margin: 25px 25px 0 350px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <jsp:include page="/View/Index.jsp"></jsp:include>
    <div style="margin-left: 220px" id="content">
        <div class="container-fluid">
            <form method="post" style="width: 80%; margin-top: 50px;margin-left: 150px">
                <div class="row"><h2>Edit product </h2></div>
                <div style="margin-top: 20px" class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputName">Name product</label>
                        <input name="name_product" type="text" class="form-control" id="inputName" placeholder="Enter name product" value="${requestScope['product'].getName()}">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPrice">Price</label>
                        <input name="price_product" type="number" class="form-control" id="inputPrice" placeholder="Enter price" value="${requestScope['product'].getPrice()}">
                    </div>
                </div>
                <div style="margin-top: 20px" class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputName">Quantity</label>
                        <input name="quantity_product" type="number" class="form-control" id="inputQuantity" placeholder="Enter quantity" value="${requestScope['product'].getQuantity()}">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputName">Color</label>
                        <input name="color_product" type="text" class="form-control" id="inputColor" placeholder="Enter color" value="${requestScope['product'].getColor()}">
                    </div>
                </div>
                <div class="form-group">
                    <label >Category</label>
                    <div class="checkbox">
                        <select name="category">
                            <c:forEach items="${requestScope['categories']}" var="c">
                                <option value="${c.getId()}">${c.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputDes">Description</label>
                    <input name="des_product" type="text" class="form-control" id="inputDes" placeholder="Enter description" value="${requestScope['product'].getDes()}">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <a href="/admin?ac=list_product" class="btn btn-primary">Back</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
