<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
				<!DOCTYPE html>
				<html>

				<head>
					<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
					<meta charset="UTF-8">
					<title>Insert title here</title>
				</head>

				<body>
					<!-- Sidebar Start -->
					<div class="sidebar pe-4 pb-3">
						<nav class="navbar bg-secondary navbar-dark">
							<a href="${contextRoot}/backIndex" class="navbar-brand mx-4 mb-3">
								<h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>MoeWie後台</h3>
							</a>
							<div class="d-flex align-items-center ms-4 mb-4">
								<div class="position-relative">
									<img class="rounded-circle" src="${contextRoot}/img/user.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div
										class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
									</div>
								</div>
								<div class="ms-3">
									<h6 class="mb-0"><sec:authentication property="name" /></h6>
									<span><sec:authentication property="authorities" /></span>
								</div>
							</div>
							<div class="navbar-nav w-100">
								<a href="${contextRoot}/backIndex" class="nav-item nav-link active"><i
										class="fa fa-tachometer-alt me-2"></i>首頁</a>
								<a href="${contextRoot}/emailEdit" class="nav-item nav-link"><i
										class="fas fa-envelope-square"></i>意見管理</a>
								<a href="${contextRoot}/subEdit" class="nav-item nav-link"><i
										class="fa fa-table me-2"></i>訂閱管理</a>
								<a href="${contextRoot}/backMovies" class="nav-item nav-link"><i
										class="fa fa-video"></i>電影管理</a>
								<a href="${contextRoot}/shows" class="nav-item nav-link"><i
										class="fa fa-table me-2"></i>場次管理</a>
										<div class="nav-item dropdown">
									<a href="${contextRoot}/" class="nav-link dropdown-toggle"
									   data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>商城管理</a>
									<div class="dropdown-menu bg-transparent border-0">
										<a href="${contextRoot}/product" class="dropdown-item">商城管理</a>
										<a href="${contextRoot}/orders" class="dropdown-item">訂單管理</a>
									</div>
								</div>
										
								<a href="${contextRoot}/dic/showAllPosts" class="nav-item nav-link"><i
										class="fa fa-table me-2"></i>討論區管理</a>


								<div class="nav-item dropdown">
									<a href="${contextRoot}/backMember" class="nav-link dropdown-toggle"
										data-bs-toggle="dropdown"><i class="fa fa-chart-bar me-2"></i>會員管理</a>
									<div class="dropdown-menu bg-transparent border-0">
										<a href="${contextRoot}/backMember" class="dropdown-item">會員資料</a>
										<a href="${contextRoot}/editMember" class="dropdown-item">會員資料修改</a>
									</div>
								</div>
								<div class="nav-item dropdown">
									<a href="${contextRoot}/" class="nav-link dropdown-toggle"
										data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>昆蟲箱</a>
									<div class="dropdown-menu bg-transparent border-0">
										<a href="${contextRoot}/backStickInsect" class="dropdown-item">竹節蟲</a>
										<a href="${contextRoot}/backLadyBug" class="dropdown-item">瓢蟲</a>
										<a href="${contextRoot}/locust" class="dropdown-item">蝗蟲</a>
										<a href="${contextRoot}/jelly" class="dropdown-item">比較圓的蝗蟲</a>
									</div>
								</div>
							<a href="${contextRoot}/" class="dropdown-item">返回前台</a>
							</div>
						</nav>
					</div>
					<!-- Sidebar End -->


					<!-- Content Start -->
					<div class="content">
						<!-- Navbar Start -->
						<nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
							<a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
								<h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
							</a>
							<a href="#" class="sidebar-toggler flex-shrink-0">
								<i class="fa fa-bars"></i>
							</a>
							<form class="d-none d-md-flex ms-4">
								<input class="form-control bg-dark border-0" type="search" placeholder="Search">
							</form>
							<div class="navbar-nav align-items-center ms-auto">
								<div class="nav-item dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
										<i class="fa fa-envelope me-lg-2"></i>
										<span class="d-none d-lg-inline-flex">訊息</span>
									</a>
									<div
										class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
										<a href="#" class="dropdown-item">
											<div class="d-flex align-items-center">
												<img class="rounded-circle" src="${contextRoot}/img/user.jpg" alt=""
													style="width: 40px; height: 40px;">
												<div class="ms-2">
													<h6 class="fw-normal mb-0">Jhon send you a message</h6>
													<small>15 minutes ago</small>
												</div>
											</div>
										</a>
										<hr class="dropdown-divider">
										<a href="#" class="dropdown-item">
											<div class="d-flex align-items-center">
												<img class="rounded-circle" src="${contextRoot}/img/user.jpg" alt=""
													style="width: 40px; height: 40px;">
												<div class="ms-2">
													<h6 class="fw-normal mb-0">Jhon send you a message</h6>
													<small>15 minutes ago</small>
												</div>
											</div>
										</a>
										<hr class="dropdown-divider">
										<a href="#" class="dropdown-item">
											<div class="d-flex align-items-center">
												<img class="rounded-circle" src="${contextRoot}/img/user.jpg" alt=""
													style="width: 40px; height: 40px;">
												<div class="ms-2">
													<h6 class="fw-normal mb-0">Jhon send you a message</h6>
													<small>15 minutes ago</small>
												</div>
											</div>
										</a>
										<hr class="dropdown-divider">
										<a href="#" class="dropdown-item text-center">See all message</a>
									</div>
								</div>
								<div class="nav-item dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
										<i class="fa fa-bell me-lg-2"></i>
										<span class="d-none d-lg-inline-flex">通知</span>
									</a>
									<div
										class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
										<a href="#" class="dropdown-item">
											<h6 class="fw-normal mb-0">Profile updated</h6>
											<small>15 minutes ago</small>
										</a>
										<hr class="dropdown-divider">
										<a href="#" class="dropdown-item">
											<h6 class="fw-normal mb-0">New user added</h6>
											<small>15 minutes ago</small>
										</a>
										<hr class="dropdown-divider">
										<a href="#" class="dropdown-item">
											<h6 class="fw-normal mb-0">Password changed</h6>
											<small>15 minutes ago</small>
										</a>
										<hr class="dropdown-divider">
										<a href="#" class="dropdown-item text-center">See all notifications</a>
									</div>
								</div>
								<div class="nav-item dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
										<img class="rounded-circle me-lg-2" src="${contextRoot}/img/user.jpg" alt=""
											style="width: 40px; height: 40px;">
										<span class="d-none d-lg-inline-flex">
											<sec:authentication property="name" />
										</span>
									</a>
									<div
										class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
										<a href="#" class="dropdown-item">個人資訊</a>
										<a href="#" class="dropdown-item">設定</a>
										<a href="#" id="logoutLink" class="dropdown-item">登出</a>
										<form:form action="${contextRoot}/logout" method="post" hidden="true"
											id="logoutForm">
											<input type="submit" value="Logout" />
										</form:form>
									</div>
								</div>
							</div>
						</nav>
						<!-- Navbar End -->
						<script src="js/jquery-1.11.1.min.js"></script>
						<script>
							$(function () {
								$("#logoutLink").on('click', function (event) {
									event.preventDefault();
									$("#logoutForm").submit();
								})
							})
						</script>
				</body>

				</html>