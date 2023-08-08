<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        h1 {
            margin-top: 30px;
            margin-bottom: 20px;
            text-align: center;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        form {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="datetime-local"], input[type="text"], select {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: none;
            box-shadow: 1px 1px 3px #ccc;
            width: 80%;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 30%;
            margin-bottom: 20px;
        }
        input[type="submit"]:hover {
            background-color: #3e8e41;
        }
        a {
            margin-top: 20px;
            display: block;
            text-align: center;
            text-decoration: none;
            color: #4CAF50;
        }
        a:hover {
            color: #3e8e41;
        }
    </style>
</head>

<body>
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
            <td><a href="${contextRoot}/tickets/non-login/booking/${show.showId}">訂票座位表</a></td>
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

</body>
</html>
