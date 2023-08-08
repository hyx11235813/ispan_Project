<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<title>DarkPan - Bootstrap 5 Admin Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="${contextRoot}/images/backImg/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="${contextRoot}/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${contextRoot}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="${contextRoot}/css/backCSS/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${contextRoot}/css/backCSS/style.css" rel="stylesheet">
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
#add-movie-form{
color:white;}
#add-movie-form label {
	font-weight: bold;
}

#add-movie-form button[type="submit"] {
	margin-top: 10px;
}

/* 標題樣式 */
h1 {
	text-align: center;
	margin-top: 50px;
}

/* 表格樣式 */
table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 30px;
	max-height: 1000px;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #56637187;
}

th {
	background-color: #566371;
	color: white;
}

/* 模態框樣式 */


.modal-content {
	background-color: #fefefe73;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #e0d9d9;
	width: 80%;
	color:white;
}

.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

/* 表單樣式 */
form {
	margin: 0px auto;
	/* 垂直置中並設定水平邊距 */
	max-width: 600px;
	/* 設定最大寬度 */
}

label {
	display: inline-block;
	width: 80px;
	margin-right: 10px;
}

input[type="text"], input[type="movie"], textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

button[type="submit"], button {
	background-color: #626c76;
	color: white;
	padding: 8px 16px;
	/* 將 padding 調整為 8px 上下、16px 左右 */
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px;
	/* 加上 margin-right 以便將兩個按鈕平行排列 */
}

button[type="submit"]:hover, button:hover {
	background-color: #566371;
}

/* 响應式設計 */
@media screen and (max-width: 600px) {
	/* 表格樣式 */
	th, td {
		display: block;
	}
	tr {
		margin-bottom: 30px;
	}
	th:first-child, td:first-child {
		padding-top: 12px;
	}
	th:last-child, td:last-child {
		padding-bottom: 12px;
	}

	/* 表單樣式 */
	label {
		display: block;
		margin-bottom: 10px;
		width: 100%;
		/* 在小於 600px 的螢幕上將標籤設定為 100% 寬度 */
	}
	input[type="text"], input[type="movie"], textarea {
		margin-bottom: 10px;
	}
	form {
		margin-top: 20px;
	}
}
</style>
</head>

<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<jsp:include page="../layout/BackNav.jsp"></jsp:include>


		<!-- Blank Start -->
		<div class="container-fluid pt-4 px-4 ">
			<div
				class="row bg-secondary rounded align-items-center justify-content-center mx-0">
				<h1>電影管理</h1>
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>片名</th>
							<th>導演</th>
							<th>演員</th>
							<th>片長</th>
							<th>簡介</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody th:each="movie : ${movies}">
						<tr>
							<td th:text="${movie.id}"></td>
							<td th:text="${movie.name}"></td>
							<td th:text="${movie.director}"></td>
							<td th:text="${movie.actors}"></td>
							<td th:text="${movie.length}"></td>
							<td th:text="${movie.description}"></td>
							<td>
								<button onclick="getMovieById(${movie.id})" data-bs-toggle="modal" data-bs-target="#myModal">
									<i class="fas fa-edit"></i> 編輯
								</button>
								<button onclick="deleteMovie(${movie.id})">
									<i class="fas fa-trash-alt"></i> 刪除
								</button>
							</td>
						</tr>
					</tbody>
				
					<button class="btn btn-primary mb-3" id="showAddMovieForm"
						data-bs-toggle="modal" data-bs-target="#add-movie-form">新增電影資料</button>
				</table>

				<div id="myModal" class="modal">
					<div class="modal-dialog">
						<div class="modal-content">
							<span class="close">&times;</span>
							<h2>修改排片</h2>
							<form id="update-form">
								<label>ID:</label> <input type="text" name="id" readonly>

								<label>片名:</label> <input type="text" name="name"> <label>導演:</label>
								<input type="text" name="director"> <label>演員:</label> <input
									type="text" name="actors"></input> <label>片長:</label> <input
									type="text" name="length"></input> <label>簡介:</label>
								<textarea name="description"></textarea>

								<button type="submit">
									<i class="fas fa-save"></i> 更新
								</button>
							</form>
						</div>
					</div>
				</div>

				<!-- Add Movie Form (Hidden by default) -->

				<div id="add-movie-form" class="modal" tabindex="-1"
					aria-labelledby="add-movie-modal-label" aria-hidden="true"">
					<div class="modal-dialog">
					<div class="modal-content">
						<form id="add-form">
							<h2 id="added">新增排片</h2>
							<select id="movie-dropdown">
								<option value="">--Select a Movie--</option>
							</select><br> <label>片名:</label> <input type="text" name="name"
								id="name"> <label>導演:</label> <input type="text"
								name="director" id="director"> <label>演員:</label> <input
								type="text" name="actors" id="actors"></input> <label>片長:</label>
							<input type="text" name="length" id="length"></input> <label>簡介:</label>
							<textarea name="description" id="description"></textarea>
							<div id="img-container"></div>
							<button type="submit">
								<i class="fas fa-plus-circle"></i> 新增
							</button>
						</form>
					</div>
					</div>
				</div>
			</div>
			<!-- Blank End -->


			<jsp:include page="../layout/BackFoot.jsp"></jsp:include>
		</div>


		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="app.js"></script>
		
		<script>
                    const movieDropdown = document.getElementById("movie-dropdown");
                    const nameInput = document.getElementById("name");
                    const directorInput = document.getElementById("director");
                    const actorsInput = document.getElementById("actors");
                    const lengthInput = document.getElementById("length");
                    const descriptionInput = document.getElementById("description");
                    const imgContainer = document.getElementById("img-container");
                    const movieForm = document.getElementById('showAddMovieForm');
                    
                    movieForm.addEventListener('click', showAddMovieForm);
                    var data;
                    // 獲取所有電影
                    function getAllMovies() {
                        $.ajax({
                            url: '${contextRoot}/api/movies',
                            type: 'GET',
                            success: function (data) {
                                var movies = data;
                                for (var i = 0; i < movies.length; i++) {
                                    var movie = movies[i];
                                    $('table tbody').append('<tr><td>' + movie.id + '</td><td>' + movie.name + '</td><td>' + movie.director + '</td><td>' + movie.actors + '</td><td>' + movie.length + '</td><td>' + movie.description + '</td><td><button onclick="getMovieById(' + movie.id + ')"><i class="fas fa-edit"></i> 編輯</button> <button onclick="deleteMovie(' + movie.id + ')"><i class="fas fa-trash-alt"></i> 刪除</button></td></tr>');
                                }
                            }
                        });
                    }

                    // 獲取單個電影
                    function getMovieById(id) {
                        $.ajax({
                            url: '${contextRoot}/api/movies/' + id,
                            type: 'GET',
                            success: function (data) {
                                $('#update-form input[name="id"]').val(data.id);
                                $('#update-form input[name="name"]').val(data.name);
                                $('#update-form input[name="director"]').val(data.director);
                                $('#update-form input[name="actors"]').val(data.actors);
                                $('#update-form input[name="length"]').val(data.length);
                                $('#update-form textarea[name="description"]').val(data.description);


                                // 显示模态框
                                var modal = document.getElementById("myModal");
                                modal.style.display = "block";

                                // 当用户点击模态框关闭按钮或模态框外部区域，关闭模态框
                                var closeButton = document.getElementsByClassName("close")[0];
                                closeButton.onclick = function () {
                                    modal.style.display = "none";
                                };
                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                    }
                                }
                            }})
                    }

                   

                    // 更新现有的电子邮件记录
                    function updateMovie(event) {
                        event.preventDefault();
                        var id = $('#update-form input[name="id"]').val();
                        var name = $('#update-form input[name="name"]').val();
                        var director = $('#update-form input[name="director"]').val();
                        var actors = $('#update-form input[name="actors"]').val();
                        var length = $('#update-form input[name="length"]').val();
                        var description = $('#update-form textarea[name="description"]').val();
                        var data = {
                            'id': id,
                            'name': name,
                            'director': director,
                            'actors': actors,
                            'length': length,
                            'description': description
                        };
                        $.ajax({
                            url: '${contextRoot}/api/movies/' + id,
                            type: 'PUT',
                            data: JSON.stringify(data),
                            contentType: 'application/json',
                            success: function (data) {
                                console.log(data);
                                $('table tbody').empty();
                                getAllMovies();

                                // 关闭模态框
                                var modal = document.getElementById("myModal");
                                modal.style.display = "none";
                            }
                        });
                    }

                    // 删除电子邮件记录
                    function deleteMovie(id) {
                        if (confirm("確定要刪除這部排片嗎？")) {
                            $.ajax({
                                url: '${contextRoot}/api/movies/' + id,
                                type: 'DELETE',
                                success: function (data) {
                                    console.log(data);
                                    $('table tbody').empty();
                                    getAllMovies();
                                }
                            });
                        }
                    }
                    var map;
                    function showAddMovieForm() {
                       /*  $('#add-movie-form').show(); */

                        $(document).mouseup(function (e) {
                            var container = $("#add-movie-form");
                            if (!container.is(e.target) && container.has(e.target).length === 0) {
                                container.hide();
                            }
                        });
                        imgContainer.innerHTML = "";
                        document.getElementById("movie-dropdown").selectedIndex=0;
                        var movieDropdown = document.getElementById("movie-dropdown");
                        var xhr = new XMLHttpRequest();

                        xhr.onreadystatechange = function() {
                          if (this.readyState === 4 && this.status === 200) {
                            var response = JSON.parse(this.responseText);
                            map = new Map(Object.entries(response));

                            var keys = Array.from(map.keys());
                            keys.forEach(function(key) {
                              var option = document.createElement("option");
                              option.value = key;
                              option.text = key;
                              movieDropdown.appendChild(option);
                            });
                          } else if (this.readyState === 4 && this.status !== 200) {
                            console.log("Request failed:", this.status);
                          }
                        };

                        xhr.open("GET", "http://localhost:8080/meow/crawler/movielist/comingsoon", true);
                        xhr.send();

                    }

                    $(document).ready(function () {
                        // 页面加载时获取所有电子邮件记录
                        getAllMovies();


                        // 添加电子邮件记录
                        $('#add-form').submit(function (event) {
                            event.preventDefault();
                            var name = $('#add-form input[name="name"]').val();
                            var director = $('#add-form input[name="director"]').val();
                            var actors = $('#add-form input[name="actors"]').val();
                            var length = $('#add-form input[name="length"]').val();
                            var description = $('#add-form textarea[name="description"]').val();
                            var data = {
                                'name': name,
                                'director': director,
                                'actors': actors,
                                'length': length,
                                'description': description
                            };
                            $.ajax({
                                url: '${contextRoot}/api/movies',
                                type: 'POST',
                                data: JSON.stringify(data),
                                contentType: 'application/json',
                                success: function (data) {
                                    console.log(data);
                                    $('table tbody').empty();
                                    getAllMovies();
                                }
                            });
                            $('.modal').modal('hide');
                           
                            // 清空输入框的值
                            $('#add-form input[name="name"]').val('');
                            $('#add-form input[name="director"]').val('');
                            $('#add-form input[name="actors"]').val('');
                            $('#add-form input[name="length"]').val('');
                            $('#add-form textarea[name="description"]').val('');

                        });
                        // 更新电子邮件记录
                        $('#update-form').submit(updateMovie);

                        // 当用户点击模态框外部区域，关闭模态框
                        var modal = document.getElementById("myModal");
                        window.onclick = function (event) {
                            if (event.target == modal) {
                                modal.style.display = "none";
                            }
                        }

                    });
                    movieDropdown.addEventListener("change", function () {
                        // 获取当前选中的电影名称
                        const movieName = this.value;

                        // 根据电影名称从map中获取电影信息
                        const movieInfo = map.get(movieName);


                        // 将电影信息填入表单中
                        nameInput.value = movieInfo.moviename;
                        directorInput.value = movieInfo.director;
                        actorsInput.value = movieInfo.actor;
                        lengthInput.value = movieInfo.length;
                        descriptionInput.value = movieInfo.shortstory;
                        // 創建圖片元素
                        const img = document.createElement("img");
                        const imageString = movieInfo.image;
                        const imageBytes = Uint8Array.from(atob(imageString), c => c.charCodeAt(0));
                        const blob = new Blob([new Uint8Array(imageBytes)], { type: "image/jpeg" });

                        const reader = new FileReader();
                        reader.readAsDataURL(blob);
                        reader.onload = function () {
                            const base64String = reader.result;
                            img.src = base64String;

                            // 將圖片顯示在畫面上
                        // 將圖片顯示在畫面上
    img.style.maxWidth = "50%"; // 設定圖片最大寬度為容器的寬度
    img.style.height = "auto"; // 讓圖片的高度自動調整，保持比例
                            
                            imgContainer.innerHTML = "";
                            imgContainer.appendChild(img);
                        }

                    });
                </script>
		<!-- JavaScript Libraries -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${contextRoot}/lib/chart/chart.min.js"></script>
		<script src="${contextRoot}/lib/easing/easing.min.js"></script>
		<script src="${contextRoot}/lib/waypoints/waypoints.min.js"></script>
		<script src="${contextRoot}/lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="${contextRoot}/lib/tempusdominus/js/moment.min.js"></script>
		<script
			src="${contextRoot}/lib/tempusdominus/js/moment-timezone.min.js"></script>
		<script
			src="${contextRoot}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

		<!-- Template Javascript -->
		<script src="${contextRoot}/js/backJS/main.js"></script>
</body>

</html>