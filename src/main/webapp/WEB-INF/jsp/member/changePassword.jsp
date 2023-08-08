<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>會員中心</title>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/member/password-style.css" />
<style>

</style>
</head>

<body>
	<jsp:include page="../layout/NewNav.jsp"></jsp:include>
	<div class="container-fluid position-relative d-flex p-0">
		<div class="sidebar pe-4 pb-3">
			<nav class="member-navbar bg-secondary member-navbar-dark">
					<h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>會員中心</h3>
				<div class="member-navbar-nav w-100">
					<a href="${contextRoot}/user/center" class="member-nav-item member-nav-link active"><i
							class="fa fa-tachometer-alt me-2"></i>個人資料</a>
					<a href="${contextRoot}/user/editProfile" class="member-nav-item member-nav-link"><i
							class="fa fa-th me-2"></i>編輯個人資料</a>
					<a href="${contextRoot}/user/center/changePassword" class="member-nav-item member-nav-link"><i
							class="fa fa-th me-2"></i>修改密碼</a>
				</div>
			</nav>
		</div>
		<div class="container-member pt-4 px-4">
			<div class="row vh-100 bg-secondary rounded align-items-center justify-content-center mx-0">
				<div class="main">
					<div class="member-data">
						<div>
							<h1 class="editHead">修改密碼</h1>
						</div>
						<form:form method="put" action="#">
							<input type="hidden" id="username" value="${username}"/>
							<table>
				                <thead>
				                	<tr>
				                        <th class="thtext">舊密碼</th>
				                        <td>
				                        	<input type="password" class="form-control" id="oldPassword"/>
				                        	<span style="color:red" id="spOldPassword"></span>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th class="thtext">新密碼</th>
				                        <td>
				                        	<input type="password" class="form-control" id="newPassword"/>
				                        	<span style="color:red" id="spPassword"></span>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th class="thtext">再次確認密碼</th>
				                        <td colspan="3">
				                        	<input type="password" class="form-control" id="checkPassword"/>
				                        	<span style="color:red" id="spCheckPassword"></span>
				                        </td>
				                    </tr>
				                </thead>
				              </table>
				              <button id="submitBtn" class="btn btn-primary btn-marg">送出</button>
				              <a href="${contextRoot}/user/center" class="btn btn-danger btn-marg cancle">取消</a>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/NewFoot.jsp"></jsp:include>
	<script>
	$(function () {
		$('#oldPassword').blur(function() {
			let oldPassword = $('#oldPassword').val();
			if(oldPassword === '')
				$('#spOldPassword').text("This field shouldn't be blank");
			else
				$('#spOldPassword').text('');
		})
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
			let oldPassword = $('#oldPassword').val();
			let password = $('#newPassword').val();
			let dtoObject = {
				"username": username,
				"oldPassword": oldPassword,
				"password": password
			}
			let dtoJsonString = JSON.stringify(dtoObject);

			$.ajax({
				url: 'http://localhost:8080/meow/user/center/changePassword',
				contentType: 'application/json;charset=UTF-8',
				method: 'put',
				data: dtoJsonString,
				success: function (res) {
					$('#spOldPassword').text('');
					alert(res.success);
					window.location.href= 'http://localhost:8080/meow/user/center';
				},
				error: function (err) {
					console.log(err);
					let error = err.responseJSON;
					if(error.password)
						$('#spPassword').text(error.password);
					else
						$('#spPassword').text('');
					
					if(error.fail)
						$('#spOldPassword').text(error.fail);
					else
						$('#spOldPassword').text('');
				}
			})

		})
	})
	</script>
	
</body>

</html>