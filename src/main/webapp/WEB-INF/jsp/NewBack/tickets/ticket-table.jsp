<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <meta charset="utf-8">
    <title>DarkPan - Bootstrap 5 Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
<%--    <link href="${contextRoot}/images/icon/seaticon.png" rel="icon">--%>

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
    <link href="${contextRoot}/lib/owlcarousel/assets/owl.carousel.min.css"
          rel="stylesheet">
    <link href="${contextRoot}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
          rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${contextRoot}/css/backCSS/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${contextRoot}/css/backCSS/style.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid position-relative d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/BackNav.jsp"></jsp:include>



    <!-- Blank Start -->
    <div class="container-fluid pt-4 px-4">
        <div class="row vh-100 bg-secondary rounded align-items-center justify-content-center mx-0">

                <!-- Blank Start -->
                <%--    <h2>電影名稱:${tickets.get(1).show.movie.name}</h2>--%>
                <%--    <h2>電影時間:${tickets.get(1).show.time}</h2>--%>
                <%--    <h2>電影廳:${tickets.get(1).show.cinema}</h2>--%>
                <%--    <h1>螢幕方向</h1>--%>

                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Recent Salse</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                            <tr class="text-white">
                                <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                <th scope="col">票券編號</th>
                                <th scope="col">排-號</th>
                                <th scope="col">票價</th>
                                <th scope="col">付款狀態</th>
                                <th scope="col">購票人</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="ticket" items="${tickets}">
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>${ticket.ticketid}</td>
                                    <td>${ticket.row}-${ticket.seatNumber}</td>
                                    <td>${ticket.price}</td>
                                    <td><c:if test="${ticket.payed == false}">未付款</c:if>
                                        <c:if test="${ticket.payed == true}">已付款</c:if>
                                    <td>${ticket.user.name}</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>


        </div>
    </div>
    <!-- Blank End -->



</div>



<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/lib/chart/chart.min.js"></script>
<script src="${contextRoot}/lib/easing/easing.min.js"></script>
<script src="${contextRoot}/lib/waypoints/waypoints.min.js"></script>
<script src="${contextRoot}/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/moment.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="${contextRoot}/js/backJS/main.js"></script>
</body>

</html>