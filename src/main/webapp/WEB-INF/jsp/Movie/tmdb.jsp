<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>電影搜尋</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
<link rel="stylesheet" href="${contextRoot}/css/tmdb.css">
<link href="${contextRoot}/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pop-up -->
<link href="${contextRoot}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<link href="${contextRoot}/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css" />
<link rel="stylesheet" type="text/css" href="${contextRoot}/css/style.css" />
<link href="${contextRoot}/css/font-awesome.css" rel="stylesheet"> 
<script type="text/javascript" src="${contextRoot}/js/modernizr-2.6.2.min.js"></script>
<!--/web-fonts-->
<link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!--//web-fonts-->
<style>
:root {
    --primary-color: #aab7d97d;
    --secondary-color: #d55151;
    --text-color: #bab1b1;
    --bg-color: #121212;
    --border-color: #212121;
    --font-family: 'Noto Sans TC', sans-serif;
}

body {
    font-family: var(--font-family);
    color: var(--text-color);
    background-color: var(--bg-color);
    margin: 0;
    padding: 0;
}

h1, h2, h3, h4, h5, h6 {
    font-family: var(--font-family);
    margin: 0;
    padding: 0;
    color: var(--secondary-color);
}

a {
    text-decoration: none;
    color: var(--secondary-color);
}

.page-title {
    font-size: 2.5rem;
    font-weight: bold;
    text-transform: uppercase;
    color: var(--primary-color);
    margin-bottom: 2rem;
    text-align: center;
}

.search-box {
    background-color: var(--primary-color);
    padding: 2rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-radius: 1rem;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
    position: relative;
    max-width: 600px;
    margin: 0 auto;
    width:80%;
}

.search-box:before {
    content: "";
    position: absolute;
    top: -2px;
    right: -2px;
    bottom: -2px;
    left: -2px;
    z-index: -1;
    background: linear-gradient(135deg, #f9a825, #f57f17);
    border-radius: inherit;
    opacity: 0.6;
}

.search-box input[type="text"] {
    border: none;
    padding: 1rem 2rem;
    flex-grow: 1;
    border-radius: 1rem 0 0 1rem;
    outline: none;
    font-size: 1rem;
    background-color: transparent;
    color: white;
    transition: all 0.2s ease-in-out;
    width:70%;
}

.search-box input[type="text"]:focus {
    background-color: rgba(255, 255, 255, 0.575);
}

.search-box input[type="submit"] {
    font-size: 0.9rem;
    padding: 0.8rem 1.5rem;
    border-radius: 0 1rem 1rem 0;
    border: none;
    background-color: var(--secondary-color);
    color: #fff;
    cursor: pointer;
    transition: all 0.2s ease-in-out;
    height: auto;
    width: auto;
    font-weight: bold;
    text-transform: uppercase;
}

.search-box input[type="submit"]:hover {
    background-color: #efc88e;
}


.result-box {
    margin: 4rem auto;
    width: 90%;
    max-width: 1200px;
    background-color: var(--bg-color);
    padding: 2rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
    border-radius: 0.5rem;
    
}

.result-box h3 {
    font-size: 2.5rem;
    margin: 0;
    color: var(--primary-color);
    font-weight: bold;
    text-transform:uppercase;
	margin-bottom: 2rem;
text-align: center;
}
.result-box .result-item {
	width: calc(33.33% - 2rem); /* 設定為 33.33% 以顯示三個一排 */
    margin: 1rem;
    border: 2px solid var(--border-color);
    border-radius: 0.5rem;
    padding: 2rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
    display: inline-block;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    gap: 1rem;
    transition: all 0.2s ease-in-out;
    background-color: #212121;
     text-align: center;
  vertical-align: top;
	}
	
	.result-box .result-item img {
	width: 100%;
	max-width: 100%;
	height: auto;
	object-fit: cover;
	border-radius: 0.5rem;
	}
	
	.result-box .result-item h4 {
	font-size: 1.8rem;
    margin-top: 2rem;
    margin-bottom: 1rem;
    font-weight: bold;
    color: var(--primary-color);
    text-align: center;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    max-width: 90%;
	}
	
	.result-box .result-item p {
	font-size: 1.4rem;
    margin: 0;
    color: var(--text-color);
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    max-width: 90%;
    text-align: center;
	}
	
	.result-box .result-item:hover {
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.4);
	transform: translateY(-5px);
	}
	
	.result-box .result-item .rating {
	margin-top: 1rem;
	font-size: 1.4rem;
	color: var(--secondary-color);
	text-align: center;
	}
	
	.result-box .result-item .overview {
	margin-top: 1rem;
	font-size: 1.4rem;
	color: var(--text-color);
	text-align: justify;
	text-justify: inter-word;
	max-width: 90%;
	}
	
	.autocomplete-items {
	position: absolute;
	border: 1px solid var(--border-color);
	border-top: none;
	z-index: 99;
	top: 100%;
	left: 0;
	right: 0;
	background-color: #fff;
	max-height: 200px;
	overflow-y: scroll;
	border-radius: 0 0 0.5rem 0.5rem;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
	}
	
	.autocomplete-items div {
	padding: 0.5rem;
	cursor: pointer;
	font-size: 1.5rem;
	color: var(--text-color);
	transition: background-color 0.2s ease-in-out;
	}
	
	.autocomplete-items div:hover {
	background-color: var(--bg-color);
	}
	.search-box input[type="submit"]::placeholder {
    color: var(--text-color);
}
.search-box input[type="submit"]:focus {
    outline: none;
}
.search-btn {
    font-size: 1.2rem;
    padding: 0.5rem 1rem;
    border-radius: 0.5rem;
    border: none;
    background-color: var(--primary-color);
    color: #fff;
    cursor: pointer;
    transition: all 0.2s ease-in-out;
}

.search-btn:hover {
    background-color: #f9cc73d1;
}

.search-btn:focus {
    outline: none;
}


.result-item button {
  font-size: 0.8rem;
  padding: 5px 10px;
  max-width: 80px;
  max-height: 30px;
  overflow: hidden;
    margin-bottom:20px;
}
</style>



</head>
<body>
 	<jsp:include page="../layout/NewNav.jsp"></jsp:include>
	<div>&nbsp;</div>
    <div>&#8203;</div>
    <div>&nbsp;</div>
    <div>&#8203;</div>
    <div>&nbsp;</div>
    <div>&#8203;</div>
	<div class="flex flex-wrap justify-center pt-6">
        <div class="w-full md:w-2/3 xl:w-1/2 px-3">
            <div class="search-box relative">
                <form action="search">
                    <label for="search-input" class="sr-only">搜尋電影</label>
                    <input type="text" id="search-input" placeholder="輸入電影名稱"
                           class="rounded-l-lg p-4 border-t mr-0 border-b border-l text-gray-800 border-gray-200 bg-white"
                           autocomplete="off">
                    <input type="submit" value="搜尋" class="search-btn">
                    <div class="autocomplete-items"></div>
                </form>
            </div>
        </div>
    </div>
    <div class="result-box pt-8">
        <div class="tmdb-result">
            <h3>搜尋結果</h3>
       </div>
  <div class="flex flex-wrap justify-center">
    <jstl:forEach var="movie" items="${movies}">
      <div class="result-item">
        <a href="${contextRoot}/movie?id=${movie.id}">
          <img src="${movie.poster_path ? 'https://image.tmdb.org/t/p/w500/' + movie.poster_path : contextRoot + '/img/default-movie.png'}" alt="${movie.title}">
          <h4>${movie.title}</h4>
        </a>
        <p>${movie.release_date}</p>
      </div>
    </jstl:forEach>
  </div>
</div>
<jsp:include page="../layout/NewFoot.jsp"></jsp:include>
		<script src="${contextRoot}/js/jquery.min.js"></script>
	<script src="${contextRoot}/js/jquery.dropotron.min.js"></script>
	<script src="${contextRoot}/js/browser.min.js"></script>
	<script src="${contextRoot}/js/breakpoints.min.js"></script>
	<script src="${contextRoot}/js/util.js"></script>
	<script src="${contextRoot}/js/main.js"></script>
	<script src="${contextRoot}/js/bootstrap.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script src="${contextRoot}/js/tmdb.js"></script>
	<script src="${contextRoot}/js/jquery-1.11.1.min.js"></script>
	<!-- Dropdown-Menu-JavaScript -->
			<script>
				$(document).ready(function(){
					$(".dropdown").hover(            
						function() {
							$('.dropdown-menu', this).stop( true, true ).slideDown("fast");
							$(this).toggleClass('open');        
						},
						function() {
							$('.dropdown-menu', this).stop( true, true ).slideUp("fast");
							$(this).toggleClass('open');       
						}
					);
				});
			</script>
		<!-- //Dropdown-Menu-JavaScript -->


<script type="text/javascript" src="${contextRoot}/js/jquery.zoomslider.min.js"></script>
		<!-- search-jQuery -->
				<script src="${contextRoot}/js/main.js"></script>
			<script src="${contextRoot}/js/simplePlayer.js"></script>
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
		<script src="${contextRoot}/js/jquery.magnific-popup.js" type="text/javascript"></script>
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
			type: 'inline',
			fixedContentPos: false,
			fixedBgPos: true,
			overflowY: 'auto',
			closeBtnInside: true,
			preloader: false,
			midClick: true,
			removalDelay: 300,
			mainClass: 'my-mfp-zoom-in'
		});
																		
		});
	</script>
<script src="${contextRoot}/js/easy-responsive-tabs.js"></script>
<script>
$(document).ready(function () {
$('#horizontalTab').easyResponsiveTabs({
type: 'default', //Types: default, vertical, accordion           
width: 'auto', //auto or any width like 600px
fit: true,   // 100% fit in a container
closed: 'accordion', // Start closed if in accordion view
activate: function(event) { // Callback function if tab is switched
var $tab = $(this);
var $info = $('#tabInfo');
var $name = $('span', $info);
$name.text($tab.text());
$info.show();
}
});
$('#verticalTab').easyResponsiveTabs({
type: 'vertical',
width: 'auto',
fit: true
});
});
</script>

<script src="${contextRoot}/js/owl.carousel.js"></script>
<script>
	$(document).ready(function() { 
		$("#owl-demo").owlCarousel({
	 
		 autoPlay: 3000, //Set AutoPlay to 3 seconds
		  autoPlay : true,
		   navigation :true,

		  items : 5,
		  itemsDesktop : [640,4],
		  itemsDesktopSmall : [414,3]
	 
		});
	 
	}); 
</script> 

<!--/script-->
<script type="text/javascript" src="${contextRoot}/js/move-top.js"></script>
<script type="text/javascript" src="${contextRoot}/js/easing.js"></script>

<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
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
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
<!--end-smooth-scrolling-->
	<script src="${contextRoot}/js/bootstrap.js"></script>
	

</body>
</html>