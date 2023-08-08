<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet"
          href="${contextRoot}/css/discussion/bootstrap.min.css"/>
    <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${contextRoot}/js/discussion/jquery-3.6.4.min.js"></script>
    <script src="https://kit.fontawesome.com/5752751d3f.js" crossorigin="anonymous"></script>
    <meta charset="UTF-8"/>
    <title>討論區首頁</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;

    }

    body {
        font-family: "Roboto", sans-serif;
        background-color: #DAE0E6;
    }

    .container {
        display: flex;
        flex-direction: column;
        margin: 50px auto;
        max-width: 1325px;
    }

    .wrap {
        width: 100%;
        max-width: 640px;
        margin: 0 auto;

    }

    .postNav {
        background-color: #fff;
        border-radius: 5px 5px 5px 5px;
        padding: 10px 0px;
        position: relative;
    }

    .card {
        margin-bottom: 1.5rem;

    }

    .card:hover {
        border: 1px solid gray;
    }

    .card-title {
        font-weight: bold;
        margin: 10px 0px;

    }


    .card-body img {
        max-width: 100%;
        max-width: 520px;

    }

    .card-body {
        margin: 10px 15px;
        padding: 16px 20px 0px;

    }

    .card-user {
        font-size: 15px;
        font-weight: 500;
        line-height: 1.2;
    }

    .row > * {
        flex-shrink: 0;
        width: 100%;
        max-width: 100%;
        padding-right: 0;
        padding-left: 0;
        margin-top: var(--bs-gutter-y)
    }

    .post-time {
        font-size: 15px
    }

    .likeBtn {
        margin-left: 50px;
    }

    .Image {
        margin-left: auto;
        margin-right: auto;
    }

    .nav-link {
        font-weight: bold;
        color: #3f3f3f !important;

    }

    .nav-link:hover {
        background-color: #eee;
    }

    .nav-link.active {
        color: #0255CA !important;
        background-color: #e8eaec !important;
        border-radius: 8px;
    }

    .movieNameBanner {
        height: 100px;
        width: 100%;
        background-color: #fff;
        padding: 1rem 0;
        margin-top: 50px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        position: sticky;
        top: -40px;
        /*     z-index: 1000 */
    }

    .movieNmae {
        font-size: 4rem;
        font-weight: bold;
        text-align: center;
    }

    .movieNmae h1 {
        margin-top: 8px
    }


    .Image {
        display: block;
        margin: 0 auto
    }

    .fixed-card {
        position: fixed;
        top: 268px;
        left: 200px;
        z-index: 1000;
    }

    @media ( max-width: 1700px) {
        .fixed-card {
            display: none;
        }
    }

    .backToTop {
        position: fixed;
        bottom: 40px;
        right: 400px;
        z-index: 1000;
    }

    @media (max-width: 1600px) {
        .backToTop {
            position: fixed;
            bottom: 40px;
            right: 200px;
            z-index: 1000;
        }
    }

    @media (max-width: 1300px) {
        .backToTop {
            bottom: 40px;
            right: 80px;
            z-index: 1000;
        }
    }

    @media (max-width: 1085px) {
        .backToTop {
            bottom: 40px;
            right: 50px;
            z-index: 1000;
        }
    }

    @media (max-width: 1020px) {
        .backToTop {
            display: none;
        }
    }

    #preview-image {
        max-width: 465px;
    }

    #preview-images {
        max-width: 465px;
    }

    .postNav {
        position: relative;
    }

    .float-end {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        right: 50px;
    }

    .comments-info {
        display: flex;
        margin-top: 10px;
    }

    .card-body {
        cursor: pointer;
    }


    .preview {
        padding-top: 20px;
    }

    .modal-addPost-content {
        width: 150%;
        margin: 10% -27%;
    }

    .form-group {
        margin-top: 20px;
    }

    #preview-image {
        margin: 0px auto;
    }

    .comments-info {
        display: flex;
        justify-content: flex-end
    }

    .fa-message {
        margin-top: 12px;
        margin-right: 5px;
    }

    .modal-body {
        padding: 20px 40px;
    }

    #commentsContainer {
        padding: 0px 40px 40px;
    }

    .comment-btn-secondary {
        float: right;
        margin-top: 10px;
    }

    .btn-danger {
        display: block;
        margin-left: auto;
    }

    #commentsContainer p {
        margin-top: 10px;
    }


</style>

<body>
<jsp:include page="../discussion-layout/navbar-frontend.jsp"></jsp:include>

<div class="movieNameBanner">
    <div class="movieNmae">
        <h1>MeoWie電影討論區</h1>
    </div>
</div>

<div class="container">


    <div class="wrap">
        <div class="container-fluid mt-4 postNav" name="selectNav">
            <ul class="nav nav-pills justify-content-center">

                <li class="nav-item ">
                    <a class="nav-link active" id="newToOld"
                       href="${contextRoot}/dic/user/posts/new">
                        <i class="fa-solid fa-square-caret-down"> 新到舊</i>
                    </a>

                </li>

                <li class="nav-item">
                    <a class="nav-link" id="oldToNew"
                       href="${contextRoot}/dic/user/posts/old">
                        <i class="fa-solid fa-square-caret-up"> 舊到新</i>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" id="top">
                        <i class="fa-solid fa-fire"> 熱門討論</i>

                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" id="addPost" href="${contextRoot}/dic/user/posts/addPostPage">
                        <i class="fa-solid fa-square-plus"> 新增文章</i>

                    </a>
                </li>

                <li class="nav-item disabled" style="display: none;"><a class="nav-link" id="count">查詢結果</a></li>
            </ul>

            <li class="nav-item float-end" style="display: none;"><a href="javascript:void(0) class=" nav-link"
                id="return" >返回</a></li>
        </div>
    </div>

    <div class="wrap">
        <div class="postContainer">
            <div class="container-fluid mt-4">
                <div class="row justify-content-center" id="empty">
                    <%-- 						<jstl:forEach var="post" items="${page.content}"> --%>
                    <!-- 							<div class="col-12"> -->
                    <!-- 								<div class="card"> -->
                    <!-- 									<div class="row"> -->
                    <!-- 										<div class="col-md-12"> -->
                    <!-- 											<div class="card-body"> -->
                    <!-- 												<span class="card-user">UserName:抓取userName <span -->
                    <%-- 													class="post-time">/發文時間：${post.postDate} </span><span --%>
                    <!-- 													class="likeBtn">這裏放按贊鈕</span></span> -->
                    <!-- 																								<span>postTime:距離發文時的hour</span> -->
                    <%-- 												<h5 class="card-title">${post.title}</h5> --%>
                    <%-- 												<p class="card-text">${post.content}</p> --%>

                    <%-- 												<c:choose> --%>
                    <%-- 													<c:when test="${not empty post.base64Image}"> --%>
                    <!-- 														<img class="Image" alt="Image" -->
                    <%-- 															src="data:image/jpeg;base64,${post.base64Image}"> --%>
                    <%-- 													</c:when> --%>
                    <%-- 													<c:otherwise> --%>

                    <%-- 													</c:otherwise> --%>
                    <%-- 												</c:choose> --%>

                    <!-- 											</div> -->
                    <!-- 										</div> -->
                    <!-- 									</div> -->
                    <!-- 								</div> -->
                    <!-- 							</div> -->
                    <%-- 						</jstl:forEach> --%>
                </div>
            </div>
        </div>
    </div>
    <br/>

    <div>
        <button class="backToTop btn btn-secondary" id="backToTop">Back To Top</button>
    </div>

</div>

<!-- Modal -->
<div class="modal fade" id="addPostModal" tabindex="-1" role="dialog" aria-labelledby="addPostModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-addPost-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addPostModalLabel">Create a post</h5>
                <!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
                <!--           <span aria-hidden="true">&times;</span> -->
                <!--         </button> -->
            </div>
            <div class="modal-body">
                <form:form id="addPostForm" action="${contextRoot}/dic/user/posts/addPost" method="post"
                           modelAttribute="postDto" enctype="multipart/form-data">
                    <div class="form-group">
                        <!--             <label for="postTitle"></label> -->
                        <form:input path="title" type="text" class="form-control" id="postTitle" name="title"
                                    placeholder="Title" maxlength="40" required="required"></form:input>
                    </div>
                    <div class="form-group">
                        <!--             <label for="postContent"></label> -->
                        <form:textarea path="content" class="form-control" id="postContent" name="content" rows="10"
                                       required="required" placeholder="Text" maxlength="500"></form:textarea>
                    </div>
                    <div class="form-group">
                        <label for="postImage">Photo:</label>
                        <form:input path="image" type="file" class="form-control-file" id="postImage" name="image"
                                    required="required" accept="image/png, image/jpeg"></form:input>
                    </div>
                    <br/>
                    <div class="preview">
                        <!-- 				<h3>photo：</h3> -->
                        <h2 id="preview-title"></h2>
                        <img id="preview-image" style="display: block; margin: 0 auto;">

                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel">取消</button>
                <button type="button" class="btn btn-primary" id="submitPost">提交</button>
            </div>
        </div>
    </div>
</div>

<!-- --------------------------editPostModal-------------------------------------- -->

<div class="modal fade" id="editPostModal" tabindex="-1" role="dialog" aria-labelledby="addPostModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editPostModalLabel">新增貼文</h5>
            </div>
            <div class="modal-body">
                <form id="editPostForm" enctype="multipart/form-data" action="/meow/dic/user/posts/edit" method="POST">
                    <div class="form-group">
                        <label for="title">標題</label>
                        <input type="text" class="form-control" id="title" name="title" required="required"
                               placeholder="字數上限40" maxlength="40">
                    </div>
                    <div class="form-group">
                        <label for="content">內容</label>
                        <textarea class="form-control" id="content" name="content" rows="3" required="required"
                                  placeholder="字數上限500" maxlength="500"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="image">圖片上傳</label>
                        <input type="file" class="form-control-file" id="editImage" name="image" required="required"
                               accept="image/png, image/jpeg">
                    </div>
                    <input type="hidden" id="editPostId" name="PostID">
                    <br/>
                    <div class="preview">
                        <h3>photo：</h3>
                        <h2 id="preview-title"></h2>
                        <img id="preview-images"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="editCancel">取消</button>
                <button type="button" class="btn btn-primary" id="submitEditPost">提交</button>
            </div>
        </div>
    </div>
</div>

<!-- ---------------------------留言Modal---------------------------------------------------- -->
<div id="commentModal" class="modal fade" tabindex="-1" role="dialog">
    <!--   <div class="modal-dialog" role="document"> -->
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">評論</h5>
                <!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
                <!--           <span aria-hidden="true">&times;</span> -->
                <!--         </button> -->
            </div>
            <div class="modal-body">
                <!--         先寫這邊的controller能夠送到關聯postid的commnet    5/11 -->
                <!-- 			可能送出表單時，需要先獲取postid進行關聯 -->
                <div id="postContainer" style="word-break: break-word;">
                    <!-- 放使用者的文章 -->
                </div>
                <form:form id="commentForm" action="${contextRoot}/dic/submitPost/commentPost" method="post"
                           enctype="multipart/form-data" modelAttribute="commentDto">
                    <form:hidden path="postID" id="hiddenPostId"/>
                    <div class="form-group">
                        <form:textarea path="content" class="form-control" id="commentInput" rows="3"
                                       placeholder="寫下你的評論" required="required"></form:textarea>
                    </div>
                    <button type="submit" class="comment-btn-secondary btn btn-secondary">Comment</button>
                </form:form>
            </div>
            <!--       	<div class="modal-footer"> -->
            <!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button> -->
            <!--       	</div> -->
            <div id="commentsContainer" style="word-break:break-word;">
                <!--放使用者的留言 -->
            </div>


        </div>
    </div>
</div>


<script>

    $(document).ready(function () {
        let contextRoot = "${pageContext.request.contextPath}"
        let scrollEnabled = true;// To prevent rendering on every screen
        let pageNumber = 1;
        let sortOrder = "new"; //new to old
        //// Call the function initially
        infiniteScroll(sortOrder, false);

        $.ajax({
            url: "${contextRoot}/dic/getloggedInUserId",
            type: "GET",
            success: function (loggedInUserId) {

                console.log("目前登錄的userId :", loggedInUserId);
                //傳回一個目前登錄的userId，並設爲全域變數
                window.loggedInUserId = loggedInUserId;
            },
            error: function (xhr, status, error) {
                console.error(error);
            }

        });


        //獲取當前 userid


        $(document).scroll(function () {
            if (scrollEnabled && $(window).scrollTop() + $(window).height() == $(document).height()) {
                infiniteScroll(sortOrder, false);
            }
        });

        //On  event---------------------------------------------
        $('#newToOld').on('click', function (e) {
            $('.nav-link').removeClass('active');
            $(this).addClass('active');
            e.preventDefault();
            sortOrder = "new";
            pageNumber = 1;
            infiniteScroll(sortOrder, true);
        });

        $('#oldToNew').on('click', function (e) {
            $('.nav-link').removeClass('active');
            $(this).addClass('active');
            e.preventDefault();
            sortOrder = "old";
            pageNumber = 1;
            infiniteScroll(sortOrder, true);
        });
        $('#top').on('click', function (e) {
            $('.nav-link').removeClass('active');
            $(this).addClass('active');

        });


        $('#searchButton').on('click', function (e) {
            e.preventDefault();
            searchTitle();
            $('#hot').parent().hide();
            $('#oldToNew').parent().hide();
            $('#newToOld').parent().hide();
            $('#top').parent().hide();
            $('#addPost').parent().hide();
            $('#count').parent().show();
            $('#return').parent().show();
        });
        $("#return").on('click', function () {
            location.reload();
        })

        $('#backToTop').on('click', function () {
// 	   $('html,body').scrollTop(0);
            window.scrollTo(0, 0);

        });

        //使用者選擇圖片時，可以顯現在畫面上
        $('#postImage').on('change', function () {
            var file = this.files[0];
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#preview-image').attr('src', e.target.result);
            };
            reader.readAsDataURL(file);
        });
        $('#editImage').on('change', function () {
            var file = this.files[0];
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#preview-images').attr('src', e.target.result);
            };
            reader.readAsDataURL(file);
        });


        //For users to edit posts//
        //document事件委托：可以在動態創建的元素上處理事件
        $(document).on('click', '.editButton', function () {
            let postId = $(this).attr('PostID');
            console.log("測試編輯取得id" + postId);
            //這邊是使用者點擊編輯按鈕會發送請求，并把那筆資料顯示在modal讓使用者更新--
            $.ajax({
                type: 'GET',
                url: "http://localhost:8080/meow/dic/user/posts/edit?postID=" + postId,
                dataType: 'json',
                success: function (posts) {
                    console.log("取得資料: ", posts);
                    let postTitle = posts.title;
                    let postContent = posts.content;
                    let postID = posts.postID;

                    $('#title').val(postTitle);
                    $('#content').val(postContent);
                    $('#editPostId').val(postID);
                    if (posts.image) {
                        let postImage = posts.image;
                        console.log("圖片: ", postImage);

                        $('#preview-images').attr('src', 'data:image/png;base64,' + posts.image);
                    }
                    $('#editPostModal').modal('show');
                },
                error: function (xhr, status, error) {
                    console.error('Error:', status, error);
                }
            });
        });
        $('#top').on('click', function (e) {
            e.preventDefault();

            $.ajax({
                type: 'GET',
                url: 'http://localhost:8080/meow/dic/user/posts/scroll/comments',
                dataType: 'json',
                success: function (posts) {
                    $('#empty').empty();
// 	                console.log("Posts array: ", posts); 
                    renderPosts(posts);
                },
                error: function (xhr, status, error) {
                    console.error('Error: ' + status + error);
                }
            });
        });


        //Bootstrap modal--------------------------------------
        $('#addPostModal').on('show.bs.modal', function () {
            $('#postTitle').val('');
            $('#postContent').val('');
            $('#postImage').val('');
        })

        //Open modal
        $('#addPost').on('click', function (e) {
            e.preventDefault();

            $('#addPostModal').modal('show');
        });

        $('#submitPost').on('click', function (e) {
            submitPostForm(); //modal 提交使用者 “新增”的内容
            e.preventDefault();


        });

        //modal 提交使用者 “編輯”的内容
        $('#submitEditPost').on('click', function (e) {
            e.preventDefault();
            $('#editPostForm').submit();
        });

        //點擊取消按鈕隱藏modal
        $('#cancel').on('click', function () {
            $('#addPostModal').modal('hide');
        });
        $('#editCancel').on('click', function () {
            $('#editPostModal').modal('hide');
        });

        //When the submit button is clicked, do this
        function submitPostForm() {
            let form = $("#addPostForm");
            form.submit();
        };


        $('#commentModal').on("hidden.bs.modal", function () {
            pageNumber = 1;
            infiniteScroll(sortOrder, true);
            $('#oldToNew').removeClass('active');
            $('#newToOld').addClass('active');
        });


        //functions-----------------------------------------------------

// 	function returnRendering()
        //Infinite scroll functions------------------------------------
        function infiniteScroll(sortOrder, clearData) {
            $('#loading-indicator').show();
            //判斷點擊哪個來決定請求的網址
            let url = sortOrder === 'new' ? 'http://localhost:8080/meow/dic/user/posts/scroll' : 'http://localhost:8080/meow/dic/user/posts/scroll/old';

            $.ajax({
                type: "GET",
                url: url,
                data: {
                    pageNumber: pageNumber
                    //Give service pageNumber param  for distribute page
                },
                dataType: "json",
                success: function (posts) {
// 				console.log('總共幾筆回傳posts：', posts.length);
// 				console.log('posts内容：', JSON.stringify(posts, null, 2));
// 				console.log(posts);	
                    posts.forEach(function (post) {//test
                        console.log("jsp的 infiniteScroll:  User ID:", post.user.id, "Username:", post.user.username);
                    });
                    //判斷：posts有内容才渲染文章
                    //如果有默認内容需要清空則用empty()
                    if (posts.length > 0) {
                        //點擊排序時一定會傳true進來做清空，但滾動事件傳false不做清空
                        if (clearData) {
                            $('#empty').empty();
                        }
                        renderPosts(posts);
                        pageNumber++; //給scroll事件設的值，每次觸發事件就加一頁，讓service方法可以找到相關頁數的資料
                    }
                    $('#loading-indicator').hide();
                },
                error: function (xhr, status, error) {
                    console.error("Error:" + status + error);
                    console.log("error");
                }
            });

        }


        //Search by title
        function searchTitle() {
            let keyword = $('#searchInput').val();
            scrollEnabled = false;//Prevent  rendering
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/meow/dic/showAllPosts/searchTitle",
                dataType: "json",
                data: {
                    keyword: keyword
                },
                success: function (posts) {
                    if (posts.length == 0) {
//     				 window.location.href=contextRoot+'/noSearchResults';
                        alert("找不到相關文章");

                    } else {
                        renderSearchResults(posts);
                    }
                },
                erroe: function (xhr, status, error) {
                    console.error("Error:" + status + error);
                }
            })

        }

        //Render---------------------------------------------test5/11----------------
        function renderPosts(posts) {
            let postsContainer = $('#empty');
//         postsContainer.empty();
            posts.forEach(function (post) {
//         	 console.log('post.user:', post.user.username);
                //img exist or not
                let img = post.base64Image;
                let postDiv = $('<div>').addClass('col-12 ');
                let cardDiv = $('<div>').addClass('card');
                let rowDiv = $('<div>').addClass('row');
                let colDiv = $('<div>').addClass('col-md-12');

                //點擊文章 div打開評論
                //用 IIFE才能個別獲取每個 post而不是只有循環的最後一個
                postDiv.on('click', (function (post) {
                    return function () {
                        // 在這裡打開評論modal
                        // 可以使用 post.postID 來獲取文章的 ID，以便在模態窗口中加載相關評論
// 			        console.log("測試點擊postDiv");
// 			        console.log("測試點擊獲取postID" + post.postID);
                        openCommentModal(post, window.loggedInUserId);
                        $('#top').removeClass('active');
                    };
                })(post));
                //.html for tag/.text for data
                let cardBodyDiv = $('<div>').addClass('card-body');
//             let cardUserSpan = $('<span>').addClass('card-user').html('用戶名:' + post.user.username+'	<span class="post-time">/ 發文時間：' + post.postDate);			
                let cardUserSpan = $('<span>').addClass('card-user');
                let usernameIcon = $('<i>').addClass('fa-regular fa-circle-user fa-lg').css('margin-right', '5px');
                let username = $('<span>').addClass('username').html(post.user.username + '	<span class="post-time">/ 發文時間：' + post.postDate);
                cardUserSpan.append(usernameIcon, username);
                let cardTitle = $('<h5>').addClass('card-title').text(post.title);
                let cardText = $('<p>').addClass('card-text').text(post.content);

                //commentsIcon and count
                let commentsInfoDiv = $('<div>').addClass('comments-info');
                let commentsIcon = $('<i>').addClass("fa-regular fa-message fa-flip-horizontal fa-xl");
                let commentsCount = $('<span>').addClass('comments-count').text(post.commentsCount + " Comments" || 0 + "Comments");

                commentsInfoDiv.append(commentsIcon, commentsCount);
                cardBodyDiv.append(cardUserSpan, cardTitle, cardText);

                if (img) {
                    let imgElement = $('<img>').attr('src', 'data:image/jpeg;base64,' + post.base64Image).addClass('Image').attr('alt', 'Image');
                    cardBodyDiv.append(imgElement);
                }
                cardBodyDiv.append(commentsInfoDiv);
                colDiv.append(cardBodyDiv);
                rowDiv.append(colDiv);
                cardDiv.append(rowDiv);
                postDiv.append(cardDiv);

                postsContainer.append(postDiv);
            });
        }

        function renderSearchResults(posts) {
            let postsContainer = $('#empty');
            postsContainer.empty();
            posts.forEach(function (post) {
                //img exist or not
                let img = post.base64Image;
                let postDiv = $('<div>').addClass('col-12');
                let cardDiv = $('<div>').addClass('card');
                let rowDiv = $('<div>').addClass('row');
                let colDiv = $('<div>').addClass('col-md-12');

                //.html for tag/.text for data
                let cardBodyDiv = $('<div>').addClass('card-body');
                let cardUserSpan = $('<span>').addClass('card-user').html('用戶名:' + post.user.username + '	<span class="post-time">/ 發文時間：' + post.postDate);
                let cardTitle = $('<h5>').addClass('card-title').text(post.title);
                let cardText = $('<p>').addClass('card-text').text(post.content);

                cardBodyDiv.append(cardUserSpan, cardTitle, cardText);

                if (img) {
                    let imgElement = $('<img>').attr('src', 'data:image/jpeg;base64,' + post.base64Image).addClass('Image').attr('alt', 'Image');
                    cardBodyDiv.append(imgElement);
                }

                colDiv.append(cardBodyDiv);
                rowDiv.append(colDiv);
                cardDiv.append(rowDiv);
                postDiv.append(cardDiv);

                postsContainer.append(postDiv);
            });
        }

        //以下開始為 comment --------------------------

        //留言 modal裏面的 sumbit 事件
        $('#commentForm').submit(function (e) {
            e.preventDefault();
            // 將表單數據序列化為 JSON 對象
            let formData = $(this).serialize();

            $.ajax({
                url: 'http://localhost:8080/meow/dic/submitPost/commentPost',
                type: 'POST',
                data: formData,
                success: function (comment) {
                    // 測試印出
// 		            console.log("$('#commentForm').submit(function (e) comment: " + JSON.stringify(comment));
// 		            console.log("$('#commentForm'comment.username " + comment.user.username);
// 		            console.log("$('#commentForm'comment.ID " + comment.user.id);
                    let usernameIcon = $('<i>').addClass('fa-regular fa-circle-user fa-lg').css('margin-right', '5px');

                    let commentDiv = $('<div>').attr('id', 'comment-' + comment.commentID)//for delete
                    let username = $('<span>').text(comment.user.username + " / 發文時間：");//
                    let commentDate = $('<span>').text(comment.commentDate);
                    let comments = $('<p>').text(comment.content);
                    //prepend會作爲第一個子元素，也就是插入到評論最上面
                    commentDiv.append(usernameIcon, username, commentDate, comments);
                    $('#commentsContainer').prepend(commentDiv);
                    if (loggedInUserId === comment.user.id) {
                        let deleteButton = $('<button>').text('删除').addClass('btn btn-danger').click(function () {
                            $.ajax({
                                url: "${contextRoot}/dic/deleteComment",
                                data: {commentID: comment.commentID},
                                type: "DELETE",
                                success: function (response) {
// 			 				           console.log('renderComments.loggedInUserId :', comment.comment.user.id);
                                    $('#comment-' + comment.commentID).remove();
                                },
                                error: function (xhr, status, error) {
                                    console.error(error);
                                }
                            });
                        });
                        commentDiv.append(deleteButton);
                    }
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });

            $('#commentInput').val('');
        });


        //comment的modal顯示該文章及它的留言
        function openCommentModal(post, loggedInUserId) {
            //透過寫兩個ajax的方式才能成功把我要的三個值一起傳出去
            //獲取文章
            $.ajax({
                url: "${contextRoot}/dic/user/posts/comment",
                data: {postID: post.postID},
                type: "GET",
                success: function (postContent) {
// 		        	console.log("postContentimageBase64"+postContent.imageBase64);
                    //獲取文章下的留言
// 		        	  console.log('Post content:', postContent);

                    $.ajax({
                        url: "${contextRoot}/dic/getCommentsByPostId",
                        data: {postId: post.postID},
                        type: "GET",
                        success: function (comments) {
                            renderComments(comments, loggedInUserId, postContent);
// 		                    console.log("comments"+comments);
                        },
                        error: function (xhr, status, error) {
                            console.error(error);
                        },
                    });
                },
                error: function (xhr, status, error) {
                    console.error(error);
                },
            });
            $('#hiddenPostId').val(post.postID);
            console.log('hiddenPostId:', $('#hiddenPostId').val());
            $('#commentModal').modal('show');
        }
    });


    //
    function renderComments(comments, loggedInUserId, postContent) {
        let commentsContainer = $('#commentsContainer');
        let postContainer = $('#postContainer');
        commentsContainer.empty();
        postContainer.empty();
        // 按 commentDate 新到舊來排序
        comments.sort(function (a, b) {
            return new Date(b.commentDate) - new Date(a.commentDate);
        });
// 				    console.log("Post content:", postContent.content)//test
// 				    console.log("Post title:", postContent.title)//test
// 				    console.log("Post username:", postContent.username)//test
// 				    console.log("Post postDate:", postContent.postDate)//test
        let usernameIcon = $('<i>').addClass('fa-regular fa-circle-user fa-lg').css('margin-right', '5px');
        //post
        let postUsername = $('<span>').text(postContent.username);
        let postPostDate = $('<span>').text(" / 發文時間：" + postContent.postDate);
        let postTitle = $('<h5>').text(postContent.title).css({'font-weight': 'bold', 'margin-top': '20px'});
        let postContents = $('<p>').text(postContent.content);

        postContainer.append(usernameIcon);
        postContainer.append(postUsername);
        postContainer.append(postPostDate);
        postContainer.append(postTitle);
        postContainer.append(postContents);
        if (postContent.imageBase64) {
            let postImage = $('<img>').attr('src', 'data:image/jpeg;base64,' + postContent.imageBase64).css('max-width', '100%');
            postContainer.append(postImage);
        }

        comments.forEach(function (comment) {
            //comment
            let usernameIcon = $('<i>').addClass('fa-regular fa-circle-user fa-lg').css('margin-right', '5px');
            let username = $('<span>').text(comment.username);
            let commentDate = $('<span>').text(" / 評論日期：" + comment.commentDate);
            let comments = $('<p>').text(comment.content);
            commentsContainer.append(usernameIcon);
            commentsContainer.append(username);
            commentsContainer.append(commentDate);
            commentsContainer.append(comments);

// 				        commentsContainer.append(test);//test ok 

            if (loggedInUserId === comment.userID) {
                let deleteButton = $('<button>').text('删除').addClass('btn btn-danger').click(function () {
                    $.ajax({
                        url: "${contextRoot}/dic/deleteComment",
                        data: {commentID: comment.commentID},
                        type: "DELETE",
                        success: function (response) {
                            // 處理成功的響應，例如移除評論元素
                            $('#commentModal').modal('hide');
                            $('#comment-' + comment.commentID).remove();
// 				 				           console.log('renderComments.loggedInUserId :', comment.commentID);
                        },
                        error: function (xhr, status, error) {
                            console.error(error);
// 				 				           console.log('xhr.loggedInUserId :', comment.commentID);
                        }
                    });
                });
                commentsContainer.append(deleteButton);
            }
        });
    };
    //


</script>


</body>

</html>
