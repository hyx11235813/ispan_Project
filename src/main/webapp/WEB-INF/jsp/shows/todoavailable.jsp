<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Available Shows</title>
</head>
<body>
<h1>Available Shows</h1>
<table>
	<thead>
	<tr>
		<th>Movie Title</th>
		<th>Cinema</th>
		<th>Show Time</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="show" items="${shows}">
		<tr>
			<td>${show.movie.name}</td>
			<td>${show.cinema}</td>
			<td>${show.time}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>