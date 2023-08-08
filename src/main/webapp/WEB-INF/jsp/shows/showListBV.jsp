<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show List</title>
</head>
<body>
	<h1>Show List</h1>

	<table>
		<tr>
			<th>ID</th>
			<th>Movie Name</th>
			<th>Show Time</th>
			<th>Cinema</th>
		</tr>
		<c:forEach items="${shows}" var="show">
			<tr>
				<td>${show.id}</td>
				<td>${show.movie.moviename}</td>
				<td>${show.time}</td>
				<td>${show.cinema}</td>
			</tr>
		</c:forEach>
		<tr>
			<form action="/shows" method="post">
				<td>&nbsp;</td>
				<td><select name="movie.name">
						<option value="">-- Select a movie --</option>
						<c:forEach items="${movies}" var="movie">
							<option value="${movie.moviename}">${movie.moviename}</option>
						</c:forEach>
				</select></td>
			<td><input type="datetime-local" name="time"></td>
			<td><input type="text" name="cinema"></td>
			<td><input type="submit" value="Add Show"></td>

			</form>
		</tr>
	</table>

	<br>
	<a href="/shows/add">Add Show</a>
</body>
</html>
