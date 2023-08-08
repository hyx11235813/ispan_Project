<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html>
<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>意見欄</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- pop-up -->
<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- //pop-up -->
<link href="css/easy-responsive-tabs.css" rel='stylesheet'
	type='text/css' />
<link rel="stylesheet" type="text/css" href="css/zoomslider.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/font-awesome.css" rel="stylesheet">
<script type="text/javascript" src="js/modernizr-2.6.2.min.js"></script>
<!--/web-fonts-->
<link href='http://fonts.googleapis.com/css?family=Tangerine:400,700'
	rel='stylesheet' type='text/css'>
<link
	href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<!--//web-fonts-->
</head>
<style>
#floating-text {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: rgba(0, 0, 0, 0.5);
	color: #fff;
	padding: 20px;
	border-radius: 5px;
}
</style>
<body>
	<!--/main-header-->
	<!--/banner-section-->
	<div id="demo-1" class="banner-inner">
		<div class="banner-inner-dott">
			<!--/header-w3l-->
			<div class="header-w3-agileits" id="home">
				<div class="inner-header-agile part2">
					<jsp:include page="layout/NewNav.jsp"></jsp:include>
					<jsp:include page="layout/NewSearchTMDB.jsp"></jsp:include>

				</div>

			</div>
			<!--//header-w3l-->
		</div>
	</div>
	<!--/banner-section-->
	<!--//main-header-->
	<jsp:include page="layout/LoginModal.jsp"></jsp:include>
	<!-- breadcrumb -->
	<div class="w3_breadcrumb">
		<div class="breadcrumb-inner">
			<ul>
				<li><a href="${contextRoot}/">Home</a><i>//</i></li>
				<li>Contact</li>
			</ul>
		</div>
	</div>
	<!-- //breadcrumb -->
	<!--/content-inner-section-->
	<div class="w3_content_agilleinfo_inner">
		<div class="agile_featured_movies">
			<div class="inner-agile-w3l-part-head">
				<h3 class="w3l-inner-h-title">Contact</h3>
				<p class="w3ls_head_para">Add short Description</p>
			</div>
			<div class="w3_mail_grids">
				<form action="${contextRoot}/sendEmail" method="post">
					<div class="col-md-6 w3_agile_mail_grid">
						<span class="input input--ichiro"> <input
							class="input__field input__field--ichiro" type="text" name="name"
							id="input-25" placeholder=" " required=""> <label
							class="input__label input__label--ichiro" for="input-25">
								<span class="input__label-content input__label-content--ichiro">Your
									Name</span>
						</label>
						</span> <span class="input input--ichiro"> <input
							class="input__field input__field--ichiro" type="email"
							name="email" id="input-26" placeholder=" " required=""> <label
							class="input__label input__label--ichiro" for="input-26">
								<span class="input__label-content input__label-content--ichiro">Your
									Email</span>
						</label>
						</span> <span class="input input--ichiro"> <input
							class="input__field input__field--ichiro" type="text"
							name="phoneNumber" id="input-27" placeholder=" " required="">
							<label class="input__label input__label--ichiro" for="input-27">
								<span class="input__label-content input__label-content--ichiro">Your
									Phone Number</span>
						</label>
						</span>

					</div>
					<div class="col-md-6 w3_agile_mail_grid two">
						<textarea name="message" id="input-28" placeholder="Your Message" required=""></textarea>
						<input type="submit" value="Submit">
						<button onclick="autoFillForm()">自動填寫</button>
					</div>
					<div class="clearfix"></div>
				</form>
				<div class="agileits-get-us">
					<ul>
						<li><i class="fa fa-map-marker" aria-hidden="true"></i>United
							States,Utah 10009, USA</li>
						<li><i class="fa fa-phone" aria-hidden="true"></i> +033 111
							222 4567</li>
						<li><i class="fa fa-envelope" aria-hidden="true"></i><a
							href="mailto:info@example.com"> mail@example.com</a></li>
					</ul>

				</div>

			</div>
		</div>
		<div class=" map">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12947831.742778081!2d-95.665!3d37.599999999999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54eab584e432360b%3A0x1c3bb99243deb742!2sUnited+States!5e0!3m2!1sen!2sin!4v1422444552833"></iframe>
		</div>
	</div>

	<!--//content-inner-section-->


	<!--/footer-bottom-->
	<jsp:include page="layout/NewFoot.jsp"></jsp:include>

	<div id="floating-text" style="display: none;">您的意見已發送成功！</div>
	<script src="js/jquery-1.11.1.min.js"></script>
	<!-- Dropdown-Menu-JavaScript -->
	<script>
		$(document).ready(function() {
			$(".dropdown").hover(function() {
				$('.dropdown-menu', this).stop(true, true).slideDown("fast");
				$(this).toggleClass('open');
			}, function() {
				$('.dropdown-menu', this).stop(true, true).slideUp("fast");
				$(this).toggleClass('open');
			});
		});
	</script>
	<script>
    function autoFillForm() {
        document.getElementById("input-25").value = "徐國睿";
        document.getElementById("input-26").value = "gua082811@gmail.com";
        document.getElementById("input-27").value = "0986123456";
        document.getElementById("input-28").value = "這是一封測試訊息";
    }
</script>
	<!-- //Dropdown-Menu-JavaScript -->
	<!-- search-jQuery -->
	<script src="js/main.js"></script>
	<!-- //search-jQuery -->


	<!--/script-->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>

	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 900);
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>

	<script>
		$(document).ready(function() {
			$('form').submit(function(event) {
				event.preventDefault(); // 防止表單提交
				$.ajax({
					url : '${contextRoot}/sendEmail',
					type : 'POST',
					data : $(this).serialize(),
					success : function(response) {
						showSuccessMessage();
						clearInput();
					},
					error : function(error) {
						console.error(error);
						clearInput();
					}
				});
			});
		});
		function showSuccessMessage() {
			var messageBox = $('<div></div>');
			messageBox.css({
				'position' : 'fixed',
				'top' : '10px',
				'right' : '10px',
				'padding' : '10px',
				'background-color' : 'green',
				'color' : 'white',
				'font-size' : '16px',
				'border-radius' : '5px',
				'box-shadow' : '0px 0px 5px rgba(0, 0, 0, 0.3)',
				'z-index' : '9999'
			});
			messageBox.text('意見發送成功');
			$('body').append(messageBox);
			setTimeout(function() {
				messageBox.fadeOut(500, function() {
					messageBox.remove();
				});
			}, 2000);
		}
		function clearInput() {
			$('input[name="name"]').val('');
			$('input[name="email"]').val('');
			$('input[name="phoneNumber"]').val('');
			$('textarea[name="message"]').val('');
		}
	</script>
	<!--end-smooth-scrolling-->
	<script src="js/bootstrap.js"></script>



</body>
</html>