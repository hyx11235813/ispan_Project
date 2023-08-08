<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"
          href="${contextRoot}/css/discussion/bootstrap.min.css"/>
    <script src="${contextRoot}/js/discussion/bootstrap.min.js"></script>
    <script src="${contextRoot}/js/discussion/jquery-3.6.4.min.js"></script>


    <meta charset="UTF-8">
    <title>Show Posts</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 16px;
            line-height: 1.5;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1500px;
            margin: 0 auto;
            padding: 0px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        h2 {
            font-weight: bold;
            font-size: 32px;
            margin-top: 0;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin: 0px 0;
            border: 1px solid #ddd;
            background-color: #fff;
        }

        table th {
            background-color: #f2f2f2;
            color: #333;
            font-weight: bold;
            padding: 8px;
            text-align: left;
        }

        table td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table td.left-column {
            width: 15%;
        }

        table td.title-column {
            width: 15%;
        }

        table td.content-column {
            width: 50%;
        }

        table td.image-column {
            width: 20%;
            position: relative;
        }

        .title {
            font-weight: bold;
            margin-bottom: 10px;
            font-size: 20px;
        }

        .content {
            max-height: 200px;
            overflow: auto;
            font-size: 16px;
            line-height: 1.5;
            color: #555;
            margin-bottom: 10px;
        }

        .image-container {
            position: relative;
            padding-bottom: 100%;
        }

        .image-container img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .edit-buttons {
            position: absolute;
            top: 8px;
            right: 8px;
        }

        .edit-buttons form {
            display: inline-block;
            margin-right: 5px;
        }

        .edit-buttons input[type="submit"] {
            font-size: 14px;
            padding: 5px 10px;
        }

        .pagination {
            margin-top: 20px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            list-style: none;
            padding: 0;
        }
    </style>
</head>
<body>
<jsp:include page="../discussion-layout/navbar.jsp"></jsp:include>
<div class="container">
    <h2>文章總覽</h2>
    <jstl:forEach var="post" items="${page.content}">
        <table>
            <tr>
                <td class="left-column">
                    <div>Post ID: ${post.postID}</div>
                    <div>User ID:</div>
                    <div>Post Date: ${post.postDate}</div>
                    <div>Edit Date: ${post.editDate}</div>
                </td>
                <td class="title-column">
                    <div>文章標題：</div>
                    <div class="title">${post.title}</div>
                </td>
                <td class="content-column">
                    <div>文章內容：</div>
                    <div class="content">${post.content}</div>
                </td>
                <td class="image-column">
                    <div>圖片：</div>
                    <c:choose>
                        <c:when test="${not empty post.base64Image}">
                            <img class="Image" alt="Image"
                                 style="max-width: 250px; width: auto; height: auto; float: right;"
                                 src="data:image/jpeg;base64,${post.base64Image}
									">
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                    <!-- 						<div> -->
                        <%-- 							<img src="data:image/jpeg;base64,${post.base64Image}" alt="Image" --%>
                    <!-- 								style="max-width: 250px; width: auto; height: auto; float: right;"> -->
                    <!-- 						</div> -->


                    <div style="float: right;">
                        <!-- 編輯按鈕 -->
                        <div style="display: inline-block;">
                            <form action="${contextRoot}/dic/post/edit">
                                <input type="hidden" name="postID" value="${post.postID}"/> <input
                                    type="submit" class="btn btn-outline-info btn-sm" value="編輯"/>
                            </form>
                        </div>
                        <!-- 删除按鈕 -->
                        <div style="display: inline-block;">
                            <form action="${contextRoot}/dic/post/delete" method="post">
                                <input type="hidden" name="_method" value="delete"/>
                                <input
                                    type="hidden" name="id" value="${post.postID}"/> <input
                                    type="submit" class="btn btn-outline-danger btn-sm" value="刪除"/>
                            </form>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </jstl:forEach>
    <br/>
    <nav aria-label="paging">
        <ul class="pagination">
            <jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
                <li
                        class="page-item <jstl:if test="${page.number == pageNumber-1}">active</jstl:if>">
                    <a class="page-link"
                       href="<jstl:if test="${page.number != pageNumber-1}">${contextRoot}/dic/showAllPosts?p=${pageNumber}</jstl:if>">${pageNumber}</a>
                </li>
            </jstl:forEach>
        </ul>
    </nav>

</div>
</body>

</html>