<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/member/member-style.css" />
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
					<a href="${contextRoot}/user/center/Tickets" class="member-nav-item member-nav-link"><i
							class="fa fa-th me-2"></i>我的訂票</a>
					<a href="${contextRoot}/user/editProfile" class="member-nav-item member-nav-link"><i
							class="fa fa-th me-2"></i>編輯個人資料</a>
					<jstl:choose>
						<jstl:when test="${profile.user.provider == 'LOCAL'}">
							<a href="${contextRoot}/user/center/changePassword" class="member-nav-item member-nav-link"><i
							class="fa fa-th me-2"></i>修改密碼</a>
						</jstl:when>
					</jstl:choose>

				</div>
			</nav>
		</div>
		<div class="container-member pt-4 px-4">
			<div class="row vh-100 bg-secondary rounded align-items-center justify-content-center mx-0">
				<div class="main">
					<div class="member-data">
						<div>
							<img class="personal-img" src="data:image/jpg;base64,${profile.photo}" alt="">
							<h1 class="membername">${profile.user.name}</h1>
						</div>
						<table>
			                <thead>
			                    <tr>
			                        <th class="thtext">生日</th>
			                        <td class="thtext"><fmt:formatDate pattern="yyyy-MM-dd" value="${profile.birthday}"/></td>
			                    </tr>
			                    <tr>
			                        <th class="thtext">手機</th>
			                        <td class="thtext">${profile.phone}</td>
			                    </tr>
			                    <tr>
			                        <th class="thtext">自我介紹</th>
			                        <td colspan="3">
			                        <textarea rows="5" cols="20" class="form-control" readonly>${profile.introduction}</textarea></td>
			                    </tr>
			                </thead>
			              </table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/NewFoot.jsp"></jsp:include>
</body>

</html>