<%@ page import="team3.meowie.ticket.model.Ticket" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <title>Meowie </title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${contextRoot}/js/updatePrice.js"></script>
    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name=""/>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <link href="${contextRoot}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${contextRoot}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${contextRoot}/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/table-style.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/basictable.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/style.css"/>
    <link rel="stylesheet" href="${contextRoot}/css/list.css" type="text/css" media="all"/>
    <link href="${contextRoot}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${contextRoot}/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css"/>
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/style.css"/>
    <link href="${contextRoot}/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="${contextRoot}/js/modernizr-2.6.2.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
    <link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <jsp:include page="../layout/LoginModal.jsp"></jsp:include>
</head>
<body>

<div id="demo-1" class="banner-inner">
    <div class="banner-inner-dott">
        <!--/header-w3l-->
        <div class="header-w3-agileits" id="home">
            <div class="inner-header-agile part2">
                <jsp:include page="../layout/NewNav.jsp"></jsp:include>
            </div>

        </div>
        <!--//header-w3l-->
    </div>
</div>

<div class="d-flex justify-content-center">
    <div class="card border-primary mb-3" style="max-width: 18rem;">
        <div class="card-body text-center">
            <h1 class="card-title">感謝你的訂票<3</h1>
        </div>
        <div class="card-body text-primary">
            <h5 class="card-title">訂票成功</h5>
            <p class="card-text"></p>
            <a href="${contextRoot}/" class="btn btn-primary">回首頁</a>
        </div>
    </div>
</div>



<script>
    setTimeout(function() {
        location.href = '${contextRoot}/user/center/Tickets';
    }, 3000);
</script>
</body>
</html>
