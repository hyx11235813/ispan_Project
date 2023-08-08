<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<title>MoeWie後台-意見管理</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="${contextRoot}/images/backImg/favicon.ico" rel="icon">

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
<link
	href="${contextRoot}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="${contextRoot}/css/backCSS/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${contextRoot}/css/backCSS/style.css" rel="stylesheet">
<style>
/* 標題樣式 */
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
.modal {
	display: none; /* 預設隱藏 */
	position: fixed; /* 固定定位 */
	z-index: 1; /* 確保模態框出現在其他元素上方 */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.6); /* 背景顏色及不透明度 */
}

.modal-content {
	background-color: #fefefe73;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #e0d9d9;
	width: 80%;
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
	margin: 0px auto; /* 垂直置中並設定水平邊距 */
	max-width: 600px; /* 設定最大寬度 */
}

label {
	display: inline-block;
	width: 80px;
	margin-right: 10px;
}

input[type="text"], input[type="email"], textarea {
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
	padding: 8px 16px; /* 將 padding 調整為 8px 上下、16px 左右 */
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px; /* 加上 margin-right 以便將兩個按鈕平行排列 */
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
		width: 100%; /* 在小於 600px 的螢幕上將標籤設定為 100% 寬度 */
	}
	input[type="text"], input[type="email"], textarea {
		margin-bottom: 10px;
	}
	form {
		margin-top: 20px;
	}
}
</style>
</head>

<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<jsp:include page="../layout/BackNav.jsp"></jsp:include>


		<!-- Blank Start -->
		<div class="container-fluid pt-4 px-4 ">
			<div
				class="row bg-secondary rounded align-items-center justify-content-center mx-0">
				<h1>意見管理</h1>
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>姓名</th>
							<th>電子郵件</th>
							<th>電話</th>
							<th>時間</th>
							<th>訊息</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody th:each="email : ${emails}">
						<tr>
							<td th:text="${email.id}"></td>
							<td th:text="${email.name}"></td>
							<td th:text="${email.email}"></td>
							<td th:text="${email.phoneNumber}"></td>
							<td th:text="${email.createdDate}"></td>
							<td th:text="${email.message}"></td>
							<td>
								<button onclick="getEmailById(${email.id})">
									<i class="fas fa-edit"></i> 編輯
								</button>
								<button onclick="deleteEmail(${email.id})">
									<i class="fas fa-trash-alt"></i> 刪除
								</button>
							</td>
						</tr>
					</tbody>
				</table>

				<div id="myModal" class="modal">
				<div class="modal-dialog">
					<div class="modal-content">
						<span class="close">&times;</span>
						<h2>更新資料</h2>
						<form id="update-form" style="color:white;">
							<label>ID:</label> <input type="text" name="id" readonly>

							<label>姓名:</label> <input type="text" name="name"> <label>電子郵件:</label>
							<input type="email" name="email"> <label>訊息:</label>
							<textarea name="message"></textarea>

							<button type="submit">
								<i class="fas fa-save"></i> 更新
							</button>
						</form>
						</div>
					</div>
				</div>

				<!-- Add Movie Form (Hidden by default) -->

				<div id="add-email-form" class="modal" style="display: none;">
					<div class="modal-content">
						<form id="add-form">
							<h2>新增排片</h2>

							<label>片名:</label> <input type="text" name="name"> <label>導演:</label>
							<input type="text" name="director"> <label>演員:</label> <input
								type="text" name="actors"></input> <label>片長:</label> <input
								type="text" name="length"></input> <label>簡介:</label>
							<textarea name="description"></textarea>
							<button type="submit">
								<i class="fas fa-plus-circle"></i> 新增
							</button>
						</form>
					</div>
				</div>
				<!-- Add pagination controls -->
				<div class="d-flex justify-content-center mt-4">
					<nav aria-label="Page navigation">
						<ul class="pagination" id="pagination">
							<!-- Page links will be added dynamically -->
						</ul>
					</nav>
				</div>

			</div>
			<!-- Blank End -->


			<jsp:include page="../layout/BackFoot.jsp"></jsp:include>
		</div>


		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="app.js"></script>
		<script src="js/backJS/nav.js"></script>
		<script>

var currentPage = 1;
var totalPages = 1;

function getAllEmails() {
    $.ajax({
        url: '${contextRoot}/emails',
        type: 'GET',
        success: function (data) {
            var emails = data;
            for (var i = 0; i < emails.length; i++) {
                var email = emails[i];
                $('table tbody').append('<tr><td>' + email.id + '</td><td>' + email.name + '</td><td>' + email.email + '</td><td>' + email.phoneNumber + '</td><td>' + email.createdDate + '</td><td>' + email.message + '</td><td><button onclick="getEmailById(' + email.id + ')"><i class="fas fa-edit"></i> 編輯</button> <button onclick="deleteEmail(' + email.id + ')"><i class="fas fa-trash-alt"></i> 刪除</button></td></tr>');
            }
        }
    });
}
//獲取單個電影
function getEmailById(id) {
    $.ajax({
        url: '${contextRoot}/emails/' + id,
        type: 'GET',
        success: function (data) {
            $('#update-form input[name="id"]').val(data.id);
            $('#update-form input[name="name"]').val(data.name);
            $('#update-form input[name="email"]').val(data.email);
            $('#update-form input[name="phoneNumber"]').val(data.phoneNumber);
            $('#update-form input[name="createdDate"]').val(data.createdDate);
            $('#update-form textarea[name="message"]').val(data.message);


            // 显示模态框
            var modal = document.getElementById("myModal");
            modal.style.display = "block";

            // 当用户点击模态框关闭按钮或模态框外部区域，关闭模态框
            var closeButton = document.getElementsByClassName("close")[0];
            closeButton.onclick = function () {
                modal.style.display = "none";
            };
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        }
    });
}

// 更新现有的电子邮件记录
function updateEmail(event) {
    event.preventDefault();
    var id = $('#update-form input[name="id"]').val();
    var name = $('#update-form input[name="name"]').val();
    var email = $('#update-form input[name="email"]').val();
    var phoneNumber = $('#update-form input[name="phoneNumber"]').val();
    var createdDate = $('#update-form input[name="createdDate"]').val();
    var message = $('#update-form textarea[name="message"]').val();
    var data = {
        'id': id,
        'name': name,
        'email': email,
        'message': message,
        'phoneNumber': phoneNumber,
        'createdDate': createdDate
    };
    $.ajax({
        url: '${contextRoot}/emails/' + id,
        type: 'PUT',
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function (data) {
            console.log(data);
            $('table tbody').empty();
            getAllEmails();

            // 关闭模态框
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }
    });
    }

    // 删除电子邮件记录
    function deleteEmail(id) {
    if (confirm("確定要刪除這封電子郵件嗎？")) {
    $.ajax({
    url: '${contextRoot}/emails/' + id,
    type: 'DELETE',
    success: function (data) {
    console.log(data);
    $('table tbody').empty();
    getAllEmails();
    }
    });
    }
    }

    function showAddEmailForm() {
    $('#add-email-form').show();
    $(document).mouseup(function (e) {
        var container = $("#add-email-form");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            container.hide();
        }
    });
    }

    $(document).ready(function () {
    // 页面加载时获取所有电子邮件记录
    getAllEmails();
 // 添加电子邮件记录
    $('#add-form').submit(function (event) {
        event.preventDefault();
        var name = $('#add-form input[name="name"]').val();
        var email = $('#add-form input[name="email"]').val();
        var phoneNumber = $('#add-form input[name="phoneNumber"]').val();
        var createdDate = $('#add-form input[name="createdDate"]').val();
        var message = $('#add-form textarea[name="message"]').val();
        var data = {
            'name': name,
            'email': email,
            'phoneNumber': phoneNumber,
            'message': message,
            'createdDate': createdDate
        };
        $.ajax({
            url: '${contextRoot}/emails/',
            type: 'POST',
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function (data) {
                console.log(data);
                $('table tbody').empty();
                getAllEmails();
            }
        });
        var modal = document.getElementById("add-email-form");
        modal.style.display = "none";
        // 清空输入框的值
        $('#add-form input[name="name"]').val('');
        $('#add-form input[name="email"]').val('');
        $('#add-form input[name="phoneNumber"]').val('');
        $('#add-form input[name="message"]').val('');
        $('#add-form textarea[name="createdDate"]').val('');

    });
    // 更新电子邮件记录
    $('#update-form').submit(updateEmail);

    // 当用户点击模态框外部区域，关闭模态框
    var modal = document.getElementById("myModal");
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    });
</script>
		<!-- JavaScript Libraries -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${contextRoot}/lib/chart/chart.min.js"></script>
		<script src="${contextRoot}/lib/easing/easing.min.js"></script>
		<script src="${contextRoot}/lib/waypoints/waypoints.min.js"></script>
		<script src="${contextRoot}/lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="${contextRoot}/lib/tempusdominus/js/moment.min.js"></script>
		<script
			src="${contextRoot}/lib/tempusdominus/js/moment-timezone.min.js"></script>
		<script
			src="${contextRoot}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

		<!-- Template Javascript -->
		<script src="${contextRoot}/js/backJS/main.js"></script>
</body>

</html>