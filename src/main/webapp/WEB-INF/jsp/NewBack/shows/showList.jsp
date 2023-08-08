<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
    <meta charset="utf-8">
    <title>DarkPan - Bootstrap 5 Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${contextRoot}/images/backImg/favicon.ico" rel="icon">

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
    <link href="lib/owlcarousel/assets/owl.carousel.min.css"
          rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
          rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/backCSS/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/backCSS/style.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid position-relative d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner"
         class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <jsp:include page="../layout/BackNav.jsp"></jsp:include>


    <!-- Blank Start -->
    <div class="container pt-4 px-4">
        <div class="row vh-100 bg-secondary rounded align-items-center justify-content-center mx-0">
            <h1>Show List</h1>

            <table>
                <tr>
                    <th>ID</th>
                    <th>Movie Name</th>
                    <th>Show Time</th>
                    <th>Cinema</th>
                    <th>訂票</th>
                </tr>
                <c:forEach items="${shows}" var="show">
                    <tr>
                        <td>${show.showId}</td>
                        <td>${show.movie.name}</td>
                        <td>${show.time}</td>
                        <td>${show.cinema}</td>
                        <td><a href="${contextRoot}/BackTicketsTable/${show.showId}">訂票座位表</a></td>
                    </tr>
                </c:forEach>
            </table>

            <form action="${contextRoot}/shows" method="post">
                <div>
                    <label for="movie">Movie:</label>
                    <select id="movie" name="movieId">
                        <option value="">-- Select a movie --</option>
                        <c:forEach items="${movies}" var="movie">
                            <option value="${movie.id}">${movie.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label for="time">Time:</label>
                    <input type="datetime-local" id="time" name="time">
                </div>
                <div>
                    <label for="cinema">Cinema:</label>
                    <input type="text" id="cinema" name="cinema">
                </div>
                <input type="submit" value="AddShow">
            </form>

        </div></div>
</body>


<!-- Blank End -->


<jsp:include page="../layout/BackFoot.jsp"></jsp:include>



<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}//lib/chart/chart.min.js"></script>
<script src="${contextRoot}/lib/easing/easing.min.js"></script>
<script src="${contextRoot}/lib/waypoints/waypoints.min.js"></script>
<script src="${contextRoot}/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/moment.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="js/backJS/main.js"></script>
<script src="js/backJS/nav.js"></script>


</html>