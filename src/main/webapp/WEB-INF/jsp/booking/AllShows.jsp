<!-- AllShows.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>All Shows</title>
</head>
<body>
<h1>All Shows</h1>

<ul>
    <c:forEach var="show" items="${showList}">
        <li>

            <a href="${contextRoot}/tickets/booking/${show.showId}">${show.movie.name} + ${show.time} + ${show.cinema}廳</a>

        </li>
    </c:forEach>
</ul>

</body>
</html>
