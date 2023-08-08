$(document).ready(function() {
  // 获取当前URL路径
  var path = window.location.pathname;

  // 查找包含的导航栏项
  var navbarItems = $('.sidebar .navbar-nav').find('.nav-item.nav-link');

  // 遍历导航栏项并更新其active类
  navbarItems.each(function() {
    var href = $(this).attr('href');
    if (path.indexOf(href) === 0) {
      $(this).addClass('active');
    } else {
      $(this).removeClass('active');
    }
  });
});
