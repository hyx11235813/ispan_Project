<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
h1 {
	text-align: center;
	margin-top: 50px;
}

/* 表格樣式 */
table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 30px;
	max-height: 1000px;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #56637187;
}

th {
	background-color: #566371;
	color: white;
}

/* 模態框樣式 */


.modal-content {
	background-color: #fefefe73;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #e0d9d9;
	width: 80%;
	color:white;
}

.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

/* 表單樣式 */
form {
	margin: 0px auto;
	/* 垂直置中並設定水平邊距 */
	max-width: 600px;
	/* 設定最大寬度 */
}

label {
	display: inline-block;
	width: 80px;
	margin-right: 10px;
}

input[type="text"], input[type="movie"], textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

button[type="submit"], button {
	background-color: #626c76;
	color: white;
	padding: 8px 16px;
	/* 將 padding 調整為 8px 上下、16px 左右 */
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px;
	/* 加上 margin-right 以便將兩個按鈕平行排列 */
}

button[type="submit"]:hover, button:hover {
	background-color: #566371;
}

/* 响應式設計 */
@media screen and (max-width: 600px) {
	/* 表格樣式 */
	th, td {
		display: block;
	}
	tr {
		margin-bottom: 30px;
	}
	th:first-child, td:first-child {
		padding-top: 12px;
	}
	th:last-child, td:last-child {
		padding-bottom: 12px;
	}

	/* 表單樣式 */
	label {
		display: block;
		margin-bottom: 10px;
		width: 100%;
		/* 在小於 600px 的螢幕上將標籤設定為 100% 寬度 */
	}
	input[type="text"], input[type="movie"], textarea {
		margin-bottom: 10px;
	}
	form {
		margin-top: 20px;
	}
}
</style>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <meta charset="utf-8">
    <title>DarkPan - Bootstrap 5 Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

   <!-- Favicon -->
<link href="images/backImg/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="${contextRoot}/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="${contextRoot}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="${contextRoot}/css/backCSS/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${contextRoot}/css/backCSS/style.css" rel="stylesheet">
</head>

<body>

    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <jsp:include page="../layout/BackNav.jsp"></jsp:include>


            <!-- Blank Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row  bg-secondary rounded align-items-center justify-content-center mx-0">
                    <div class="col-md-6 text-center">
                    <h2>文章編輯</h2>
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
					src="data:image/png;base64,${post.base64Image}" alt="" style="width:50%" />
			</div>
			<br />
			<div class="button">
				<button type="submit">送出</button>
				<button type="reset" onclick="goBack()">取消</button>
			</div>
		</form:form>
	</div>
                    </div>
                </div>
            </div>
            <!-- Blank End -->


           <jsp:include page="../layout/BackFoot.jsp"></jsp:include>
        </div>



	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${contextRoot}/lib/chart/chart.min.js"></script>
	<script src="${contextRoot}/lib/easing/easing.min.js"></script>
	<script src="${contextRoot}/lib/waypoints/waypoints.min.js"></script>
	<script src="${contextRoot}/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${contextRoot}/lib/tempusdominus/js/moment.min.js"></script>
	<script src="${contextRoot}/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="${contextRoot}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="${contextRoot}/js/backJS/main.js"></script>
	<script src="${contextRoot}/js/backJS/nav.js"></script>
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