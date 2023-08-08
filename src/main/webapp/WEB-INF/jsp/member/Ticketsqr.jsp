<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		.wrap{
			overflow:hidden;
			border-radius:10px 10px 0px 0px;
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.35);
		}

		table{
			font-family: 'Oswald', sans-serif;
			border-collapse:collapse;

		}

		th{
			background-color: #365967;
			color:#ffffff;
			width:25vw;
			height:75px;
			text-align: center;
		}

		td{
			background-color: rgba(10, 10, 10, 0.84);
			color:#ffffff;
			width:25vw;
			height:50px;
			text-align:center;
		}

		tr{
			border-bottom: 1px solid #dddddd;
		}

		tr:last-of-type{
			border-bottom: 2px solid #009879;
		}

		tr:nth-of-type(even) td{
			background-color: #383838;
		}
	</style>
	<jsp:include page="../layout/NewNav.jsp"></jsp:include>
</head>

<body>


<div class="row" style=" display: flex;
  justify-content: center;
  align-items: center;">
<div class=" card" style="
	display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;">
	<H2>訂票人 ${user.username}</H2>
	<img src="data:image/png;base64,${base64Image}" class="card-img-top" alt="Card image cap">
	<div class="card-body">
		<p class="card-text">電影名稱 : ${ticket.show.movie.name}</p>
		<p class="card-text">電影時間 : ${ticket.show.time}</p>
		<p class="card-text">電影名稱 : ${ticket.row}-${ticket.seatNumber}</p>
	</div>
</div>
</div>

<jsp:include page="../layout/NewFoot.jsp"></jsp:include>

</body>
</html>