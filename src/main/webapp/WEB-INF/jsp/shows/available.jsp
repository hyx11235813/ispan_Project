<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
  <title>Contact</title>
  <!-- for-mobile-apps -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="" />
  <script type="${contextRoot}/application/x-javascript">

    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); }

  </script>
  <!-- //for-mobile-apps -->
  <link href="${contextRoot}/css/bootstrap.css" rel="stylesheet" type="text/css"
        media="all" />
  <!-- pop-up -->
  <link href="${contextRoot}/css/popuo-box.css" rel="stylesheet" type="text/css"
        media="all" />
  <!-- //pop-up -->
  <link href="${contextRoot}/css/easy-responsive-tabs.css" rel='stylesheet'
        type='text/css' />
  <link rel="stylesheet" type="text/css" href="${contextRoot}/css/zoomslider.css" />
  <link rel="stylesheet" type="text/css" href="${contextRoot}/css/style.css" />
  <link href="${contextRoot}/css/font-awesome.css" rel="stylesheet">
  <script type="text/javascript" src="${contextRoot}/js/modernizr-2.6.2.min.js"></script>
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
        <jsp:include page="../layout/NewNav.jsp"></jsp:include>
      </div>

    </div>
    <!--//header-w3l-->
  </div>
</div>

<!-- section塞在這裡 -->
<c:forEach var="movie" items="${movies}" >
<!--/content-inner-section-->
<div class="w3_content_agilleinfo_inner">
  <div class="agile_featured_movies">

    <!--/tv-movies-->
<%--    這裡是電影名稱--%>
    <h3 class="agile_w3_title hor-t">movie <span>${movie.name}</span> </h3>

    <div class="wthree_agile-requested-movies tv-movies">
      <!-- 找這裡 jsp 塞這裡 謝謝  -->
      <c:forEach var="show" items="${shows}"><c:if test="${show.movie.id == movie.id}">
      <div class="col-md-3 w3l-movie-grid-agile requested-movies">
        <a href="${contextRoot}/booking/${show.showId}" class="hvr-sweep-to-bottom">

          <img src="${contextRoot}/ticket/img/${show.movie.name}" title="Movies Pro"class="img-responsive" alt=" ">
          <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
        </a>
        <div class="mid-1 agileits_w3layouts_mid_1_home">
          <div class="w3l-movie-text">
            <h6><a href="${contextRoot}/booking/${show.showId}">場次時間${show.time}</a></h6>
          </div>
          <div class="mid-2 agile_mid_2_home">
            <p>影廳 ${show.cinema}</p>
            <div class="clearfix"></div>
          </div>
        </div>
        <div class="ribben one">
          <p>NEW</p>
        </div>
      </div></c:if>
      </c:forEach>
      <div class="clearfix"></div>
    </div>
    <!--//tv-movies-->





    <!--/footer-bottom-->

    <a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover"
                                                                             style="opacity: 1;"> </span></a>

    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- Dropdown-Menu-JavaScript -->
    <script>
      $(document).ready(function () {
        $(".dropdown").hover(
                function () {
                  $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                  $(this).toggleClass('open');
                },
                function () {
                  $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                  $(this).toggleClass('open');
                }
        );
      });
    </script>
    <!-- //Dropdown-Menu-JavaScript -->
    <!-- search-jQuery -->
    <script src="js/main.js"></script>
    <!-- //search-jQuery -->

    <script src="js/simplePlayer.js"></script>
    <script>
      $("document").ready(function () {
        $("#video").simplePlayer();
      });
    </script>
    <script>
      $("document").ready(function () {
        $("#video1").simplePlayer();
      });
    </script>
    <script>
      $("document").ready(function () {
        $("#video2").simplePlayer();
      });
    </script>
    <script>
      $("document").ready(function () {
        $("#video3").simplePlayer();
      });
    </script>
    <script>
      $("document").ready(function () {
        $("#video4").simplePlayer();
      });
    </script>
    <script>
      $("document").ready(function () {
        $("#video5").simplePlayer();
      });
    </script>
    <script>
      $("document").ready(function () {
        $("#video6").simplePlayer();
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
      $(document).ready(function () {
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
    <script src="js/easy-responsive-tabs.js"></script>
    <script>
      $(document).ready(function () {
        $('#horizontalTab').easyResponsiveTabs({
          type: 'default', //Types: default, vertical, accordion
          width: 'auto', //auto or any width like 600px
          fit: true,   // 100% fit in a container
          closed: 'accordion', // Start closed if in accordion view
          activate: function (event) { // Callback function if tab is switched
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
    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
    <script src="js/owl.carousel.js"></script>
    <script>
      $(document).ready(function () {
        $("#owl-demo").owlCarousel({

          autoPlay: 3000, //Set AutoPlay to 3 seconds
          autoPlay: true,
          navigation: true,

          items: 5,
          itemsDesktop: [640, 4],
          itemsDesktopSmall: [414, 3]

        });

      });
    </script>

    <!--/script-->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>

    <script type="text/javascript">
      jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
          event.preventDefault();
          $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 900);
        });
      });
    </script>
    <script type="text/javascript">
      $(document).ready(function () {
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
    <script src="js/bootstrap.js"></script>


</div></div>
</c:forEach>
</body>

</html>
<%--<html>--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <title>Available Shows</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Available Shows</h1>--%>
<%--<table>--%>
<%--  <tbody>--%>
<%--  <c:forEach items="${movies}" var="movie">--%>
<%--    <h2>${movie.name}</h2>--%>
<%--    <table>--%>
<%--      <thead>--%>
<%--      <tr>--%>
<%--        <th>Cinema</th>--%>
<%--        <th>Show Time</th>--%>
<%--      </tr>--%>
<%--      </thead>--%>
<%--      <tbody>--%>
<%--      <c:forEach var="show" items="${shows}">--%>
<%--        <c:if test="${show.movie == movie}">--%>
<%--          <tr>--%>
<%--            <td>${show.cinema}</td>--%>
<%--            <td>${show.time}</td>--%>
<%--          </tr>--%>
<%--        </c:if>--%>
<%--      </c:forEach>--%>
<%--      </tbody>--%>
<%--    </table>--%>
<%--  </c:forEach>--%>
<%--  </tbody>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>