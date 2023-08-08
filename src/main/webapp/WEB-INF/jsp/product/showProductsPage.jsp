<%--
  Created by IntelliJ IDEA.
  User: volum
  Date: 2023/4/19
  Time: 上午 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<div>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/magnific-popup.css">
    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/jquery-ui.css">
    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/aos.css">

    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/style.css">
</head>
<body>

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
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">建立時間: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${product.added}"/><br>數量: ${product.quantity}</p>
                    </div>
                    <div class="card-footer">
                        <form action="${contextRoot}/product/update">
                            <input type="hidden" name="id" value="${product.id}" />
                            <button type="submit" class="btn btn-primary">編輯</button>
                        </form>
                        <form action="${contextRoot}/product/delete" method="POST">
                            <input type="hidden" name="_method" value="delete" />
                            <input type="hidden" name="id" value="${product.id}" />
                            <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this product?')">刪除</button>
                        </form>
                    </div>
                </div>
            </div>
        </jstl:forEach>
    </div>
</div>
</body>



<%--</jstl:forEach>--%>
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
