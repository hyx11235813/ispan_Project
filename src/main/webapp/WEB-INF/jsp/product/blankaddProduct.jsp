<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <meta charset="utf-8">
    <title>DarkPan - Bootstrap 5 Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${contextRoot}/images/backImg/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
            rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
            rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${contextRoot}/lib/owlcarousel/assets/owl.carousel.min.css"
          rel="stylesheet">
    <link href="${contextRoot}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
          rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextRoot}/css/backCSS/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${contextRoot}/css/backCSS/style.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid position-relative d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <jsp:include page="../layout/BackNav.jsp"></jsp:include>


    <!-- Blank Start -->
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-8">
            <h1>新增產品</h1>
            <div class="card">
                <div class="card-header"></div>
                <div  class="card-body">
                    <form:form class="form-control" modelAttribute="product"
                               method="post" action="${contextRoot}/product/post" enctype="multipart/form-data">
                        <div style="margin-bottom: 8px">
                            <span>數量</span>
                            <form:input path="quantity" class="form-control" id="" cols="30"
                                        rows="10"></form:input></div>
                        <div style="margin-bottom: 8px">
                            <span>名字</span>
                            <form:input  path="name" class="form-control" id="" cols="30"
                                         rows="10"></form:input ></div>
                        <div style="margin-bottom: 8px">
                                <%--                            <span>圖檔</span>--%>
                                <%--                            <form method="post" enctype="multipart/form-data action=uploadImage">--%>
                                <%--                                <input type="hidden" name="id" value="${products.id}" />--%>
                                <%--                                <input type="file" name="imageFile" />--%>
                                <%--                                <input type="submit" value="上傳圖片" />--%>
                            <form:input  action="/upload" type="file" path="ImageFile" class="form-control" id="" cols="30" rows="10" readonly="true"></form:input >
                                <%--                            <img src="data:image/png;base64,${Base64.getEncoder().encodeToString(product.image)}" />--%>
                        </div>
                        <div style="margin-bottom: 8px">
                            <span>分類</span>
                            <form:input  path="category" class="form-control" id="category" cols="30"
                                         rows="10"></form:input ></div>
                        <div style="margin-bottom: 8px">
                            <span>價格</span>
                            <form:input  path="price" class="form-control" id="" cols="30"
                                         rows="10"></form:input ></div>
                        <div style="margin-bottom: 8px">
                            <span>說明</span>
                            <form:input  path="description" class="form-control" id="" cols="30"
                                         rows="10"></form:input ></div>

                        <button type="submit" class="btn btn-primary">送出</button>
                    </form:form>
                    <a href="${contextRoot}/product" class="btn btn-secondary">返回</a>

                </div>
            </div>

            <br />
            <div class="card">
                <div class="card-header">最新的資料 時間: <span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${latest.added}"/></span></div>
                <div class="card-body">



                </div>
            </div>
        </div>
    </div>
</div>
<!-- Blank End -->


<jsp:include page="../layout/BackFoot.jsp"></jsp:include>
</div>



<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/lib/chart/chart.min.js"></script>
<script src="${contextRoot}/lib/easing/easing.min.js"></script>
<script src="${contextRoot}/lib/waypoints/waypoints.min.js"></script>
<script src="${contextRoot}/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/moment.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="${contextRoot}/js/backJS/main.js"></script>
<script src="${contextRoot}/js/backJS/nav.js"></script>
</body>

</html>