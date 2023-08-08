<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <title>Movies</title>
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

<%--<form:form method="post" modelAttribute="order" action="${contextRoot}/orders/create">--%>
<%--    <div class="container" data-aos="fade-up">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-12">--%>
<%--                <table class="table">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th scope="col">#</th>--%>
<%--                        <th scope="col">商品名稱</th>--%>
<%--                        <th scope="col">數量</th>--%>
<%--                        <th scope="col">單價</th>--%>
<%--                        <th scope="col">小計</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach var="shoppingcart" items="${shoppingcart}" varStatus="status">--%>
<%--                        <tr valign="middle">--%>
<%--                            <th scope="row"></th>--%>
<%--                            <td>--%>
<%--                                    ${shoppingcart.product.name}--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <input value="${shoppingcart.quantity}" type="hidden" id="quantity${status.count}">--%>
<%--                                    ${shoppingcart.quantity}--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <input value="${shoppingcart.product.price}" type="hidden" id="price${status.count}">--%>
<%--                                    ${shoppingcart.product.price}--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <input value="${shoppingcart.quantity*shoppingcart.product.price}" type="hidden" id="total${status.count}" class="countstotal"/>--%>
<%--                                    ${shoppingcart.quantity*shoppingcart.product.price}--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="form-group row">--%>
<%--            <div class="col-md-6">--%>
<%--                <label for="name" class="text-black">名字 <span class="text-danger">*</span></label>--%>
<%--                <input type="text" class="form-control" id="name" name="name">--%>
<%--            </div>--%>
<%--            <div class="col-md-6">--%>
<%--                <label for="phone" class="text-black">電話<span class="text-danger">*</span></label>--%>
<%--                <input type="text" class="form-control" id="phone" name="phone">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary btn-lg btn-block" id="confirmBtn" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> 送出中...">確認購買</button>--%>
<%--    </div>--%>
<%--</form:form>--%>

<body class="site-wrap">
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
                            <a href="index.html" class="js-logo-clone">Shoppers</a>
                        </div>
                    </div>

                    <div class="col-6 col-md-4 order-3 order-md-3 text-right">
                        <div class="site-top-icons">
                            <ul>
                                <li><a href="#"><span class="icon icon-person"></span></a></li>
                                <li><a href="#"><span class="icon icon-heart-o"></span></a></li>
                                <li>
                                    <a href="cart.html" class="site-cart">
                                        <span class="icon icon-shopping_cart"></span>
                                        <span class="count">2</span>
                                    </a>
                                </li>
                                <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
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
<%--                        <a href="index.html">Home</a>--%>
                        <ul class="dropdown">
                            <li><a href="#">Menu One</a></li>
                            <li><a href="#">Menu Two</a></li>
                            <li><a href="#">Menu Three</a></li>
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
                    <li class="has-children">
<%--                        <a href="about.html">About</a>--%>
                        <ul class="dropdown">
                            <li><a href="#">Menu One</a></li>
                            <li><a href="#">Menu Two</a></li>
                            <li><a href="#">Menu Three</a></li>
                        </ul>
                    </li>
<%--                    <li><a href="shop.html">Shop</a></li>--%>
<%--                    <li><a href="#">Catalogue</a></li>--%>
<%--                    <li><a href="#">New Arrivals</a></li>--%>
<%--                    <li><a href="contact.html">Contact</a></li>--%>
                </ul>
            </div>
        </nav>
    </header>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="${contextRoot}/product/front/showProducts">首頁</a> <span class="mx-2 mb-0">/</span> <a href="${contextRoot}/product/shoppingcart">購物車</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Checkout</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
<%--            <div class="row mb-5">--%>
<%--                <div class="col-md-12">--%>
<%--                    <div class="border p-4 rounded" role="alert">--%>
<%--                        Returning customer? <a href="#">Click here</a> to login--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
<%--                    <h2 class="h3 mb-3 text-black">Billing Details</h2>--%>
<%--                    <div class="p-3 p-lg-5 border">--%>
                        <div class="form-group">
<%--                            <label for="c_country" class="text-black">Country <span class="text-danger">*</span></label>--%>
<%--                            <select id="c_country" class="form-control">--%>
<%--                                <option value="1">Select a country</option>--%>
<%--                                <option value="2">bangladesh</option>--%>
<%--                                <option value="3">Algeria</option>--%>
<%--                                <option value="4">Afghanistan</option>--%>
<%--                                <option value="5">Ghana</option>--%>
<%--                                <option value="6">Albania</option>--%>
<%--                                <option value="7">Bahrain</option>--%>
<%--                                <option value="8">Colombia</option>--%>
<%--                                <option value="9">Dominican Republic</option>--%>
<%--                            </select>--%>
                        </div>

<%--                        <div class="form-group row">--%>
<%--                            <div class="col-md-6">--%>
<%--                                <label for="c_fname" class="text-black">名字 <span class="text-danger">*</span></label>--%>
<%--                                <input type="text" class="form-control" id="c_fname" name="c_fname">--%>
<%--                            </div>--%>
<%--                            <div class="col-md-6">--%>
<%--                                <label for="c_lname" class="text-black">電話<span class="text-danger">*</span></label>--%>
<%--                                <input type="text" class="form-control" id="c_lname" name="c_lname">--%>
<%--                            </div>--%>
<%--                        </div>--%>


                        <div class="form-group row">
                            <div class="col-md-12">
<%--                                <label for="c_companyname" class="text-black">Company Name </label>--%>
<%--                                <input type="text" class="form-control" id="c_companyname" name="c_companyname">--%>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
<%--                                <label for="c_address" class="text-black">Address <span class="text-danger">*</span></label>--%>
<%--                                <input type="text" class="form-control" id="c_address" name="c_address" placeholder="Street address">--%>
                            </div>
                        </div>

                        <div class="form-group">
<%--                            <input type="text" class="form-control" placeholder="Apartment, suite, unit etc. (optional)">--%>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-6">
<%--                                <label for="c_state_country" class="text-black">State / Country <span class="text-danger">*</span></label>--%>
<%--                                <input type="text" class="form-control" id="c_state_country" name="c_state_country">--%>
                            </div>
                            <div class="col-md-6">
<%--                                <label for="c_postal_zip" class="text-black">Posta / Zip <span class="text-danger">*</span></label>--%>
<%--                                <input type="text" class="form-control" id="c_postal_zip" name="c_postal_zip">--%>
                            </div>
                        </div>

                        <div class="form-group row mb-5">
                            <div class="col-md-6">
<%--                                <label for="c_email_address" class="text-black">Email Address <span class="text-danger">*</span></label>--%>
<%--                                <input type="text" class="form-control" id="c_email_address" name="c_email_address">--%>
                            </div>
                            <div class="col-md-6">
<%--                                <label for="c_phone" class="text-black">Phone <span class="text-danger">*</span></label>--%>
<%--                                <input type="text" class="form-control" id="c_phone" name="c_phone" placeholder="Phone Number">--%>
                            </div>
                        </div>

                        <div class="form-group">
<%--                            <label for="c_create_account" class="text-black" data-toggle="collapse" href="#create_an_account" role="button" aria-expanded="false" aria-controls="create_an_account"><input type="checkbox" value="1" id="c_create_account"> Create an account?</label>--%>
                            <div class="collapse" id="create_an_account">
                                <div class="py-2">
<%--                                    <p class="mb-3">Create an account by entering the information below. If you are a returning customer please login at the top of the page.</p>--%>
                                    <div class="form-group">
<%--                                        <label for="c_account_password" class="text-black">Account Password</label>--%>
<%--                                        <input type="email" class="form-control" id="c_account_password" name="c_account_password" placeholder="">--%>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
<%--                            <label for="c_ship_different_address" class="text-black" data-toggle="collapse" href="#ship_different_address" role="button" aria-expanded="false" aria-controls="ship_different_address"><input type="checkbox" value="1" id="c_ship_different_address"> Ship To A Different Address?</label>--%>
                            <div class="collapse" id="ship_different_address">
                                <div class="py-2">

                                    <div class="form-group">
<%--                                        <label for="c_diff_country" class="text-black">Country <span class="text-danger">*</span></label>--%>
<%--                                        <select id="c_diff_country" class="form-control">--%>
<%--                                            <option value="1">Select a country</option>--%>
<%--                                            <option value="2">bangladesh</option>--%>
<%--                                            <option value="3">Algeria</option>--%>
<%--                                            <option value="4">Afghanistan</option>--%>
<%--                                            <option value="5">Ghana</option>--%>
<%--                                            <option value="6">Albania</option>--%>
<%--                                            <option value="7">Bahrain</option>--%>
<%--                                            <option value="8">Colombia</option>--%>
<%--                                            <option value="9">Dominican Republic</option>--%>
<%--                                        </select>--%>
                                    </div>


                                    <div class="form-group row">
<%--                                        <div class="col-md-6">--%>
<%--                                            <label for="c_diff_fname" class="text-black">First Name <span class="text-danger">*</span></label>--%>
<%--                                            <input type="text" class="form-control" id="c_diff_fname" name="c_diff_fname">--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-6">--%>
<%--                                            <label for="c_diff_lname" class="text-black">Last Name <span class="text-danger">*</span></label>--%>
<%--                                            <input type="text" class="form-control" id="c_diff_lname" name="c_diff_lname">--%>
<%--                                        </div>--%>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-12">
<%--                                            <label for="c_diff_companyname" class="text-black">Company Name </label>--%>
<%--                                            <input type="text" class="form-control" id="c_diff_companyname" name="c_diff_companyname">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-12">
<%--                                            <label for="c_diff_address" class="text-black">Address <span class="text-danger">*</span></label>--%>
<%--                                            <input type="text" class="form-control" id="c_diff_address" name="c_diff_address" placeholder="Street address">--%>
                                        </div>
                                    </div>

                                    <div class="form-group">
<%--                                        <input type="text" class="form-control" placeholder="Apartment, suite, unit etc. (optional)">--%>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-6">
<%--                                            <label for="c_diff_state_country" class="text-black">State / Country <span class="text-danger">*</span></label>--%>
<%--                                            <input type="text" class="form-control" id="c_diff_state_country" name="c_diff_state_country">--%>
                                        </div>
                                        <div class="col-md-6">
<%--                                            <label for="c_diff_postal_zip" class="text-black">Posta / Zip <span class="text-danger">*</span></label>--%>
<%--                                            <input type="text" class="form-control" id="c_diff_postal_zip" name="c_diff_postal_zip">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row mb-5">
                                        <div class="col-md-6">
<%--                                            <label for="c_diff_email_address" class="text-black">Email Address <span class="text-danger">*</span></label>--%>
<%--                                            <input type="text" class="form-control" id="c_diff_email_address" name="c_diff_email_address">--%>
                                        </div>
                                        <div class="col-md-6">
<%--                                            <label for="c_diff_phone" class="text-black">Phone <span class="text-danger">*</span></label>--%>
<%--                                            <input type="text" class="form-control" id="c_diff_phone" name="c_diff_phone" placeholder="Phone Number">--%>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>

                        <div class="form-group">
<%--                            <label for="c_order_notes" class="text-black">Order Notes</label>--%>
<%--                            <textarea name="c_order_notes" id="c_order_notes" cols="30" rows="5" class="form-control" placeholder="Write your notes here..."></textarea>--%>
                        </div>

                    </div>
                </div>
                <div class="col-md-6">



                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">訂單資訊</h2>
                            <div class="p-3 p-lg-5 border">
<form:form method="post" modelAttribute="order" action="${contextRoot}/orders/create">
                                <table id="shopping-cart" class="table site-block-order-table mb-5">
                                    <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Total</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:set var="totalPrice" value="0" />
                                    <c:forEach var="shoppingcart" items="${shoppingcart}" varStatus="status">
                                        <c:set var="itemTotalPrice" value="${shoppingcart.quantity*shoppingcart.product.price}" />
                                        <tr>
                                            <td>${shoppingcart.product.name} <strong class="mx-2">x</strong> ${shoppingcart.quantity}</td>
                                            <td>${itemTotalPrice}</td>
                                        </tr>
                                        <c:set var="totalPrice" value="${totalPrice + itemTotalPrice}" />

                                    </c:forEach>

                                    <%
                                        Long totalPrice = (Long) pageContext.getAttribute("totalPrice");
                                        session.setAttribute("totalPrice", Long.toString(totalPrice));
                                    %>
                                    <tr>
                                        <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                        <td class="text-black font-weight-bold"><strong >${totalPrice}</strong></td>
                                    </tr>
                                    </tbody>
                                </table>
<%--    <button type="submit" class="btn btn-primary btn-lg py-3 btn-block">結帳</button>--%>
<%--</form:form>--%>


                                <div class="border p-3 mb-3">
                                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsebank" role="button" aria-expanded="false" aria-controls="collapsebank">Direct Bank Transfer</a></h3>

                                    <div class="collapse" id="collapsebank">
                                        <div class="py-2">
                                            <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="border p-3 mb-3">
                                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsecheque" role="button" aria-expanded="false" aria-controls="collapsecheque">Cheque Payment</a></h3>

                                    <div class="collapse" id="collapsecheque">
                                        <div class="py-2">
                                            <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="border p-3 mb-5">
                                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsepaypal" role="button" aria-expanded="false" aria-controls="collapsepaypal">Paypal</a></h3>

                                    <div class="collapse" id="collapsepaypal">
                                        <div class="py-2">
                                            <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-lg py-3 btn-block">結帳</button>
                                </div>
    </form:form>
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
                        <p>Promo from  nuary 15 &mdash; 25, 2019</p>
                    </a>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="block-5 mb-5">
                        <h3 class="footer-heading mb-4">Contact Info</h3>
                        <ul class="list-unstyled">
                            <li class="address">203 Fake St. Mountain View, San Francisco, California, USA</li>
                            <li class="phone"><a href="tel://23923929210">+2 392 3929 210</a></li>
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
                        Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" class="text-primary">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>

            </div>
        </div>
    </footer>
</div>

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
<%--    <section id="breadcrumbs" class="breadcrumbs">--%>
<%--        <div class="container">--%>

<%--            <ol>--%>
<%--                <li><a href="index.html">首頁</a></li>--%>
<%--                <li>購物車</li>--%>
<%--            </ol>--%>
<%--            <h2>購物車</h2>--%>

<%--        </div>--%>
    </section><!-- End Breadcrumbs -->
<%--    <form:form method="post" modelAttribute="order" action="${contextRoot}/orders/create">--%>
<%--        <section id="blog" class="blog">--%>
<%--            <div class="container" data-aos="fade-up">--%>
<%--                <div class="row">--%>
<%--                    <div class="entry entry-single">--%>
<%--                        <table class="table">--%>
<%--                            <thead>--%>
<%--                            <tr>--%>
<%--                                <th scope="col">#</th>--%>
<%--                                <th scope="col">商品名稱</th>--%>
<%--                                <th scope="col">數量</th>--%>
<%--                                <th scope="col">單價</th>--%>
<%--                                <th scope="col">小計</th>--%>
<%--                            </tr>--%>
<%--                            </thead>--%>
<%--                            <tbody>--%>
<%--                            <c:forEach var="shoppingcart" items="${shoppingcart}" varStatus="status">--%>
<%--                                <tr valign="middle">--%>
<%--                                    <th scope="row"></th>--%>
<%--                                    <td>--%>
<%--                                            ${shoppingcart.product.name}--%>

<%--                                    </td>--%>
<%--                                    <td>--%>
<%--                                        <input value="${shoppingcart.quantity}" type="hidden" id="quantity${status.count}">--%>
<%--                                            ${shoppingcart.quantity}--%>
<%--                                    </td>--%>
<%--                                    <td>--%>
<%--                                        <input value="${shoppingcart.product.price}" type="hidden" id="price${status.count}">--%>
<%--                                            ${shoppingcart.product.price}--%>
<%--                                    </td>--%>
<%--                                    <td>--%>
<%--                                        <input value="${shoppingcart.quantity*shoppingcart.product.price}" type="hidden" id="total${status.count}" class="countstotal"/>--%>
<%--                                            ${shoppingcart.quantity*shoppingcart.product.price}--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </c:forEach>--%>
<%--                            </tbody>--%>
<%--                            </form:form>--%>
<%--                        </table>--%>






<script src="${contextRoot}/product/styles/front2/js/jquery-3.3.1.min.js"></script>
<script src="${contextRoot}/product/styles/front2/js/jquery-ui.js"></script>
<script src="${contextRoot}/product/styles/front2/js/popper.min.js"></script>
<script src="${contextRoot}/product/styles/front2/js/bootstrap.min.js"></script>
<script src="${contextRoot}/product/styles/front2/js/owl.carousel.min.js"></script>
<script src="${contextRoot}/product/styles/front2/js/jquery.magnific-popup.min.js"></script>
<script src="${contextRoot}/product/styles/front2/js/aos.js"></script>

<script src="${contextRoot}/product/styles/front2/js/main.js"></script>



                    </div>
                </div>
            </div>


        </section>

    </main>

    <!-- ##### Main Content Wrapper End ##### -->

<%--    <script>--%>
<%--        //原始總金額--%>
<%--        let totalamount = 0;--%>
<%--        let counttotal = document.getElementsByClassName("countstotal");--%>
<%--        for(let i=0;i<counttotal.length;i++){--%>
<%--            totalamount += parseInt(counttotal[i].value,10)--%>
<%--        }--%>
<%--        document.getElementById('totalamount').innerHTML = totalamount.toLocaleString('zh-TW', {style: 'currency', currency: 'TWD', minimumFractionDigits: 0});--%>
<%--        if(totalamount<1000 && totalamount>0){--%>
<%--            document.getElementById('freight').innerHTML = "30";--%>
<%--            totalamount = totalamount + 30;--%>
<%--            document.getElementById('finalamount').innerHTML = totalamount.toLocaleString('zh-TW', {style: 'currency', currency: 'TWD', minimumFractionDigits: 0});--%>
<%--        }else{--%>
<%--            document.getElementById('freight').innerHTML = 0;--%>
<%--            document.getElementById('finalamount').innerHTML = totalamount.toLocaleString('zh-TW', {style: 'currency', currency: 'TWD', minimumFractionDigits: 0});--%>
<%--        }--%>

<%--        //數量-1--%>
<%--        function dec(count){--%>
<%--            let valueInput = document.getElementById('quantity'+count); //數量--%>
<%--            let qua = document.getElementById('price'+count);           //價格--%>
<%--            let values = parseInt(valueInput.value)--%>
<%--            let scid = document.getElementById('row'+count).getAttribute('data-id')  //取得shoppingcartid--%>
<%--            if(values>1){--%>
<%--                valueInput.value=values - 1;--%>
<%--                $.ajax({--%>
<%--                    type:"PUT",--%>
<%--                    url:"http://localhost:8080/meow/front/shoppingcart",--%>
<%--                    data:{--%>
<%--                        shoppoingCartId:scid,--%>
<%--                        quantity:valueInput.value--%>
<%--                    }--%>
<%--                })--%>
<%--                document.getElementById('total'+count).value=qua.value*valueInput.value;  //小計--%>
<%--                //累加小計--%>
<%--                let totalamount = 0;--%>
<%--                let counttotal = document.getElementsByClassName("countstotal");--%>
<%--                for(let i=0;i<counttotal.length;i++){--%>
<%--                    totalamount += parseInt(counttotal[i].value,10)--%>
<%--                }--%>
<%--                document.getElementById('totalamount').innerHTML = totalamount.toLocaleString('zh-TW', {style: 'currency', currency: 'TWD', minimumFractionDigits: 0});--%>
<%--                if(totalamount<1000 && totalamount>0){--%>
<%--                    document.getElementById('freight').innerHTML = "30";--%>
<%--                    totalamount += 30;--%>
<%--                    document.getElementById('finalamount').innerHTML = totalamount.toLocaleString('zh-TW', {style: 'currency', currency: 'TWD', minimumFractionDigits: 0});--%>
<%--                }else{--%>
<%--                    document.getElementById('freight').innerHTML = 0;--%>
<%--                    document.getElementById('finalamount').innerHTML = totalamount.toLocaleString('zh-TW', {style: 'currency', currency: 'TWD', minimumFractionDigits: 0});--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--        //數量+1--%>
<%--        function inc(count){--%>
<%--            let valueInput = document.getElementById('quantity'+count);--%>
<%--            let qua = document.getElementById('price'+count);--%>
<%--            let max = parseInt(valueInput.getAttribute('data-max'),10)--%>
<%--            let scid = document.getElementById('row'+count).getAttribute('data-id')  //scid--%>
<%--            let values = parseInt(valueInput.value)--%>
<%--            if(values<max){--%>
<%--                valueInput.value=values + 1;--%>
<%--                $.ajax({--%>
<%--                    type:"PUT",--%>
<%--                    url:"http://localhost:8080/meow/front/shoppingcart",--%>
<%--                    data:{--%>
<%--                        shoppoingCartId:scid,--%>
<%--                        quantity:valueInput.value--%>
<%--                    }--%>
<%--                })--%>
<%--                document.getElementById('total'+count).value=qua.value*valueInput.value;--%>
<%--                let totalamount = 0;--%>
<%--                //累加小計--%>
<%--                let counttotal = document.getElementsByClassName("countstotal");--%>
<%--                for(let i=0;i<counttotal.length;i++){--%>
<%--                    totalamount += parseInt(counttotal[i].value,10)--%>
<%--                }--%>
<%--                document.getElementById('totalamount').innerHTML = totalamount.toLocaleString('zh-TW', {style: 'currency', currency: 'TWD', minimumFractionDigits: 0});--%>
<%--                if(totalamount<1000 && totalamount>0){--%>
<%--                    document.getElementById('freight').innerHTML = "30";--%>
<%--                    totalamount += 30;--%>
<%--                    document.getElementById('finalamount').innerHTML = totalamount.toLocaleString('zh-TW', {style: 'currency', currency: 'TWD', minimumFractionDigits: 0});--%>
<%--                }else{--%>
<%--                    document.getElementById('freight').innerHTML = 0;--%>
<%--                    document.getElementById('finalamount').innerHTML = totalamount.toLocaleString('zh-TW', {style: 'currency', currency: 'TWD', minimumFractionDigits: 0});--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--        //數量欄位檢查--%>
<%--        function check(event){--%>
<%--            const max = parseInt(input.getAttribute('data-max'),10)--%>
<%--            let values = parseInt(input.value,10);--%>
<%--            if(isNaN(values) || values < 1){--%>
<%--                values = 1;--%>
<%--            }--%>
<%--            if(values > max){--%>
<%--                values = max;--%>
<%--            }--%>
<%--            input.value=values;--%>
<%--        }--%>

<%--        document.getElementById("increment").addEventListener("click", () => {--%>
<%--            const quantityInput = document.getElementById("quantity");--%>
<%--            const max = parseInt(quantityInput.getAttribute('data-max'), 10);--%>
<%--            let value = parseInt(quantityInput.value, 10);--%>
<%--            if (value < max) {--%>
<%--                quantityInput.value = parseInt(quantityInput.value) + 0;--%>
<%--            }--%>
<%--        });--%>

<%--        document.getElementById("decrement").addEventListener("click", () => {--%>
<%--            const quantityInput = document.getElementById("quantity");--%>
<%--            const currentValue = parseInt(quantityInput.value);--%>
<%--            if (currentValue > 1) {--%>
<%--                quantityInput.value = currentValue - 0;--%>
<%--            }--%>
<%--        });--%>
<%--    </script>--%>
</body>
</html>
