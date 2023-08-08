<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html> 
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="${contextRoot}/css/discussion/bootstrap.min.css" />
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/js/discussion/jquery-3.6.4.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</script>
<meta charset="UTF-8" />
<title>User add post</title>
</head>


<!-- 放棄使用此編輯器jsp -->
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: "Roboto", sans-serif;
	background-color: #DAE0E6;
	/* 	background-color: #ccc; */
}

.container {
	display: flex;
	flex-direction: column;
	margin: 50px auto;
	max-width: 1325px;
}

.wrap {
	width: 100%;
	max-width: 640px;
	margin: 0 auto;
	background-color: #ccc;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	border-radius: 5px;
	/* 	background-color: #DAE0E6; */
}

</style>

<body>
	<jsp:include page="../discussion-layout/navbar-frontend.jsp"></jsp:include>
	<div class="container">
	
	<div class="wrap">
	
	
	<form:form method="post" modelAttribute="postDto"  action="${contextRoot}/dic/user/posts/addPost">
    <div class="form-group">
        <label for="inputTitle">標題：</label>
        <form:input path="title" name="title" type="text" class="form-control" id="inputTitle" placeholder="請輸入文章標題"/>
    </div>
<!--     原生屬性不需要關聯 -->
    <textarea id="summernote" name="content"></textarea>
    <button id="submitBtn" class="btn btn-primary">提交</button>
	</form:form>	
		
		
	</div>
	</div>

	<script>
		$(document).ready(function() {
			 $('#summernote').summernote({
				 	
			        placeholder: 'Hello stand alone ui',
			        tabsize: 2,
			        height: 120,
			        toolbar: [
			        	//function
			          ['style', ['style']],
			          ['font', ['bold', 'underline', 'clear']],
			          ['color', ['color']],
			          ['para', ['ul', 'ol', 'paragraph']],
			          ['table', ['table']],
			          ['insert', ['link', 'picture', 'video']],
			          ['view', ['fullscreen', 'codeview', 'help']]
			        ]
			      });
		});
	</script>


</body>

</html>
