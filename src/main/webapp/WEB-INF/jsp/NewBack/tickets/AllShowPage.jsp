<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
/* 新增排片表單的樣式 */
#add-show-form {
	background-color: #f8f9fa;
	border: 1px solid #dee2e6;
	padding: 20px;
	margin-top: 20px;
	border-radius: 5px;
}

#add-show-form label {
	font-weight: bold;
}

#add-show-form button[type="submit"] {
	margin-top: 10px;
}

/* 調整下拉選單的樣式 */
select.form-select {
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	background-color: #fff;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3E%3Cpath fill='%236c757d' d='M2 0L0 2h4zm0 5L0 3h4z'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right 0.75rem center;
	background-size: 8px 10px;
	padding-right: 2.5rem;
	border: 1px solid #ced4da;
	border-radius: 5px;
}

select.form-select:focus {
	border-color: #80bdff;
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

h1 {
	margin-top: 30px;
	margin-bottom: 20px;
	text-align: center;
}

table {
	margin: 0 auto;
	border-collapse: collapse;
	width: 80%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #566371;
	color: white;
}

tr:nth-child(even) {
	background-color: #56637187;
}

form {
	margin-top: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

input[type="datetime-local"], input[type="text"], select {
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: none;
	box-shadow: 1px 1px 3px #ccc;
	width: 80%;
}

input[type="submit"] {
	background-color: #566371;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 30%;
	margin-bottom: 20px;
}

input[type="submit"]:hover {
	background-color: #3e8e41;
}

a:hover {
	color: #3e8e41;
}
</style>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<title>MoeWie後台-訂票管理</title>
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
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/backCSS/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/backCSS/style.css" rel="stylesheet">
</head>

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
				class="row rounded align-items-center justify-content-center mx-0">
				<h1>排片管理</h1>
				<table>
					<tr>
						<th>ID</th>
						<th>Movie Name</th>
						<th>Show Time</th>
						<th>Cinema</th>
						<th>訂票</th>
					</tr>
					<jstl:forEach items="${shows}" var="show">
						<tr>
							<td>${show.showId}</td>
							<td>${show.movie.name}</td>
							<td>${show.time}</td>
							<td>${show.cinema}</td>
							<td><a
								href="${contextRoot}/booking/admin/${show.showId}">訂票座位表</a>
							</td>
						</tr>
					</jstl:forEach>
					<button class="btn btn-primary mb-3" id="add-show-btn"
						data-bs-toggle="modal" data-bs-target="#add-show-modal">新增排片</button>
				</table>
				<!--新增的表單 -->
				<!-- 新增排片表單 -->
				<div class="modal fade" id="add-show-modal" tabindex="-1"
					aria-labelledby="add-show-modal-label" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="${contextRoot}/shows" method="post"
								id="add-show-form">
								<div class="modal-header">
									<h5 class="modal-title" style="color:#333333" id="add-show-modal-label">新增排片</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="mb-3">
										<label for="movie" class="form-label">電影:</label> <select
											id="movie" name="movieId" class="form-select">
											<option value="">-- 選擇一部電影 --</option>
											<jstl:forEach items="${movies}" var="movie">
												<option value="${movie.id}">${movie.name}</option>
											</jstl:forEach>
										</select>
									</div>
									<div class="mb-3">
										<label for="time" class="form-label">時間:</label> <input
											type="datetime-local" id="time" name="time"
											class="form-control" style="background-color: white;">
									</div>
									<div class="mb-3">
										<label for="cinema" class="form-label">影城:</label> <input
											type="text" id="cinema" name="cinema" class="form-control"
											style="background-color: white;">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">關閉</button>
									<button type="submit" class="btn btn-primary">新增排片</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
			<!-- Blank End -->


			<jsp:include page="../layout/BackFoot.jsp"></jsp:include>
		</div>

</div>

		<!-- JavaScript Libraries -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="lib/chart/chart.min.js"></script>
		<script src="lib/easing/easing.min.js"></script>
		<script src="lib/waypoints/waypoints.min.js"></script>
		<script src="lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="lib/tempusdominus/js/moment.min.js"></script>
		<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
		<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

		<!-- Template Javascript -->
		<script src="js/backJS/main.js"></script>
		<script src="js/backJS/nav.js"></script>
		<script>
			$(document).ready(function() {
				$("#add-show-form").on("submit", function() {
					// 關閉 Modal 組件
					$("#add-show-modal").modal("hide");

					// 重新載入頁面
					location.reload();
				});
			});
		</script>
</body>

</html>