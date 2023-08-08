<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>MoeWie</title>
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css"
	media="all">
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
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
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="css/zoomslider.css" />
<link rel="stylesheet" type="text/css" href="css/table-style.css" />
<link rel="stylesheet" type="text/css" href="css/basictable.css" />
<!-- list-css -->
<link rel="stylesheet" href="css/list.css" type="text/css" media="all" />
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
<style>
  .img-responsiveBig {
    max-width: 57%;
    height: auto;
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
  </style>
</head>
<body>
	<!--/main-header-->
	<!--/banner-section-->
	<div id="demo-1"
		data-zs-src='["images/2.jpg", "images/1.jpg", "images/3.jpg","images/4.jpg"]'
		data-zs-overlay="dots">
		<div class="demo-inner-content">
			<!--/header-w3l-->
			<div class="header-w3-agileits" id="home">
				<div class="inner-header-agile">
					<jsp:include page="layout/NewNav.jsp"></jsp:include>
					<jsp:include page="layout/NewSearchTMDB.jsp"></jsp:include>

				</div>

			</div>
			<!--//header-w3l-->
			<!--/banner-info-->
			<div class="baner-info">
				<h3>
					最新 <span>線上</span>電影 <span>訂票</span>網
				</h3>
				<h4>In space no one can hear you scream.</h4>
				<a class="w3_play_icon1" href="#small-dialog1"> 立即訂票 </a>
			</div>
			<!--/banner-ingo-->
		</div>
	</div>
	<!--/banner-section-->
	<!--//main-header-->
	<jsp:include page="layout/LoginModal.jsp"></jsp:include>
	<!--/content-inner-section-->
	<div class="w3_content_agilleinfo_inner">
		<div class="agile_featured_movies">
			<!--/agileinfo_tabs-->
			<div class="agileinfo_tabs">
				<!--/tab-section-->
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li>近期強檔</li>
						<li>熱門電影</li>
						<li>推薦電影</li>

					</ul>
					<div class="resp-tabs-container">
						<div class="tab1">
							<div class="tab_movies_agileinfo">
								<div class="w3_agile_featured_movies">
									<div id="dynamic-content"></div>
									<div class="col-md-7 wthree_agile-movies_list">
										<div id="movie-list"></div>
										
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="cleafix"></div>
							
						</div>
						<div class="tab2">
							<div class="tab_movies_agileinfo">
								<div class="w3_agile_featured_movies">
									<div id="dynamic-content2"></div>
									<div class="col-md-7 wthree_agile-movies_list">
										<div id="movie-list2"></div>
										
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="cleafix"></div>
							
						</div>
						<div class="tab3">
							<div class="tab_movies_agileinfo">
								<div class="w3_agile_featured_movies">
									<div id="dynamic-content3"></div>
									<div class="col-md-7 wthree_agile-movies_list">
										<div id="movie-list3"></div>
										
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="cleafix"></div>
							
						</div>
					</div>
				</div>

			</div>
			<!--//tab-section-->
			<h3 class="agile_w3_title">
				推薦 <span>商品</span>
			</h3>
			<!--/movies-->
			<div class="w3_agile_latest_movies">
				<div id="owl-demo" class="owl-carousel owl-theme">
					<jstl:forEach var="product" items="${products}" varStatus="status">
					<jstl:if test="${status.index < 8}">
						<div class="item">
							<div class="w3l-movie-gride-agile w3l-movie-gride-slider">
								<a href="${contextRoot}/front/product/details/${product.id}" class="hvr-sweep-to-bottom"> <img
									src="${contextRoot}/indexProductIMG/${product.id}"
									title="${product.name}" class="img-responsive" alt=" " />
									<div class="w3l-action-icon">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
									</div>
								</a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6>
											<a href="single.html">品名:${product.name}</a>
										</h6>
										<p>分類:${product.category}</p>
									</div>
									<div class="mid-2 agile_mid_2_home">
										<p>價格:${product.price}</p>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</div>
						</jstl:if>
					</jstl:forEach>
				</div>
			</div>
			<!--//movies-->
			
			<!--/requested-movies-->
			
			<div id="myTabContent" class="tab-content">
			 <h3 class="agile_w3_title">
				最新 <span>文章</span><a href="${contextRoot}/dic/user/posts/list" class="btn btn-primary" style="float: right; margin-top: 10px;">觀看更多</a>
			</h3>
				<div role="tabpanel" class="tab-pane fade in active" id="home"
					aria-labelledby="home-tab">
					<div class="agile-news-table">
						<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Content</th>
            <th>Post Date</th>
        </tr>
    </thead>
    <tbody>
        <jstl:forEach items="${posts}" var="post" varStatus="status">
            <jstl:if test="${status.index < 5}">
                <tr>
                    <td>${post.title}</td>
                    <td>${post.content}</td>
                    <td>${post.postDate}</td>
                </tr>
            </jstl:if>
        </jstl:forEach>
    </tbody>
</table>

					</div>
				</div>
			</div>
			<!--//requested-movies-->
			<!--/top-movies-->

			<!--//top-movies-->
		</div>
	</div>
	<!--//content-inner-section-->

	<!--/footer-bottom-->
	<jsp:include page="layout/NewFoot.jsp"></jsp:include>

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/index.js"></script>

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
	<!-- //Dropdown-Menu-JavaScript -->


	<script type="text/javascript" src="js/jquery.zoomslider.min.js"></script>
	<!-- search-jQuery -->
	<script src="js/main.js"></script>
	<script src="js/simplePlayer.js"></script>
	<script>
		$("document").ready(function() {
			$("#video").simplePlayer();
		});
	</script>
	<script>
		$("document").ready(function() {
			$("#video1").simplePlayer();
		});
	</script>
	<script>
		$("document").ready(function() {
			$("#video2").simplePlayer();
		});
	</script>
	<script>
		$("document").ready(function() {
			$("#video3").simplePlayer();
		});
	</script>

	<!-- pop-up-box -->
	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	<!--//pop-up-box -->

	<div id="small-dialog1" class="mfp-hide">
		<iframe src=""></iframe>
	</div>
	<div id="small-dialog2" class="mfp-hide">
		<iframe src=""></iframe>
	</div>
	<script>
		$(document).ready(function() {
			$('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
				type : 'inline',
				fixedContentPos : false,
				fixedBgPos : true,
				overflowY : 'auto',
				closeBtnInside : true,
				preloader : false,
				midClick : true,
				removalDelay : 300,
				mainClass : 'my-mfp-zoom-in'
			});

		});
	</script>
	<script src="js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function() {
			$('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion           
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				closed : 'accordion', // Start closed if in accordion view
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
			$('#verticalTab').easyResponsiveTabs({
				type : 'vertical',
				width : 'auto',
				fit : true
			});
		});
	</script>

	<script src="js/owl.carousel.js"></script>
	<script>
		$(document).ready(function() {
			$("#owl-demo").owlCarousel({

				autoPlay : 3000, //Set AutoPlay to 3 seconds
				autoPlay : true,
				navigation : true,

				items : 5,
				itemsDesktop : [ 640, 4 ],
				itemsDesktopSmall : [ 414, 3 ]

			});

		});
	</script>

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
	<!--end-smooth-scrolling-->
	<script src="js/bootstrap.js"></script>



</body>
</html>