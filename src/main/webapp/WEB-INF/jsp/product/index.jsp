<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>

    <!--//web-fonts-->
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
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

<div class="site-wrap">
    <header class="site-navbar" role="banner">
        <div class="site-navbar-top">
            <div class="container">
                <div class="row align-items-center">

                    <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
                        <form action="" class="site-block-top-search">
                            <span class="icon icon-search2"></span>
                            <input type="text" class="form-control border-0" placeholder="Search">
                        </form>
                    </div>

                    <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                        <div class="site-logo">
                            <a href="${contextRoot}/product/front/showProducts" class="js-logo-clone">Shoppers</a>
                        </div>
                    </div>

                    <div class="col-6 col-md-4 order-3 order-md-3 text-right">
                        <div class="site-top-icons">
                            <ul>
                                <li><a href="${contextRoot}/login"><span class="icon icon-person"></span></a></li>
                                <li><a href="#"><span class="icon icon-heart-o"></span></a></li>
                                <li>
                                    <a href="${contextRoot}/product/shoppingcart" class="site-cart" id="cart-icon">
                                        <span class="icon icon-shopping_cart"></span>
<%--                                        <span class="count"></span>--%>
                                    </a>
                                </li>
                                <li class="d-inline-block d-md-none ml-md-0"><a href="#"
                                                                                class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <nav class="site-navigation text-right text-md-center" role="navigation">
            <div class="container">
                <ul class="site-menu js-clone-nav d-none d-md-block">
                    <li class="has-children">
<%--                        <a href="${contextRoot}/product/front/showProducts">Home</a>--%>
                        <ul class="dropdown">
                            <li><a href="#">Menu One</a></li>
<%--                            <li><a href="#">Menu Two</a></li>--%>
<%--                            <li><a href="#">Menu Three</a></li>--%>
                            <li class="has-children">
                                <a href="#">Sub Menu</a>
                                <ul class="dropdown">
                                    <li><a href="#">Menu One</a></li>
                                    <li><a href="#">Menu Two</a></li>
                                    <li><a href="#">Menu Three</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
<%--                    <li class="has-children">--%>
<%--                        <a href="about.html">About</a>--%>
<%--                        <ul class="dropdown">--%>
<%--                            <li><a href="#">Menu One</a></li>--%>
<%--                            <li><a href="#">Menu Two</a></li>--%>
<%--                            <li><a href="#">Menu Three</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
                    <li class="active"><a href="${contextRoot}/product/front/showProducts">首頁</a></li>
                    <li><a href="#">新商品</a></li>
                    <li><a href="${contextRoot}/product/shoppingcart">購物車</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="${contextRoot}/product/front/showProducts">Home</a> <span class="mx-2 mb-0">/</span> <strong
                        class="text-black">${product.name}</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <img src="${contextRoot}/product/pig/${product.id}" alt="${product.name}" class="img-fluid">

                </div>
                <div class="col-md-6">
                    <form:form method="post" modelAttribute="product" action="${contextRoot}/product/shoppingcart/add">
                    <h2 class="text-black">${product.name}</h2>
                    <p>說明:${product.description}</p>
<%--                    <p class="mb-4">物品:${product.name}</p>--%>
                    <p><strong class="text-primary h4">$${product.price}</strong></p>

                    <div class="mb-5">
                        <div class="input-group mb-3" style="max-width: 120px;">
                            <div class="input-group-prepend">
                                <button id="decrement" class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                            </div>
                            <input id="quantity" type="text" class="form-control text-center" value="1" placeholder=""
                                   data-max='10' aria-label="Example text with button addon" aria-describedby="button-addon1" name="quantity">
                            <div class="input-group-append">
                                <button id="increment" class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                            </div>
                        </div>

                    </div>
                    <input name="id" value="${product.id}" type="hidden">
                    <button type="submit"  id="shoppingcart" class="btn btn-danger"><i
                            class="bi bi-cart3"></i>&nbsp;加入購物車
                    </button>
<%--                    <p><a href="cart.html" class="buy-now btn btn-sm btn-primary">Add To Cart</a></p>--%>


                </div>
                </form:form>
            </div>
        </div>
    </div>

    <div class="site-section block-3 site-blocks-2 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>推薦電影</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="nonloop-block-3 owl-carousel">
                        <div class="item">
                            <div class="block-4 text-center">
                                <figure class="block-4-image">
                                    <img src="${contextRoot}/images/44.jpg" alt="Image placeholder" class="img-fluid">
                                </figure>
                                <div class="block-4-text p-4">
                                    <h3><a href="#"></a></h3>
                                    <p class="mb-0"></p>
                                    <p class="text-primary font-weight-bold"></p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="block-4 text-center">
                                <figure class="block-4-image">
                                    <img src="${contextRoot}/images/55.jpg" alt="Image placeholder" class="img-fluid">
                                </figure>
                                <div class="block-4-text p-4">
                                    <h3><a href="#"></a></h3>
                                    <p class="mb-0"></p>
                                    <p class="text-primary font-weight-bold"></p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="block-4 text-center">
                                <figure class="block-4-image">
                                    <img src="${contextRoot}/images/77.jpg" alt="Image placeholder" class="img-fluid">
                                </figure>
                                <div class="block-4-text p-4">
                                    <h3><a href="#"></a></h3>
                                    <p class="mb-0"></p>
                                    <p class="text-primary font-weight-bold"></p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="block-4 text-center">
                                <figure class="block-4-image">
                                    <img src="${contextRoot}/images/22.jpg" alt="Image placeholder" class="img-fluid">
                                </figure>
                                <div class="block-4-text p-4">
                                    <h3><a href="#"></a></h3>
                                    <p class="mb-0"></p>
                                    <p class="text-primary font-weight-bold"></p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="block-4 text-center">
                                <figure class="block-4-image">
                                    <img src="${contextRoot}/images/66.jpg" alt="Image placeholder" class="img-fluid">
                                </figure>
                                <div class="block-4-text p-4">
                                    <h3><a href="#"></a></h3>
                                    <p class="mb-0"></p>
                                    <p class="text-primary font-weight-bold"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="site-footer border-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="footer-heading mb-4">導引</h3>
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
                            <li class="address">台南市 東區 博愛路11巷11號meow影城</li>
                            <li class="phone"><a href="tel://06 28936729">06 28936729</a></li>
                            <li class="email">meowMovies@gmail.com</li>
                        </ul>
                    </div>

                    <div class="block-7">
                        <form action="#" method="post">
                            <label for="email_subscribe" class="footer-heading">Subscribe</label>
                            <div class="form-group">
                                <input type="text" class="form-control py-4" id="email_subscribe"
                                       placeholder="Email">
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
                        <script>document.write(new Date().getFullYear());</script> All rights reserved | This
                        template is made with <i class="icon-heart" aria-hidden="true"></i> by <a
                            href="https://colorlib.com" target="_blank" class="text-primary">Colorlib</a>
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

<script>


    document.getElementById("increment").addEventListener("click", () => {
        const quantityInput = document.getElementById("quantity");
        const max = parseInt(quantityInput.getAttribute('data-max'), 10);
        let value = parseInt(quantityInput.value, 10);
        if (value < max) {
            quantityInput.value = parseInt(quantityInput.value) + 0;
        }
    });

    document.getElementById("decrement").addEventListener("click", () => {
        const quantityInput = document.getElementById("quantity");
        const currentValue = parseInt(quantityInput.value);
        if (currentValue > 1) {
            quantityInput.value = currentValue - 0;
        }
    });
</script>
</body>

</html>