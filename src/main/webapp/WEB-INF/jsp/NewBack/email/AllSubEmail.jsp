<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
/* 新增排片表單的樣式 */
#add-show-form {
	background-color: #f8f9fa;
	border: 1px solid #dee2e6;
	padding: 20px;
	margin-top: 20px;
	border-radius: 5px;
}

#add-show-form label {
	font-weight: bold;
}

#add-show-form button[type="submit"] {
	margin-top: 10px;
}

/* 調整下拉選單的樣式 */
select.form-select {
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	background-color: #fff;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3E%3Cpath fill='%236c757d' d='M2 0L0 2h4zm0 5L0 3h4z'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right 0.75rem center;
	background-size: 8px 10px;
	padding-right: 2.5rem;
	border: 1px solid #ced4da;
	border-radius: 5px;
}

select.form-select:focus {
	border-color: #80bdff;
	box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

h1 {
	margin-top: 30px;
	margin-bottom: 20px;
	text-align: center;
}

table {
	margin: 0 auto;
	border-collapse: collapse;
	width: 80%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #566371;
	color: white;
}

tr:nth-child(even) {
	background-color: #56637187;
}

form {
	margin-top: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

input[type="datetime-local"], input[type="text"], select {
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: none;
	box-shadow: 1px 1px 3px #ccc;
	width: 80%;
}

input[type="submit"] {
	background-color: #566371;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 30%;
	margin-bottom: 20px;
}

input[type="submit"]:hover {
	background-color: #3e8e41;
}

a:hover {
	color: #3e8e41;
}
</style>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<title>MoeWie後台-訂閱者管理</title>
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
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/backCSS/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/backCSS/style.css" rel="stylesheet">
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
		<div class="container-fluid pt-4 px-4">

			<div
				class="row rounded align-items-center justify-content-center mx-0">
				<h1>訂閱管理</h1>
				<table>
					<tr>
						<th>Email</th>
						<th>CreateDate</th>
					</tr>
					<jstl:forEach items="${subs}" var="sub">
						<tr>
							<td>${sub.email}</td>
							<td>${sub.createdDate}</td>
						</tr>
					</jstl:forEach>
					<button type="button" class="btn btn-primary mb-3"
						id="open-email-body-modal-button">Send Email</button>
				</table>

				<!-- Modal -->
				<div class="modal fade" id="email-body-modal" tabindex="-1"
					aria-labelledby="email-body-modal-label" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="email-body-modal-label" style=color:black;>發送公告信</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<textarea id="email-body-textarea" class="form-control" style=background-color:white></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">關閉</button>
								<button type="button" class="btn btn-primary"
									id="send-email-button">寄出</button>
									<button onclick="autoFillForm()" class="btn btn-primary"
									id="auto">一鍵填寫</button>
									
							</div>
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
		<script src="lib/chart/chart.min.js"></script>
		<script src="lib/easing/easing.min.js"></script>
		<script src="lib/waypoints/waypoints.min.js"></script>
		<script src="lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="lib/tempusdominus/js/moment.min.js"></script>
		<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
		<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

		<!-- Template Javascript -->
		<script src="js/backJS/main.js"></script>
		<script src="js/backJS/nav.js"></script>
		<script>
		$('#open-email-body-modal-button').click(() => {
			  $('#email-body-modal').modal('show');
			});

		$('#send-email-button').click(async () => {
			  try {
			    // Show the loading spinner
			    $('#spinner').addClass('show');

			    const tableData = $('table tr').slice(1).map((i, row) => {
			      const email = $(row).find('td:first-child').text().trim();
			      const createDate = $(row).find('td:nth-child(2)').text().trim();
			      return { email, createDate };
			    }).get();
			    const emailBody = $('#email-body-textarea').val().trim();

			    // Disable the send button
			    $('#send-email-button').prop('disabled', true);

			    const response = await fetch('/meow/send-email', {
			      method: 'POST',
			      headers: { 'Content-Type': 'application/json' },
			      body: JSON.stringify({ tableData, emailBody })
			    });
			    const result = await response.json();

			    if (result.success) {
			      alert('Email寄送成功!');
			    } else {
			      alert('Failed to send email');
			    }
			  } catch (err) {
			    console.error(err);
			    alert('An error occurred while sending the email');
			  } finally {
			    // Hide the loading spinner
			    $('#spinner').removeClass('show');
			    // Enable the send button
			    $('#send-email-button').prop('disabled', false);
			  }
			});
  </script>
  		<script>
	    function autoFillForm() {
	        document.getElementById("email-body-textarea").value = "我們衷心感謝您一直以來對我們網站的支持與信任。我們希望這封信能夠向您傳達我們對您的重要性以及對您的承諾。\n\n"

	        	+"在過去的時間裡，我們一直在努力改進我們的網站以提供更好的使用體驗和服務。我們珍視每一位客戶的意見和建議，並將其視為改善的動力。在您的支持下，我們不斷地學習和成長，以確保我們的網站能夠滿足您的需求。\n\n"

	        	+"我們深知在這個數位化時代，網站已成為企業最重要的窗口之一。因此，我們致力於提供一個功能齊全、易於使用和安全可靠的平台，以確保您能夠方便地瀏覽、尋找信息和進行交易。我們的團隊不斷努力改進網站的性能和速度，以確保您能夠享受流暢的網頁瀏覽體驗。\n\n"

	        	+"除了持續改進網站本身，我們也不斷擴展和更新我們的內容，以提供更多有價值的資訊和服務。無論您是尋找產品資訊、使用指南、最新消息還是與其他用戶互動，我們都希望能夠成為您的首選網站。\n\n"

	        	+"我們理解在這個連接世界的時代，客戶隱私和數據安全是至關重要的。我們承諾採取一切必要的措施來保護您的個人信息和交易安全。我們將持續遵守所有相關法規和規範，以確保您的信任和保護您的利益。\n\n"

	        	+"如果您在使用我們的網站過程中遇到任何問題或困惑，請隨時聯繫我們的客戶服務團隊。我們的專業團隊將全天候為您提供支持和解答疑問。\n\n"

	        	+"最後，再次感謝您對我們的信任和支持。我們將繼續努力，不斷提升我們的網站，以滿足您的期望和需求。我們相信通過不斷改進和提升，我們能夠為您提供更優質的服務和更愉悅的使用體驗。\n\n"

	        	+"我們期待著與您共同成長，並在未來的日子裡為您提供更多價值。再次感謝您的支持，如果您有任何疑問或建議，請隨時與我們聯繫。\n\n"

	        	+"祝您一切順利！";
	    }
	</script>
</body>

</html>