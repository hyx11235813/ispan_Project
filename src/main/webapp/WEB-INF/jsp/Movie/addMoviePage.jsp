	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
	    <meta charset="UTF-8">
	    <title>Movie List</title>
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	    <link rel="stylesheet" href="${contextRoot}/css/main.css" />
	    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css" />
	    <style>
	    
	    
	   table {
	    border-collapse: collapse;
	    width: 100%; /* 將表格寬度改為100% */
	}
	
	th,
	td {
	    text-align: left;
	    padding: 8px;
	}
	
	th {
	    background-color: #4CAF50;
	    color: white;
	}
	
	tr:nth-child(even) {
	    background-color: #f2f2f2;
	}
	
	#footer {
	    margin-top: 50px;
	    padding: 20px;
	    text-align: center;
	}
	
	.form-group label {
	    display: block;
	    margin-bottom: 0.5rem;
	    font-weight: bold;
	}
	
	.form-group input,
	.form-group textarea {
	    margin-bottom: 1rem;
	}
	
	#movies th:nth-child(5),
	#movies td:nth-child(5) {
	    width: 30%; /* 將表格第5列的寬度調整為30% */
	}
	
	#movies th:nth-child(6),
	#movies td:nth-child(6) {
	    width: 15%; /* 將表格第6列的寬度調整為15% */
	}
	
	#movies td button {
	    margin-right: 0.5rem;
	}
	
	#movies td button:last-child {
	    margin-right: 0;
	}
	
	</style>
	
	</head>
	<body>
	    <div class="container-fluid">
	        <div class="row">
	            <div class="col-lg-12">
	                <h1>Movie List</h1>
	                <form>
	                    <div class="form-group">
	                        <label for="name">Name:</label>
	                        <input type="text" class="form-control" id="name" required>
	                    </div>
	                    <div class="form-group">
	                        <label for="director">Director:</label>
	                        <input type="text" class="form-control" id="director" required>
	                    </div>
	                    <div class="form-group">
	                        <label for="actors">Actors:</label>
	                        <input type="text" class="form-control" id="actors" required>
	                    </div>
	                    <div class="form-group">
	                        <label for="length">Length:</label>
	                        <input type="number" class="form-control" id="length" required>
	                    </div>
	                    <div class="form-group">
	                        <label for="description">Description:</label>
	                        <textarea class="form-control" id="description" rows="5" required></textarea>
	                    </div>
	                    <button type="button" class="btn btn-sm btn-primary" onclick="addMovie()">Add Movie</button>
	                </form>
	            </div>
	        </div>
	        <div class="row mt-4">
	            <div class="col-lg-12">
	                <table id="movies" class="table table-striped">
	                    <thead>
	                        <tr>
	                            <th>Name</th>
	                            <th>Director</th>
	                            <th>Actors</th>
	                            <th>Length</th>
	                            <th>Description</th>
	                            <th>Action</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	    <script>
	    // 获取电影列表
	    function getMovies() {
	        $.ajax({
	            type : 'GET',
	            url : 'http://localhost:8080/meow/api/movies',
	            dataType : 'json',
	            success : function(movies) {
	                var movieTable = $('#movies');
	                movieTable.find('tr:gt(0)').remove();
	                $.each(movies, function(index, movie) {
	                    var row = $('<tr>');
	                    $('<td>').text(movie.name).appendTo(row);
	                    $('<td>').text(movie.director).appendTo(row);
	                    $('<td>').text(movie.actors).appendTo(row);
	                    $('<td>').text(movie.length).appendTo(row);
	                    $('<td>').text(movie.description).appendTo(row);
	                    var actionCell = $('<td>').appendTo(row);
	                    $('<button>').text('Edit').addClass('btn btn-sm btn-primary').click(function() {
	                        editMovie(movie.id);
	                    }).appendTo(actionCell);
	                    $('<button>').text('Delete').addClass('btn btn-sm btn-danger').click(function() {
	                        deleteMovie(movie.id);
	                    }).appendTo(actionCell);
	                    row.appendTo(movieTable);
	                });
	            },
	            error : function() {
	                alert('Failed to get movies!');
	            }
	        });
	    }
	
	    function addMovie() {
	        var name = $('#name').val();
	        var director = $('#director').val();
	        var actors = $('#actors').val();
	        var length = parseInt($('#length').val());
	        var description = $('#description').val();
	
	        // 檢查輸入是否為空值
	        if (!name || !director || !actors || !length || !description) {
	            alert('請輸入完整資訊');
	            return;
	        }
	
	        var movie = {
	            name: name,
	            director: director,
	            actors: actors,
	            length: length,
	            description: description
	        };
	
	        $.ajax({
	            type: 'POST',
	            url: 'http://localhost:8080/meow/api/movies',
	            contentType: 'application/json',
	            data: JSON.stringify(movie)
	        }).done(function() {
	            getMovies();
	            $('#name').val('');
	            $('#director').val('');
	            $('#actors').val('');
	            $('#length').val('');
	            $('#description').val('');
	        });
	    }
	
	    // 编辑电影
	    function editMovie(id) {
	        // 通过 AJAX 获取指定 ID 的电影数据
	        $.get('http://localhost:8080/meow/api/movies/' + id, function(movie) {
	            // 创建一个模态框用于显示编辑表单
	            var modal = $('<div>').appendTo('body');
	            $('<h2>').text('Edit Movie').appendTo(modal);
	            var form = $('<form>').appendTo(modal);
	            $('<label>').text('Name:').appendTo(form);
	            $('<input>').attr('type', 'text').attr('id', 'editName').val(
	                    movie.name).appendTo(form);
	            $('<label>').text('Director:').appendTo(form);
	            $('<input>').attr('type', 'text').attr('id', 'editDirector')
	                    .val(movie.director).appendTo(form);
	            $('<label>').text('Actors:').appendTo(form);
	            $('<input>').attr('type', 'text').attr('id', 'editActors').val(
	                    movie.actors).appendTo(form);
	            $('<label>').text('Length:').appendTo(form);
	            $('<input>').attr('type', 'number').attr('id', 'editLength')
	            .val(movie.length).appendTo(form);
	    $('<label>').text('Description:').appendTo(form);
	    $('<textarea>').attr('id', 'editDescription').val(
	            movie.description).appendTo(form);
	    // 创建“保存”按钮，并在点击时发送 PUT 请求将修改后的电影数据保存到服务器上
	    $('<button>').text('Save').addClass('btn btn-sm btn-primary').click(function() {
	        var editedMovie = {
	            name : $('#editName').val(),
	            director : $('#editDirector').val(),
	            actors : $('#editActors').val(),
	            length : parseInt($('#editLength').val()),
	            description : $('#editDescription').val()
	        };
	        $.ajax({
	            type : 'PUT',
	            url : 'http://localhost:8080/meow/api/movies/' + id,
	            contentType : 'application/json',
	            data : JSON.stringify(editedMovie)
	        }).done(function() {
	            // 保存成功后，重新获取电影列表，并关闭模态框
	            getMovies();
	            modal.remove();
	        });
	    }).appendTo(form);
	    // 创建“取消”按钮，并在点击时关闭模态框
	    $('<button>').text('Cancel').addClass('btn btn-sm btn-secondary ml-2').click(function() {
	        modal.remove();
	    }).appendTo(form);
	});
	}
	
	// 删除电影
	function deleteMovie(id) {
	if (confirm('確定要刪嗎?')) {
	    $.ajax({
	        type : 'DELETE',
	        url : 'http://localhost:8080/meow/api/movies/' + id
	    }).done(function() {
	        getMovies();
	    });
	}
	}
	
	// 页面加载完成后，获取电影列表
	$(document).ready(function() {
	getMovies();
	});
	</script>
	<!-- Scripts -->
	<script src="${contextRoot}/js/jquery.min.js"></script>
	<script src="${contextRoot}/js/jquery.dropotron.min.js"></script>
	<script src="${contextRoot}/js/browser.min.js"></script>
	<script src="${contextRoot}/js/breakpoints.min.js"></script>
	<script src="${contextRoot}/js/util.js"></script>
	<script src="${contextRoot}/js/main.js"></script>
	<script src="${contextRoot}/js/bootstrap.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	</body>
	</html>
	    
