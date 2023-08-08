<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Movies Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="data"></div>
	<div id="pagination"></div>

<c:if test="${page.number > 0}">
    <a href="?page=${page.number - 1}">Prev</a>
</c:if>

<c:forEach begin="0" end="${page.totalPages - 1}" var="i">
    <c:choose>
        <c:when test="${page.number eq i}">
            <span>${i + 1}</span>
        </c:when>
        <c:otherwise>
            <a href="?page=${i}">${i + 1}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>

<c:if test="${page.number + 1 < page.totalPages}">
    <a href="?page=${page.number + 1}">Next</a>
</c:if>



	<script>
		$(document).ready(function() {
			loadData(0);
		});

		function loadData(page) {
			$.ajax({
				type : "GET",
				url : "/api/movies?page=" + page,
				success : function(data) {
					var content = "";
					$.each(data.content, function(i, item) {
						content += "<p>" + item.name + " - " + item.director
								+ "</p>";
					});
					$("#data").html(content);

					var pagination = "";
					if (!data.first) {
						pagination += "<a href='#' onclick='loadData("
								+ (data.number - 1) + ")'>Prev</a>";
					}
					pagination += "<span>" + (data.number + 1) + " of "
							+ data.totalPages + "</span>";
					if (!data.last) {
						pagination += "<a href='#' onclick='loadData("
								+ (data.number + 1) + ")'>Next</a>";
					}
					$("#pagination").html(pagination);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus, errorThrown);
				}
			});
		}
	</script>
</body>
</html>