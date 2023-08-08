<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>

<!--//web-fonts-->
    <title>Title</title>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/magnific-popup.css">
    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/jquery-ui.css">
    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/aos.css">

    <link rel="stylesheet" href="${contextRoot}/product/styles/front2/css/style.css"> 

</head>
<body>


<div class="row">
    <div class="col-md-12">
        <div class="site-section site-blocks-2">
            <div class="row justify-content-center text-center mb-5">
                <div class="col-md-7 site-section-heading pt-4">
                    <h2></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                    <a class="block-2-item" href="#">
                        <figure class="image">
                            <img src="${contextRoot}/product/styles/front2/images/camera1.jpg" alt="" class="img-fluid">
                        </figure>
                        <div class="text">
                            <span class="text-uppercase">Collections</span>
                            <h3></h3>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
                    <a class="block-2-item" href="#">
                        <figure class="image">
                            <img src="${contextRoot}/product/styles/front2/images/ironman1.jpg" alt="" class="img-fluid">
                        </figure>
                        <div class="text">
                            <span class="text-uppercase">Collections</span>
                            <h3></h3>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
                    <a class="block-2-item" href="#">
                        <figure class="image">
                            <img src="${contextRoot}/product/styles/front2/images/popcorn1.png" alt="" class="img-fluid">
                        </figure>
                        <div class="text">
                            <span class="text-uppercase">Collections</span>
                            <h3></h3>
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>

</div>
</div>

<div class="bg-light py-3">
    <div class="container">
        <div class="row">
            <div class="col-md-12 mb-0"><a href="${contextRoot}/product/front/showProducts">Home</a> <span class="mx-2 mb-0">/</span> <strong
                    class="text-black">Shop</strong></div>
        </div>
    </div>
</div>

<div class="site-section m-auto">
    <div class="container m-auto ">

        <div class="row mb-5 m-auto">
            <div class="col-md-9 order-2">

                <div class="row">
                    <div class="col-md-12 mb-5">
                        <div class="float-md-left mb-4">
                            <h2 class="text-black h5">全部商品</h2>
                        </div>
                        <div class="d-flex">
                            <div class="dropdown mr-1 ml-md-auto">
                                <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Latest
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                                    <a class="dropdown-item" href="#">食物</a>
                                    <a class="dropdown-item" href="#">周邊</a>
                                    <a class="dropdown-item" href="#">票</a>
                                </div>
                            </div>
                            <div class="btn-group">
                                <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuReference"
                                        data-toggle="dropdown">Reference</button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                                    <a class="dropdown-item" href="#">Relevance</a>
                                    <a class="dropdown-item" href="#">Name, A to Z</a>
                                    <a class="dropdown-item" href="#">Name, Z to A</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Price, low to high</a>
                                    <a class="dropdown-item" href="#">Price, high to low</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="width: 1100px" class="d-flex flex-wrap justify-content-around" data-aos="fade-up">
                    <jstl:forEach var="product" items="${page.content}">
                        <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                            <div class="block-4 text-center border">
                                <div class="portfolio-wrap">
                                    <figure class="block-4-image">
                                        <a href="${contextRoot}/front/product/details/${product.id}" title="More Details">
                                            <img src="${contextRoot}/product/pig/${product.id}" alt="${product.name}" class="img-fluid">
                                        </a>

                                    </figure>
                                </div>
                                <div class="block-4-text p-4">
                                    <h3><a>${product.name}</a></h3>
                                    <p class="mb-0">${product.category}</p>
                                    <p class="text-primary font-weight-bold">$${product.price}</p>
                                </div>
                            </div>
                        </div>
                    </jstl:forEach>
                </div>




<%--                <div class="row mb-5">--%>


<%--                    <div  style="width: 1500px" class="d-flex flex-wrap justify-content-around" data-aos="fade-up">--%>
<%--                        <jstl:forEach var="product" items="${page.content}">--%>
<%--                        <div class="block-4 text-center border">--%>
<%--                            <div class="portfolio-wrap">--%>
<%--                            <figure class="block-4-image">--%>
<%--                                <img src="${contextRoot}/product/pig/${product.id}" alt=""--%>
<%--                                                                class="img-fluid" ></a>--%>

<%--                            </figure>--%>
<%--                            </div>--%>
<%--                            <div class="block-4-text p-4">--%>
<%--                                <h3><a href="shop-single.html">${product.name}</a></h3>--%>
<%--                                <p class="mb-0">${product.category}</p>--%>
<%--                                <p class="text-primary font-weight-bold">$${product.price}</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>


<%--                    </jstl:forEach>--%>
<%--                    </div>--%>
<%--    <div class="col-md-12 text-center">--%>





<%--                </div>--%>
<%--            </div>--%>

            <div class="col-md-3 order-1 mb-5 mb-md-0">


            </div>
        </div>
    </div>

    <div class="site-block-27 col-md-12 text-center">
        <ul>
            <li>
<%--                <a href="${contextRoot}/product/front/showProducts?p=${page.number - 1}" ${page.first ? 'class="disabled"' : ''}>&lt;</a>--%>
<%--    <a href="${contextRoot}/product/front/showProducts?p=${page.number - 1}" ${page.first ? 'class="disabled"' : ''} ${page.number == 1 ? 'disabled' : ''}>&lt;</a>--%>

            </li>
            <jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
                <c:set var="isActive" value="${page.number == pageNumber - 1}" />
                <li>
                    <a class="${isActive ? 'active' : ''}" href="${contextRoot}/product/front/showProducts?p=${pageNumber}">${pageNumber}</a>
                </li>
            </jstl:forEach>
            <li>
<%--                <a href="${contextRoot}/product/front/showProducts?p=${page.number + 1}" ${page.last ? 'class="disabled"' : ''}>&gt;</a>--%>
            </li>
        </ul>
    </div>


    <footer class="site-footer border-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="footer-heading mb-4">Navigations</h3>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <ul class="list-unstyled">
                                <li><a href="#">Sell online</a></li>
                                <li><a href="#">Features</a></li>
                                <li><a href="#">Shopping cart</a></li>
                                <li><a href="#">Store builder</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <ul class="list-unstyled">
                                <li><a href="#">Mobile commerce</a></li>
                                <li><a href="#">Dropshipping</a></li>
                                <li><a href="#">Website development</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <ul class="list-unstyled">
                                <li><a href="#">Point of sale</a></li>
                                <li><a href="#">Hardware</a></li>
                                <li><a href="#">Software</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
                    <h3 class="footer-heading mb-4">Promo</h3>
                    <a href="#" class="block-6">
                        <img src="images/hero_1.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
                        <h3 class="font-weight-light  mb-0">Finding Your Perfect Shoes</h3>
                        <p>Promo from nuary 15 &mdash; 25, 2019</p>
                    </a>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="block-5 mb-5">
                        <h3 class="footer-heading mb-4">Contact Info</h3>
                        <ul class="list-unstyled">
                            <li class="address">704 台南市 北區 樂活街101號16樓 meow影城</li>
                            <li class="phone"><a href="tel://23923929210">o6 2338361023</a></li>
                            <li class="email">emailaddress@domain.com</li>
                        </ul>
                    </div>

                    <div class="block-7">
                        <form action="#" method="post">
                            <label for="email_subscribe" class="footer-heading">Subscribe</label>
                            <div class="form-group">
                                <input type="text" class="form-control py-4" id="email_subscribe" placeholder="Email">
                                <input type="submit" class="btn btn-sm btn-primary" value="Send">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row pt-5 mt-5 text-center">
                <div class="col-md-12">
                    <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script data-cfasync="false"
                                src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
                        <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made
                        with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank"
                                                                                 class="text-primary">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>

            </div>
        </div>
    </footer>
</div>

<script src="${contextRoot}/product/styles/front2/js/jquery-3.3.1.min.js"></script>
<script src="${contextRoot}/product/styles/front2/js/jquery-ui.js"></script>
<script src="${contextRoot}/product/styles/front2/js/popper.min.js"></script>
<script src="${contextRoot}/product/styles/front2/js/bootstrap.min.js"></script>
<script src="${contextRoot}/product/styles/front2/js/owl.carousel.min.js"></script>
<script src="${contextRoot}/product/styles/front2/js/jquery.magnific-popup.min.js"></script>
<script src="${contextRoot}/product/styles/front2/js/aos.js"></script>

<script src="${contextRoot}/product/styles/front2/js/main.js"></script>
<script src="../../js/jquery-1.11.1.min.js"></script>
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
	<!-- search-jQuery -->
	<script src="../../js/main.js"></script>
	<!-- //search-jQuery -->


	<!--/script-->
	<script type="text/javascript" src="../../js/move-top.js"></script>
	<script type="text/javascript" src="../../js/easing.js"></script>

	<!--end-smooth-scrolling-->
	<script src="../../js/bootstrap.js"></script>


</div>
</body>
</html>
