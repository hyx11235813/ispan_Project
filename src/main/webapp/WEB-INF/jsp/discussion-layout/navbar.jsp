<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/discussion/navbar.css" rel="stylesheet">
<%-- <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet"> --%>



<style type="text/css">
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">電影首頁</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="${contextRoot}/dic/index"><i class="fa fa-camera-retro fa-2x"></i> <span class="nav-text">主頁</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextRoot}/dic/addArticle"><i class="fa fa-camera-retro fa-2x"></i> <span class="nav-text">新增文章</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextRoot}/dic/showAllPosts"><i class="fa fa-globe fa-2x"></i> <span class="nav-text">文章管理</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextRoot}/dic/user/posts/list"><i class="fa fa-globe fa-2x"></i> <span class="nav-text">前端畫面測試</span></a>
                </li>
            </ul>
            <form:form class="d-flex ms-auto" role="search" action="${contextRoot}/dic/showAllPosts/search" method="get">
                <input class="form-control me-2" type="search" placeholder="文章搜尋" name="keyword" aria-label="Search">
                <button class="btn btn-outline-success" type="submit" id="searchTitle">Search</button>
            </form:form>
        </div>
    </div>
</nav>

	<script src="${contextRoot}/webapp/js/jquery-3.6.4.min.js"></script>
	<script src="${contextRoot}/webapp/js/bootstrap.bundle.min.js"></script>
</body>
</html>