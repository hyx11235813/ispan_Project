<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Movie</title>
</head>
<body>
	<h1>Edit Movie</h1>

	<form action="/movies/${movie.movieid}" method="post">
		<input type="hidden" name="_method" value="PUT">

		<label for="moviename">Movie Name:</label>
		<input type="text" id="moviename" name="moviename" value="${movie.moviename}"><br>

		<label for="movieEnglishname">English Name:</label>
		<input type="text" id="movieEnglishname" name="movieEnglishname" value="${movie.movieEnglishname}"><br>

		<input type="submit" value="Update Movie">
	</form>

	<form action="/movies/${movie.movieid}" method="post">
		<input type="hidden" name="_method" value="DELETE">
		<input type="submit" value="Delete Movie">
	</form>

	<br>
	<a href="/movies">Back to Movie List</a>
</body>
</html>
