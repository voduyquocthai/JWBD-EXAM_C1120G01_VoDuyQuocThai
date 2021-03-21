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
        <div class="form">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form method="post">
                        <div class="modal-header">
                            <h5 class="modal-title">Delete This Product</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Are You Sure With This Action ???</p>
                        </div>
                        <div class="modal-footer">
                            <input   type="submit" class="btn btn-primary" value="Yes">
                            <a href="/admin?ac=list_product" type="button" class="btn btn-secondary" data-dismiss="modal">Close</a>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
