<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.movie-details-container {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.8);
  justify-content: center;
  align-items: center;
    z-index: 10; /* 添加這一行 */
}
.movie-details {
  background-color: white;
  color: #333;
  padding: 32px;
  border-radius: 8px;
  width: 80%;
  max-width: 600px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.close-details {
  background-color: #ccc;
  color: white;
  padding: 8px 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 16px;
}

.cd-search {
	position: relative;
}

.search-results-container {
	position: absolute;
	z-index: 1;
	background-color: white;
	width: 100%;
	padding: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	margin-top: 8px;
	display: none;
}

.search-result {
	display: flex;
	align-items: center;
	margin-bottom: 8px;
}

.search-result img {
	width: 50px;
	height: auto;
	margin-right: 8px;
}
</style>
</head>
<body>
	
	<div class="w3ls_search">
		<div class="cd-main-header">
			<ul class="cd-header-buttons">
				<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
			</ul>
			<!-- cd-header-buttons -->
		</div>
		<div id="cd-search" class="cd-search">
			<form action="#" method="get">
				<input name="query" type="search" placeholder="Search...">
				<button id="clear-search" type="button">×</button>
			</form>
		</div>
	</div>
	<div id="search-results" class="search-results-container"></div>
	<div id="movie-details" class="movie-details-container"></div>
	<script>
		$(document).ready(function() {
			$('input[name="query"]').on('input', function() {
				var query = $(this).val();

				if (query.length >= 3) {
					searchMovies(query);
				} else {
					$('#search-results').empty();
				}
			});
			$('#clear-search').on('click', function () {
			    $('#search-query').val(''); // 清空搜尋輸入
			    $('#search-results').html(''); // 清空搜尋結果
			    $('#search-results').css('display', 'none'); // 隱藏搜尋結果容器
			  });
		});

		function searchMovies(query) {
			var apiKey = '2a42a839a54f5cc62dae2671848e035c';
			var apiUrl = 'https://api.themoviedb.org/3/search/movie?api_key='
					+ apiKey + '&query=' + encodeURIComponent(query)
					+ '&language=zh-TW';

			$.getJSON(apiUrl, function(data) {
				displaySearchResults(data.results);
			});
		}

		function displaySearchResults(results) {
			var searchResultsContainer = $('#search-results');
			searchResultsContainer.empty();

			if (results.length > 0) {
				results
						.forEach(function(movie) {
							var imageUrl = 'https://image.tmdb.org/t/p/w92'
									+ movie.poster_path;
							var movieTitle = movie.title;
							var resultHtml = '<div class="search-result">'
									+ '<img src="' + imageUrl + '" alt="' + movieTitle + '">'
									+ '<span>' + movieTitle + '</span>'
									+ '</div>';
							var searchResult = $(resultHtml);
							searchResult.on('click', function () {
							      showMovieDetails(movie.id);
							    });
							searchResultsContainer.append(searchResult);
						});

				searchResultsContainer.css('display', 'block');
			} else {
				searchResultsContainer.css('display', 'none');
			}
		}
		function showMovieDetails(movieId) {
			  var apiKey = '2a42a839a54f5cc62dae2671848e035c';
			  var apiUrl = 'https://api.themoviedb.org/3/movie/' + movieId + '?api_key=' + apiKey + '&language=zh-TW';

			  $.getJSON(apiUrl, function (data) {
				    var posterPath = data.poster_path ? 'https://image.tmdb.org/t/p/w200' + data.poster_path : 'https://via.placeholder.com/120x180';
				    var genres = data.genres.map(function (genre) {
				      return genre.name;
				    }).join(', ');

				    var detailsHtml = '<div class="movie-details">' +
				                      '<img src="' + posterPath + '" alt="' + data.title + ' 海報" style="float: left; margin-right: 16px;">' +
				                      '<h2>' + data.title + ' (' + data.release_date.slice(0, 4) + ')</h2>' +
				                      '<p><strong>評分：</strong>' + data.vote_average + ' / 10 (' + data.vote_count + ' 票)</p>' +
				                      '<p><strong>類別：</strong>' + genres + '</p>' +
				                      '<p><strong>時長：</strong>' + data.runtime + ' 分鐘</p>' +
				                      '<p><strong>劇情簡介：</strong>' + data.overview + '</p>' +
				                      '<button class="close-details" id="close-details">關閉</button>' +
				                      '</div>';

				    $('#movie-details').html(detailsHtml).css('display', 'flex');
				    $('#close-details').on('click', function () {
				      $('#movie-details').css('display', 'none');
				    });
				  });
				}

		
	</script>
	<!-- 	<script src="js/jquery-1.11.1.min.js"></script> -->
</body>
</html>