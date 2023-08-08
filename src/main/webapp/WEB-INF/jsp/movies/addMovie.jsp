<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Movie</title>
</head>
<body>
    <h1>Add Movie</h1>
    
    <form action="/addMovie" method="post">
    <label for="moviename">Movie Name:</label>
    <input type="text" id="moviename" name="moviename"><br>
    
    <label for="movieEnglishname">English Name:</label>
    <input type="text" id="movieEnglishname" name="movieEnglishname"><br>
    
    <input type="submit" value="Add Movie">
</form>
    <br>
    
    <a href="../movies">Back to Movie List</a>
</body>
</html>
