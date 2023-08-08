<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/member/backMember.css" />
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
            <div class="container-fluid pt-4 px-4">
                <div class="row bg-secondary rounded align-items-center justify-content-center mx-0">
                   	<h1>會員管理</h1>
                   	<table id="user_data_table">
		                <thead>
		                <tr>
		                    <th>會員編號</th>
		                    <th>信箱</th>
		                    <th>帳號</th>
		                    <th>姓名</th>
		                    <th>身分組</th>
		                    <th>註冊日期</th>
		                    <th>是否啟用</th>
		                </tr>
		                </thead>
		                <tbody>
			                <form:form action="#" method="put" id="user_data">
			                	<jstl:forEach var="user" items="${page.content}">
				                	<tr>
				                		<td>${user.id}</td>
				                		<td>${user.email}</td>
				                		<td>${user.username}</td>
				                		<td>${user.name}</td>
				                		<td>${user.roles[0].name}</td>
				                		<td>${user.registerDate}</td>
				                		<td>
				                			<select class="selection" form="user_data">
				                				<option value="${user.enabled} "selected>${user.enabled}</option>
				                				<option value="${!user.enabled}">${!user.enabled}</option>
				                			</select>
				                			<input type="hidden" id="username" value="${user.username}"/>
				                		</td>
				                	</tr>
			                	</jstl:forEach>
			                </form:form>
		                </tbody>
		            </table>
                </div>
                <div class="pagediv">
                	<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
		            	<jstl:choose>
		            		<jstl:when test="${page.number != pageNumber - 1}">
		            			<a class="onpage" href="${contextRoot}/editMember?p=${pageNumber}">${pageNumber}</a>
		            		</jstl:when>
		            		<jstl:otherwise>
		            			${pageNumber}
		            		</jstl:otherwise>
		            	</jstl:choose>
		            	<jstl:if test="${pageNumber != page.totalPages}">
					            	-
			            </jstl:if>
		            </jstl:forEach>
                </div>
            </div>
            <!-- Blank End -->

           <jsp:include page="../layout/BackFoot.jsp"></jsp:include>
        </div>

	<script>
		$(function() {
			$('.selection').change(function() {
				event.preventDefault();
				let enabled = $(this).val();
				alert(enabled)
				let username = $(this).closest('tr').find('#username').val();
				console.log(username)
				let dtoObject = {
						"username": username,
						"enabled": enabled
				}
				let dtoJsonString = JSON.stringify(dtoObject);
				
				$.ajax({
					url: 'http://localhost:8080/meow/editMember',
					contentType: 'application/json;charset=UTF-8',
					method: 'put',
					data: dtoJsonString,
					success: function (res) {
						console.log(res);
					},
					error: function (err) {
						console.log(err);
					}
				})
			})
		})
	</script>
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
</body>

</html>