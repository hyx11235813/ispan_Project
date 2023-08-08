<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="${contextRoot}/css/discussion/bootstrap.min.css" />
<script src="${contextRoot}/js/discussion/bootstrap.min.js"></script>
<script src="${contextRoot}/js/discussion/jquery-3.6.4.min.js"></script>

<meta charset="UTF-8">
<title>Index</title>

</head>


<body>
	<jsp:include page="../discussion-layout/navbar.jsp"></jsp:include>
	<%-- 	<jsp:include page="../discussion-layout/addArticleModal.jsp"></jsp:include><!-- 跳出編輯視窗 --> --%>
</body>
</html>