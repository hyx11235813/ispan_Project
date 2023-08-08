<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

  <meta charset="UTF-8">
  <title>Show Added</title>
</head>
<body>
<h1>Show added successfully!</h1>
<p><a href="${contextRoot}/shows">Back to Show List</a></p>
</body>
</html>
