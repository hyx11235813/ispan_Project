<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie List</title>
</head>
<body>
	<h1>Movie List</h1>

	<table>
		<tr>
			<th>ID</th>
			<th>Movie Name</th>
			<th>English Name</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${movies}" var="movie">
			<tr>
				<td>${movie.movieid}</td>
				<td>${movie.moviename}</td>
				<td>${movie.movieEnglishname}</td>
				<td><a href="${contextRoot}/movies/edit/${movie.movieid}">Edit</a></td>
				<td><a href="${contextRoot}/deleteMovie/${movie.movieid}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="meow/movies/add">Add Movie</a>
</body>
</html>
