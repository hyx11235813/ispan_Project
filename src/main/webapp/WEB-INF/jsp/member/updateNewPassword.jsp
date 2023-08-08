<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>更新密碼</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
<link rel="stylesheet" href="${contextRoot}/css/tmdb.css">
<link href="${contextRoot}/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pop-up -->
<link href="${contextRoot}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<link href="${contextRoot}/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css" />
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/style.css" />
<link href="${contextRoot}/css/font-awesome.css" rel="stylesheet"> 
<script type="text/javascript" src="${contextRoot}/js/modernizr-2.6.2.min.js"></script>
<!--/web-fonts-->
<link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<style>
:root {
    --primary-color: #7584A9;
    --secondary-color: #616161;
    --text-color: #bab1b1;
    --bg-color: #121212;
    --border-color: #212121;
    --font-family: 'Noto Sans TC', sans-serif;
}

body {
    font-family: var(--font-family);
    color: var(--text-color);
    background-color: var(--bg-color);
    margin: 0;
    padding: 0;
}

h1, h2, h3, h4, h5, h6 {
    font-family: var(--font-family);
    margin: 0;
    padding: 0;
    color: var(--secondary-color);
}

a {
    text-decoration: none;
    color: var(--secondary-color);
}
</style>
</head>

<body>
	<jsp:include page="../layout/NewNav.jsp"></jsp:include>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4>更改密碼</h4>
				<div class="login-form">
					<form:form action="#" method="put">
						<input type="hidden" name="username" id="username" value="${user.username}"/>
						<input type="password" name="newPassword" placeholder="New Password" id="newPassword">
						<span style="color:red" id="spPassword"></span>
						<input type="password" name="checkPassword" placeholder="Confirm New Password" id="checkPassword">
						<span style="color:red" id="spCheckPassword"></span>
						<div class="tp">
							<input id="submitBtn" type="submit" value="送出">
						</div>
						<div class="forgot-grid">
							<div class="clearfix"></div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/NewFoot.jsp"></jsp:include>
	<script>
		$(function () {
			$('#checkPassword').blur(function () {
				let password = $('#newPassword').val();
				let checkPassword = $('#checkPassword').val();
				
				if(password === checkPassword)
					$('#spCheckPassword').text('');
				else
					$('#spCheckPassword').text('Password Incorrect!');
			})
			
			$('#submitBtn').click(function (event) {
				event.preventDefault();
				let username = $('#username').val();
				let password = $('#newPassword').val();
				let dtoObject = {
					"username": username,
					"password": password
				}
				let dtoJsonString = JSON.stringify(dtoObject);

				$.ajax({
					url: 'http://localhost:8080/meow/user/newPassword',
					contentType: 'application/json;charset=UTF-8',
					method: 'put',
					data: dtoJsonString,
					success: function (res) {
						window.location.href= res.url;
					},
					error: function (err) {
						console.log(err);
						let error = err.responseJSON;
						if(error.password)
							$('#spPassword').text(error.password);
						else
							$('#spPassword').text('');
					}
				})

			})
		})
	</script>
</body>

</html>