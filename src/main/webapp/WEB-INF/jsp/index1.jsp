<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>這是標題</title>
	<style>
		.container {
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
			align-items: center;
			height: 100vh;
		}
		button {
			margin: 10px;
			padding: 20px;
			font-size: 24px;
			font-weight: bold;
			border: none;
			border-radius: 5px;
			background-color: #4CAF50;
			color: white;
			cursor: pointer;
			transition: all 0.3s ease;
		}
		button:hover {
			background-color: #3E8E41;
		}
	</style>
</head>
<body>
<div class="container">
		<button onclick="location.href='/customer/add'">一</button>
		<button onclick="location.href='/customer/delete'">二</button>
		<button onclick="location.href='/customer/edit'">三</button>
		<button onclick="location.href='https://www.bing.com'">四</button>
		</div>
</body>
</html>