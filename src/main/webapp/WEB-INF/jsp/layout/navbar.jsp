<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
				<!DOCTYPE html>
				<html>

				<head>
					<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
					<meta charset="UTF-8">
				</head>

				<body>
					<nav id="nav" class="navbar navbar-expand-lg navbar-light fixed-top">
						<ul>
							<li class="current"><a href="${contextRoot}/">首頁</a></li>
							<li><a href="#">電影介紹</a>
								<ul>
									<li><a href="${contextRoot}/Movies/addMovie">排片測試</a></li>
									<li><a href="${contextRoot}/Movies/search">TMDB API測試</a></li>
									<li><a href="${contextRoot}/emailEdit">Etiam nisl</a></li>
									<li><a href="#">Sed consequat</a></li>
								</ul>
							</li>
							<li><a href="left-sidebar.html">立即訂票</a></li>
							<li><a href="right-sidebar.html">購物商城</a></li>
							<li><a href="no-sidebar.html">討論區</a></li>
							<li><a href="no-sidebar.html">會員中心</a></li>
							<sec:authorize access="!isAuthenticated()">
								<li><a class="d=flex nav-link" href="${contextRoot}/login">Login</a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<li><a class="d=flex nav-link" href="${contextRoot}/user/center">
										<sec:authentication property="name" />
									</a></li>
								<form:form action="${contextRoot}/logout" method="post" hidden="true" id="logoutForm">
									<input type="submit" value="Logout" />
								</form:form>
								&nbsp;|&nbsp;
								<li><a class="d=flex nav-link" href="" id="logoutLink">Logout</a></li>
							</sec:authorize>
						</ul>
					</nav>
				
					<script src="${contextRoot}/js/discussion/jquery-3.6.4.min.js"></script>
					<script>
						$(document).ready(function () {
							$("#logoutLink").on('click', function (event) {
								event.preventDefault();
								$("#logoutForm").submit();
							})
						})
					</script>
				</body>

				</html>