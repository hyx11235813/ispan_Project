<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script src="${contextRoot}/webapp/js/jquery-3.6.4.min.js"></script>
<script src="${contextRoot}/webapp/js/bootstrap.bundle.min.js"></script>
<link href="${contextRoot}/css/discussion/navbar.css" rel="stylesheet">
<%-- <link href="${contextRoot}/css/discussion/bootstrap.min.css" rel="stylesheet"> --%>

<style type="text/css">
.navbar {
	background-color: #ffffff;
}

.navbar .nav-link, .navbar, .navbar .nav-link.disabled {
	color: #000000;
}

.nav-item {
	padding: 0px;
	margin: 0px 20px;
}

.container-nav {
	padding: 0px 50px
}

.navbar-nav .nav-link:hover {
	background-color: #eee;
}

.navbar-brand {
	color: #02a388;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid container-nav">
			<a class="navbar-brand " href="${contextRoot}/">MeoWie</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav  my-2 my-lg-0 navbar-nav-scroll"
					style="-bs-scroll-height: 100px;">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="${contextRoot}/">首頁</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${contextRoot}/Movies/search">搜尋電影</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${contextRoot}/login">立即訂票</a></li>
					<%-- 					<li class="nav-item"><a class="nav-link " href="${contextRoot}/login">購物商城</a></li> --%>
					<li class="nav-item"><a class="nav-link active "
						href="${contextRoot}/login">討論區</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${contextRoot}/login">會員中心</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${contextRoot}/dic/user/posts/list">回討論區</a></li>
				</ul>


<!-- 				<div class="d-flex" role="search"> -->
<!-- 					<input class="form-control me-2" type="search" placeholder="搜尋電影名稱" -->
<!-- 						id="searchInput" aria-label="Search"> -->
<!-- 					<button class="btn btn-outline-success" type="button" -->
<!-- 						id="searchButton">Search</button> -->
<!-- 				</div> -->

			</div>
		</div>
	</nav>
	<script type="text/javascript">
		$(document).ready(function() {
			const searchInput = $('#searchInput');
			const searchButton = $('#searchButton');

			//沒輸入内容不能搜尋
			//透過prop依照布林值來設置屬性;input的val如果是空的則設置爲disabled
			searchButton.prop('disabled', !searchInput.val().trim());
			searchInput.on('input', function() {
				searchButton.prop('disabled', !searchInput.val().trim());
			})

		});
	</script>

</body>
</html>