<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>登入會員</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
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
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/member/blank.css" />
</head>

<body>
<jsp:include page="../layout/NewNav.jsp"></jsp:include>
	<div class="container-fluid"></div>
<sec:authorize access="!isAuthenticated()">
	<script type="text/javascript">
		$(function() {
				$('#myModal4').modal('show')
		})
	</script>
</sec:authorize>
<jsp:include page="../layout/LoginModal.jsp"></jsp:include>
<jsp:include page="../layout/NewFoot.jsp"></jsp:include>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>

</html>