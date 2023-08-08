<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<title>MoeWie後台-討論區管理</title>
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
<link
	href="${contextRoot}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="${contextRoot}/css/backCSS/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${contextRoot}/css/backCSS/style.css" rel="stylesheet">

<%-- <link rel="stylesheet"
	href="${contextRoot}/css/discussion/bootstrap.min.css" /> --%>
<%-- <script src="${contextRoot}/js/discussion/bootstrap.min.js"></script> --%>
<script src="${contextRoot}/js/discussion/jquery-3.6.4.min.js"></script>
</head>
<style>
h1 {
	text-align: center;
	margin-top: 50px;
}

/* 表格樣式 */
table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 30px;
	max-height: 1000px;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #56637187;
}

th {
	background-color: #566371;
	color: white;
}

/* 模態框樣式 */


.modal-content {
	background-color: #fefefe73;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #e0d9d9;
	width: 80%;
	color:white;
}

.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

/* 表單樣式 */
form {
	margin: 0px auto;
	/* 垂直置中並設定水平邊距 */
	max-width: 600px;
	/* 設定最大寬度 */
}

label {
	display: inline-block;
	width: 80px;
	margin-right: 10px;
}

input[type="text"], input[type="movie"], textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

button[type="submit"], button {
	background-color: #626c76;
	color: white;
	padding: 8px 16px;
	/* 將 padding 調整為 8px 上下、16px 左右 */
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px;
	/* 加上 margin-right 以便將兩個按鈕平行排列 */
}

button[type="submit"]:hover, button:hover {
	background-color: #566371;
}

/* 响應式設計 */
@media screen and (max-width: 600px) {
	/* 表格樣式 */
	th, td {
		display: block;
	}
	tr {
		margin-bottom: 30px;
	}
	th:first-child, td:first-child {
		padding-top: 12px;
	}
	th:last-child, td:last-child {
		padding-bottom: 12px;
	}

	/* 表單樣式 */
	label {
		display: block;
		margin-bottom: 10px;
		width: 100%;
		/* 在小於 600px 的螢幕上將標籤設定為 100% 寬度 */
	}
	input[type="text"], input[type="movie"], textarea {
		margin-bottom: 10px;
	}
	form {
		margin-top: 20px;
	}
}
</style>
<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<jsp:include page="../layout/BackNav.jsp"></jsp:include>


		<!-- Blank Start -->
		<div class="container-fluid pt-4 px-4">
			<div
				class="row bg-secondary rounded align-items-center justify-content-center mx-0">
				<div class="col-md-12 text-center">
					<div class="container">
						<h2>文章總覽</h2>
						<table>
							<tr>
								<th>Post ID</th>
								<th>Post Date</th>
								<th>Edit Date</th>
								<th>文章標題</th>
								<th>文章內容</th>
								<th>圖片</th>
							</tr>
							<jstl:forEach var="post" items="${page.content}">

								<tr>
									<td>${post.postID}</td>
									<td>${post.postDate}</td>
									<td>${post.editDate}</td>
									<td>${post.title}</td>
									<td>${post.content}</td>

									<td><jstl:choose>
											<jstl:when test="${not empty post.base64Image}">
												<img class="Image" alt="Image"
													style="max-width: 120px; width: auto; height: auto;"
													src="data:image/jpeg;base64,${post.base64Image}">
											</jstl:when>
										</jstl:choose>
										</td>
									<td>
										<form action="${contextRoot}/dic/post/edit">
											<input type="hidden" name="postID" value="${post.postID}" />
											<input type="submit" class="btn btn-outline-info btn-sm"
												value="編輯" />
										</form>
										<form action="${contextRoot}/dic/post/delete" method="post">
											<input type="hidden" name="_method" value="delete" /> <input
												type="hidden" name="id" value="${post.postID}" /> <input
												type="submit" class="btn btn-outline-danger btn-sm"
												value="刪除" onclick="return confirm('確定刪除這篇文章嗎？')" />
										</form>
									</td>
								</tr>
							</jstl:forEach>
						</table>
						<nav aria-label="paging">
							<ul class="pagination">
								<jstl:forEach var="pageNumber" begin="1"
									end="${page.totalPages}">
									<li
										class="page-item <jstl:if test="${page.number == pageNumber-1}">active</jstl:if>">
										<a class="page-link"
										href="<jstl:if test="${page.number != pageNumber-1}">${contextRoot}/dic/showAllPosts?p=${pageNumber}</jstl:if>">${pageNumber}</a>
									</li>
								</jstl:forEach>
							</ul>
						</nav>
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
	<script
		src="${contextRoot}/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="${contextRoot}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="${contextRoot}/js/backJS/main.js"></script>
	<script src="${contextRoot}/js/backJS/nav.js"></script>
</body>

</html>