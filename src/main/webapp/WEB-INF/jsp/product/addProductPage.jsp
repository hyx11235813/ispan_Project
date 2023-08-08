
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- Favicons -->
<link href="${contextRoot}/product/styles/back/assets/img/favicon.png" rel="icon">
<link href="${contextRoot}/product/styles/back/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${contextRoot}/product/styles/back/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextRoot}/product/styles/back/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${contextRoot}/product/styles/back/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${contextRoot}/product/styles/back/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="${contextRoot}/product/styles/back/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="${contextRoot}/product/styles/back/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="${contextRoot}/product/styles/back/assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${contextRoot}/product/styles/back/assets/css/style.css" rel="stylesheet">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>


    <script>


    </script>
</head>

<body>




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
                             <form:select  path="category" class="form-control" id="category" cols="30"
                                       rows="10">
                                 <c:forEach items="${categoryList}" var="category">
                                     <form:option value="${category.cateid}">${category.catename}</form:option>
                                    </c:forEach>
                             </form:select ></div>
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

    <!-- Vendor JS Files -->
    <script src="${contextRoot}/product/styles/back/assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="${contextRoot}/product/styles/back/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${contextRoot}/product/styles/back/assets/vendor/chart.js/chart.umd.js"></script>
    <script src="${contextRoot}/product/styles/back/assets/vendor/echarts/echarts.min.js"></script>
    <script src="${contextRoot}/product/styles/back/assets/vendor/quill/quill.min.js"></script>
    <script src="${contextRoot}/product/styles/back/assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="${contextRoot}/product/styles/back/assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="${contextRoot}/product/styles/back/assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="${contextRoot}/product/styles/back/assets/js/main.js"></script>
</body>

</html>

