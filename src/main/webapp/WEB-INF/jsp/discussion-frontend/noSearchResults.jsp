<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="${contextRoot}/css/discussion/bootstrap.min.css" />
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/js/discussion/jquery-3.6.4.min.js"></script>

<meta charset="UTF-8" />
<title>No search results</title>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: "Roboto", sans-serif;
	background-color: #DAE0E6;
	/* 	background-color: #ccc; */
}

.container {
	display: flex;
	flex-direction: column;
	margin: 50px auto;
	max-width: 1325px;
}

.wrap {
	width: 100%;
	max-width: 640px;
	margin: 0 auto;
	background-color: #ccc;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	border-radius: 5px;
	/* 	background-color: #DAE0E6; */
}

.postNav {
	background-color: #eee;
	border-radius: 5px 5px 0 0;
}

.card {
	margin-bottom: 1.5rem;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.card-title {
	font-weight: bold;
	margin: 10px 0px;
}

.card-body img {
	max-width: 100%;
	max-width: 520px;
}

.card-user {
	font-size: 15px;
	font-weight: 500;
	line-height: 1.2;
}

.post-time {
	font-size: 15px
}

.likeBtn {
	margin-left: 50px;
}

.Image {
	margin-left: auto;
	margin-right: auto;
}

.nav-link {
	font-weight: bold;
	color: #3f3f3f !important;
}

.nav-link.active {
	color: #fff !important;
	background-color: #3f3f3f !important;
}

.movieNameBanner {
	height: 100px;
	width: 100%;
	background-color: #eee;
	padding: 1rem 0;
	margin-top: 50px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 0px;
	/*     z-index: 1000 */
}

.movieNmae {
	font-size: 2rem;
	font-weight: bold;
	text-align: center;
}

.Image {
	display: block;
	margin: 0 auto
}

.fixed-card {
	position: fixed;
	top: 268px;
	left: 200px;
	z-index: 1000;
}

@media ( max-width :1700px) {
	.fixed-card {
		display: none;
	}
}

.backToTop {
	position: fixed;
	bottom: 40px;
	right: 400px;
	z-index: 1000;
}

@media ( max-width : 1600px) {
	.backToTop {
		position: fixed;
		bottom: 40px;
		right: 200px;
		z-index: 1000;
	}
}

@media ( max-width : 1300px) {
	.backToTop {
		bottom: 40px;
		right: 80px;
		z-index: 1000;
	}
}

@media ( max-width : 1085px) {
	.backToTop {
		bottom: 40px;
		right: 50px;
		z-index: 1000;
	}
}

@media ( max-width : 1020px) {
	.backToTop {
		display: none;
	}
}
</style>

<body>
	<jsp:include page="../discussion-layout/navbar-frontend.jsp"></jsp:include>



	<!-- 	<div class="container"> -->
	<!-- 		<div class="wrap"> -->
	<!-- 			<h2>Hm... we couldn’t find any results for 這裏抓取使用者輸入的字</h2> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 	<br /> -->
	<!-- 	<div> -->
	<!-- 		<button class="backToTop btn btn-secondary" id="backToTop">Back -->
	<!-- 			To Top</button> -->
	<!-- 	</div> -->
<body>
	<div class="container">
		<div class="wrap">
			<div class="d-flex align-items-center justify-content-center vh-100">
				<div class="text-center">
					<h3 class="display-1 fw-bold">找不到資料</h3>
					<p class="fs-3">
<!-- 						<span class="text-danger">Opps!</span> Page not found. -->
					</p>
<!-- 					<p class="lead">The page you’re looking for doesn’t exist.</p> -->
					<a href="javascript:window.history.back()" class="btn btn-primary">Go back</a>
				</div>
			</div>
		</div>
	</div>

</body>


<script>
	
</script>


</body>

</html>
