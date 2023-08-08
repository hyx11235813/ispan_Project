<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <meta charset="utf-8">
    <title>MoeWie後台-商品管理</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

      <!-- Favicon -->
<link href="images/backImg/favicon.ico" rel="icon">

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
<%--<link href="${contextRoot}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"--%>
<%--	rel="stylesheet" />--%>

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
        <div class="container">

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent mb-0 pb-0">
                    <li class="breadcrumb-item"><a href="index" class="text-muted">Home</a></li>
                    <%--            <li class="breadcrumb-item"><a href="#" class="text-muted">Tables</a></li>--%>
                    <li class="breadcrumb-item active text-primary" aria-current="page">商品列表</li>
                </ol>
            </nav>
            <h1 class="my-5" >商品列表</h1>
            <hr>
            <form action="${contextRoot}/product/add">
                <input type="hidden" name="id" value="${product.id}" />
                <input type="submit" class="btn btn-primary rounded mb-3" value="新增商品" />
            </form>

            <div class="row row-cols-1 row-cols-md-3 g-4">
                <jstl:forEach var="product" items="${page.content}">
                    <div class="col">
                        <div class="card h-100">
                            <img style="width: 250px "src="${contextRoot}/product/${product.id}" class="card-img-top" alt="${product.name}">
                            <div class="card-body">
<%--                                <h5 class="card-title">${product.name}</h5>--%>
                                <h5 class="card-title" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: #0b0b0b;">${product.name}</h5>
                                <p class="card-text">建立時間: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${product.added}"/><br>數量: ${product.quantity}</p>
                            </div>
                            <div class="card-footer">
                                <div class="btn-group" role="group">
                                    <form action="${contextRoot}/product/update">
                                        <input type="hidden" name="id" value="${product.id}" />
                                        <button type="submit" class="btn btn-dark">編輯</button>
                                    </form>
                                    <form action="${contextRoot}/product/delete" method="POST">
                                        <input type="hidden" name="_method" value="delete" />
                                        <input type="hidden" name="id" value="${product.id}" />
                                        <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this product?')">刪除</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </jstl:forEach>
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

<%--  Page   --%>
        <div class="col-md-12 text-center">

            <div class="site-block-27">
                <jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
                    <jstl:choose>
                        <jstl:when test="${page.number != pageNumber-1 }">
                            <a class="btn btn-primary rounded mb-3"  href="${contextRoot}/product?p=${pageNumber}">${pageNumber}</a>
                        </jstl:when>
                        <jstl:otherwise>
                            ${pageNumber}
                        </jstl:otherwise>

                    </jstl:choose>

                    <jstl:if test="${page.number != page.totalPages }">
                        <span> | </span>
                    </jstl:if>

                </jstl:forEach>
            </div>


        </div>
    </div>
    </div>
</body>

</html>