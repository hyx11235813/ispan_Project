<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet"
          href="${contextRoot}/css/discussion/bootstrap.min.css"/>
    <script src="${contextRoot}/js/discussion/bootstrap.min.js"></script>
    <script src="${contextRoot}/js/discussion/jquery-3.6.4.min.js"></script>


    <meta charset="UTF-8"/>
    <title>AddArticle</title>
</head>

<body>
<jsp:include page="../discussion-layout/navbar.jsp"></jsp:include>
<div class="container" style="margin: 40px auto">
    <h2>新增文章</h2>
    <form:form action="${contextRoot}/dic/submitPost/post" method="post"
               enctype="multipart/form-data" modelAttribute="postDto">
        <div class="form-group
            <label for="title">Title:</label>
            <form:input path="title" type="text" class="form-control" id="title"
                        name="title" maxlength="40" required="required" placeholder="字數上限40"></form:input>
        </div>
        <div class="form-group">
            <label for="content">Content:</label>
            <form:textarea path="content" class="form-control" id="content"
                           placeholder="字數上限500" name="content" rows="5"
                           required="required" maxlength="500"></form:textarea>
        </div>
        <div class="mb-3">
            <label for="formFile" class="form-label">photo:</label>
            <form:input path="image" type="file" class="form-control"
                        id="formFile" accept="image/png, image/jpeg"/>
        </div>
        <button type="submit" class="btn btn-primary" style="float: right">
            Submit
        </button>
    </form:form>
</div>
</body>

</html>
