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
<title>User Post History</title>
</head>
<style>
body {
	font-family: "Roboto", sans-serif;
	background-color: #DAE0E6;
}
.container {
	display: flex;
	justify-content: center;
	margin-top:74px;
}
#preview-images{
	max-width: 465px;
} 

.userImage {
    width: 300px;
}
.movieNameBanner {
	height: 100px;
	width: 100%;
	background-color: #fff;
	padding: 1rem 0;
	margin-top: 50px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
/* 	position: sticky; */
/* 	top: -40px; */
}
.movieNmae {
	font-size: 2rem;
	font-weight: bold;
	text-align: center;
}
.movieNmae h1{
margin-top:8px
}
.card-text-content{
margin-top:10px;
}
</style>

<body>
	<jsp:include page="../discussion-layout/movieListNavbar.jsp"></jsp:include>
	<div class="movieNameBanner">
		<div class="movieNmae">
			<h1>我的發文記錄</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="wrap">
			<c:forEach var="post" items="${userPosts}">
				<div class="card mb-3" style="max-width: 650px">
					<div class="row g-0">
						
						<div class="col-md-12">
 								<div class="card-body" style="display: flex; flex-direction: column; ">
								<h4 class="card-title">${post.title}</h5>
								<span class="card-text"> <small
									class="text-body-secondary">發文時間：${post.editDate}</small>
								</span>
								<p class="card-text-content">${post.content}</p>
							
								<c:if test="${not empty post.base64Image}">
								    <img src="data:image/png;base64, ${post.base64Image}"
								         class="img-fluid rounded-start userImage" alt="..."style="margin: auto;">
								    <br>
								</c:if>
								<button type="button" class="btn btn-secondary editButton"
									data-dismiss="modal" data-post-id="${post.postID}"style="margin-left: auto;">編輯</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- ---------------------------------------------------- -->
		<div class="modal fade" id="editPostModal" tabindex="-1" role="dialog"
			aria-labelledby="addPostModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="editPostModalLabel">編輯文章</h5>
					</div>
					<div class="modal-body">
						<form id="editPostForm" enctype="multipart/form-data"
							action="/meow/dic/user/posts/historyEdit" method="POST">
							<div class="form-group">
								<label for="title">標題</label>
								 <input type="text"
									class="form-control" id="title" name="title"
									required="required" placeholder="字數上限40" maxlength="40">
							</div>
							<div class="form-group">
								<label for="content">內容</label>
								<textarea class="form-control" id="content" name="content"
									rows="3" required="required" placeholder="字數上限500"
									maxlength="500"></textarea>
							</div>
							<div class="form-group">
								<label for="image">照片更新</label> <input type="file"
									class="form-control-file" id="editImage" name="image"
									required="required" accept="image/png, image/jpeg">
							</div>
							<input type="hidden" id="editPostId" name="PostID"> <br />
							<div class="preview">
<!-- 								<h3>photo：</h3> -->
								<h2 id="preview-title"></h2>
								<img id="preview-images" />
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="submitEditPost">編輯文章</button>
						<button type="button" class="btn btn-primary" id="deletePost">刪除文章</button>
<!-- 						<button type="button" class="btn btn-secondary" -->
<!-- 							data-dismiss="modal" id="editCancel">取消</button> -->
					</div>
				</div>
			</div>
		</div>

	</div>
</body>

<script >
  $(document).ready(function(){
	  let postID = null;
	  $('.editButton').on('click',function(){
		postID=$(this).data('post-id');
// 		console.log(postID);
	  
	  $.ajax({
		    type: 'GET',
		    url: "http://localhost:8080/meow/dic/user/posts/edit?postID=" + postID,
		    dataType: 'json',
		    success: function(posts) {
// 		    	 console.log("取得資料: ", posts);
		    	  let postTitle = posts.title;
		    	  let postContent = posts.content;
		    	  let postID = posts.postID;
// 		    	  console.log("標題: ", postTitle);
// 		    	  console.log("內容: ", postContent);
// 		    	  console.log("ID: ", postID);

		    	  $('#title').val(postTitle);
		    	  $('#content').val(postContent);
		    	  $('#editPostId').val(postID);
		      if (posts.image) {
		    	  let postImage=posts.image;	    	  
// 		    	  console.log("圖片: ", postImage);
		       
		    	  $('#preview-images').attr('src', 'data:image/png;base64,' + posts.image);
		      }else{
		    	  $('#preview-images').removeAttr('src');
		    	  }
		   
		      		      
		      $('#editPostModal').modal('show');
		    },
		    error: function(xhr, status, error) {
		      console.error('Error:', status, error);
		    }
	 		 });
		});
	  
	  $('#submitEditPost').on('click', function (e) {
		 	 e.preventDefault();
		 	 $('#editPostForm').submit();
		});
	  
	  $('#deletePost').on('click', function (e) {
		  console.log("deletePostID: " + postID);
		    $.ajax({
		    	url: 'http://localhost:8080/meow/dic/historyPost/delete?id=' + postID,
		        type: 'DELETE',
		        success: function (response) {
		            window.location.reload();
		        },
		        error: function (xhr, status, error) {
		            console.error("刪除文章失敗:", error);
		        }
		    });
	  });
	  $('#postImage').on('change', function() {
		   var file = this.files[0];
		   var reader = new FileReader();
		   reader.onload = function(e) {
		     $('#preview-image').attr('src', e.target.result);
		   };
		   reader.readAsDataURL(file);
		 });
	  $('#editImage').on('change', function() {
		   var file = this.files[0];
		   var reader = new FileReader();
		   reader.onload = function(e) {
		     $('#preview-images').attr('src', e.target.result);
		   };
		   reader.readAsDataURL(file);
		 });
	   
	  
  });
  
  </script>


</html>
