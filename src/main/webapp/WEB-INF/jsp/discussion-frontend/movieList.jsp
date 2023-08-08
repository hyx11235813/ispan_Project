<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="${contextRoot}/css/discussion/bootstrap.min.css" />
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/js/discussion/jquery-3.6.4.min.js"></script>

<meta charset="UTF-8" />
<title>Movie List</title>
</head>
<body>
<jsp:include page="../discussion-layout/movieListNavbar.jsp"></jsp:include>

<table class="table">
  <thead>
    <tr>
      <th scope="col">poster</th>
      <th scope="col">電影名稱</th>
      <th scope="col">導演</th>
      <th scope="col">片長</th>
      <th scope="col">排行</th>
      <th scope="col">進入討論區</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Mark</td>
      <td>電影</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>1</td>
       <td><button class="btn btn-primary">討論區</button></td>
    </tr>
    <tr>
      <td>Jacob</td>
      <td>電影</td>
      <td>@fat</td>
      <td>@fat</td>
      <td>2</td>
       <td><button class="btn btn-primary">討論區</button></td>
      
    </tr>
    <tr>
      <td>@twitter</td>
      <td>電影</td>
      <td>@twitter</td>
      <td>@twitter</td>
      <td>3</td>
      <td><button class="btn btn-primary">討論區</button></td>
    </tr>
  </tbody>
</table>
</body>
</html>