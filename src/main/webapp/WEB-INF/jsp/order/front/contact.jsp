<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
  <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
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
              <a href="index.html" class="js-logo-clone">Movie</a>
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
                <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span
                        class="icon-menu"></span></a></li>
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
            <a href="index.html">Home</a>
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
            <a href="about.html">About</a>
            <ul class="dropdown">
              <li><a href="#">Menu One</a></li>
              <li><a href="#">Menu Two</a></li>
              <li><a href="#">Menu Three</a></li>
            </ul>
          </li>
          <li><a href="shop.html">Shop</a></li>
          <li><a href="#">Catalogue</a></li>
          <li><a href="#">New Arrivals</a></li>
          <li class="active"><a href="contact.html">Contact</a></li>
        </ul>
      </div>
    </nav>
  </header>

  <div class="bg-light py-3">
    <div class="container">
      <div class="row">
        <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
                class="text-black">Contact</strong></div>
      </div>
    </div>
  </div>

  <div class="site-section">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h2 class="h3 mb-3 text-black"></h2>
        </div>
        <div class="col-md-7">

          <form:form class="form-control" modelAttribute="orderDetail" method="post" action="${contextRoot}/orders/ecpayCheckout" >
            <div class="p-3 p-lg-5 border">
              <h2>收件人資訊</h2>
              <div class="form-group row">
                <div class="col-md-6">
                  <label for="name" class="text-black">姓名 <span class="text-danger">*</span></label>
                  <form:input path="userName" type="text" class="form-control" id="name" name="name"/>
                </div>
                <div class="col-md-6">
                  <label for="phone" class="text-black">電話 <span class="text-danger">*</span></label>
                  <form:input path="userPhone" type="text" class="form-control" id="phone" name="phone"/>
                </div>
              </div>
              <input type="hidden" name="TotalAmount" value="${totalPrice}">
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="email" class="text-black">Email <span class="text-danger">*</span></label>
                  <form:input path="userEmail" type="email" class="form-control" id="email" name="email" placeholder=""/>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="sameAsShipping">
                    <label class="form-check-label" for="sameAsShipping">
                        ${order.setTotalamount}
                    </label>
                  </div>
                </div>
              </div>
              <input type="hidden" name="TotalAmount" value="${totalPrice}">

              <h2><c:out value="${totalPrice}" /></h2>
              <div class="form-group row contact-info">

                <div class="col-md-6">
                  <label for="c_name" class="text-black">姓名 <span class="text-danger">*</span></label>
                  <form:input path="receiveName" type="text" class="form-control" id="c_name" name="c_name"/>
                </div>
                <div class="col-md-6">
                  <label for="c_phone" class="text-black">電話 <span class="text-danger">*</span></label>
                  <form:input path="receivePhone" type="text" class="form-control" id="c_phone" name="c_phone"/>
                </div>
              </div>

              <div class="form-group row contact-info">
                <div class="col-md-12">
                  <label for="c_phone" class="text-black">Email <span class="text-danger">*</span></label>
                  <form:input path="receiveEmail" type="text" class="form-control" id="c_address" name="c_address" placeholder=""/>
                </div>
              </div>

              <div class="form-group row">
                <div class="col-lg-12">
                  <input type="submit" class="btn btn-primary btn-lg btn-block" value="Send Message">
                </div>
              </div>
              <input type="hidden" name="order" value="${sessionScope.order}" />

            </div>
<%--            ${sessionScope.order}--%>

          </form:form>

          <form method="post" action="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5">
            <!-- 在這裡加入付款資訊的 input 欄位 -->
            <input type="hidden" name="MerchantID" value="9000214">
            <input type="hidden" name="MerchantTradeNo" value="your_trade_no">
            <input type="hidden" name="TotalAmount" value="${totalPrice}">
            <input type="hidden" name="variableName" value="${variableValue}" />
            <input type="hidden" name="ItemName" value="your_item_name">
            <input type="hidden" name="ReturnURL" value="your_return_url">
            <input type="hidden" name="EncryptType" value="1">
            <input type="hidden" name="CheckMacValue" value="your_check_mac_value">

            <button type="submit">前往綠界付款</button>
          </form>


        </div>
      </div>
    </div>
  </div>

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

  // 當打勾框框被勾選時，自動填入聯絡人表單
  // 找到 "聯絡人同收件人" checkbox 元素
  const checkbox = document.querySelector('#sameAsShipping');

  // 找到收件人資訊表單中的元素
  const shippingName = document.querySelector('#name');
  const shippingPhone = document.querySelector('#phone');
  const shippingEmail = document.querySelector('#email');

  // 找到聯絡人資訊表單中的元素
  const contactName = document.querySelector('#c_name');
  const contactPhone = document.querySelector('#c_phone');
  const contactAddress = document.querySelector('#c_address');

  // 綁定事件監聽器
  checkbox.addEventListener('change', function() {
    // 如果 checkbox 被勾選了
    if (this.checked) {
      // 將收件人資訊填入聯絡人資訊表單中
      contactName.value = shippingName.value;
      contactPhone.value = shippingPhone.value;
      // 這裡我們假設 Email 不用填入聯絡人資訊表單中
      // 如果需要填入的話，也可以加上下面這行程式碼：
      contactAddress.value = shippingEmail.value;
    } else {
      // 如果 checkbox 被取消勾選了，將聯絡人資訊表單清空
      contactName.value = '';
      contactPhone.value = '';
      contactAddress.value = '';
    }
  });

</script>

</body>
</html>