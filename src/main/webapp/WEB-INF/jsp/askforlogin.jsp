<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<jsp:include page=" ${contextRoot}/layout/NewNav.jsp" />
<jsp:include page=" ${contextRoot}/layout/NewHeader.jsp" />
<jsp:include page=" ${contextRoot}/layout/NewFooter.jsp" />
<jsp:include page=" ${contextRoot}/layout/NewCss.jsp" />
<jsp:include page=" ${contextRoot}/layout/NewJs.jsp" />

<H1>請問是否要未登入劃位</H1>
<form action="${contextRoot}/login" method="post">
    <input type="submit" value="登入">
</form>
<H1>是否要註冊</H1>
<form action="${contextRoot}/register" method="post">
    <input type="submit" value="註冊">
</form>
<H1>是否以未登入身分繼續繼續劃位</H1>
<botton href="${contextRoot}/tickets/non-login/books"></botton>
</html>
<body></body>