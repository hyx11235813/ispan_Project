<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${contextRoot}/css/discussion/bootstrap.min.css" />
<script src="${contextRoot}/js/discussion/bootstrap.min.js"></script>
<script src="${contextRoot}/js/discussion/jquery-3.6.4.min.js"></script>


<meta charset="UTF-8">
<title>EditPage</title>

<style>
.editor {
	max-width: 800px;
	margin: 70px auto;
	padding: 20px;
	border: 1px solid #ccc;
}

.editForm {
	display: flex;
	flex-direction: column;
}

label {
	font-weight: bold;
}

input[type="text"], textarea {
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

textarea {
	height: 200px;
}

button {
	padding: 10px 20px;
	margin-right: 10px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
}

button[type="submit"] {
	background-color: #4caf50;
	color: #fff;
}

button[type="reset"] {
	background-color: #f44336;
	color: #fff;
}

.preview {
	margin-top: 20px;
	border: 1px solid #ccc;
	padding: 20px;
}

.preview h3 {
	margin-top: 0;
}

.preview h2 {
	margin-top: 0;
	font-size: 24px;
}

.preview img {
	max-width: 40%;
	margin-top: 20px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.button {
	display: flex;
	flex-direction: row;
	justify-content: center;
}
</style>
</head>
<body>
	<jsp:include page="../discussion-layout/navbar.jsp"></jsp:include>
	<div class="editor">
		<form:form modelAttribute="post" method="put"
			action="${contextRoot}/dic/post/edit" enctype="multipart/form-data"
			class="editForm">
			<label for="title">標題：</label>
			<form:input path="postID" type="hidden" />

			<form:input path="title" id="title" placeholder="字數上限40"
				maxlength="40" />
			<br />
			<label for="content">內容：</label>
			<form:textarea path="content" id="content" placeholder="字數上限500"
				maxlength="40"></form:textarea>
			<br />
			<label for="image">圖片：</label>
			<input type="file" id="image" name="image" />
			<br />
			<div class="preview">
				<h3>photo：</h3>
				<h2 id="preview-title"></h2>
				<img id="preview-image"
					src="data:image/png;base64,${post.base64Image}" alt="" />
			</div>
			<br />
			<div class="button">
				<button type="submit">送出</button>
				<button type="reset" onclick="goBack()">取消</button>
			</div>
		</form:form>
	</div>
	<script>
		$('#image').on('change', function(event) {		
		    const file = event.target.files[0];
		    if (file) {
		        const reader = new FileReader();
		        reader.onload = function(e) {
		            $('#preview-image').attr('src', e.target.result);
		        };
		        reader.readAsDataURL(file);
		    }
		});
		function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>
