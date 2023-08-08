<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
			<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
							z-index: 10;
							
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

						.search-result img {
							width: 50px;
							height: auto;
							margin-right: 8px;
						}
					</style>
				</head>


								<body>
									<nav class="navbar navbar-default">
										<div class="navbar-header">
											<button type="button" class="navbar-toggle" data-toggle="collapse"
												data-target="#bs-example-navbar-collapse-1">
												<span class="sr-only">Toggle navigation</span> <span
													class="icon-bar"></span> <span class="icon-bar"></span> <span
													class="icon-bar"></span>
											</button>
											<h1>
												<a href="${contextRoot}/"><span>M</span>eo <span>W</span>ie</a>
											</h1>
										</div>
										<!-- navbar-header -->
										<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
											<ul class="nav navbar-nav">
												<li class="active"><a href="${contextRoot}/">首頁</a></li>
												<li><a href="${contextRoot}/Movies/search">搜尋電影</a></li>
												<li><a href="${contextRoot}/shows/available">立即訂票</a></li>
												<li class="dropdown"><a href="news.html" class="dropdown-toggle"
														data-toggle="dropdown">購物商城<b class="caret"></b></a>
													<ul class="dropdown-menu multi-column columns-3">
														<li>
															<div class="col-sm-4">
																<ul class="multi-column-dropdown">
																	<li><a href="genre.html">商城-1</a></li>
																	<li><a href="genre.html">商城-2</a></li>
																	<li><a href="genre.html">商城-3</a></li>
																	<li><a href="genre.html">商城-4</a></li>
																</ul>
															</div>
															<div class="clearfix"></div>
														</li>
													</ul>
												</li>
												<li><a href="${contextRoot}/discussion-frontend/discussion">討論區</a></li>
												<li class="dropdown"><a href="#" class="dropdown-toggle"
														data-toggle="dropdown">會員中心 <b class="caret"></b></a>
													<ul class="dropdown-menu multi-column columns-3">
														<li>
															<div class="col-sm-4">
																<ul class="multi-column-dropdown">
																	<li><a href="genre.html">會員-1</a></li>
																	<li><a href="genre.html">會員-2</a></li>
																	<li><a href="genre.html">會員-3</a></li>
																	<li><a href="genre.html">會員-4</a></li>
																</ul>
															</div>
															<div class="clearfix"></div>
														</li>
													</ul>
												</li>
												<li><a href="${contextRoot}/contact">意見填寫</a></li>
												
												<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                                                    <li><a href="${contextRoot}/backIndex">後台(測試)</a></li>
                                                </sec:authorize>
												<sec:authorize access="!isAuthenticated()">
													<li><a id="loginLink" href="#" data-toggle="modal"
															data-target="#myModal4">Login</a>
													</li>
													<li><a href="#" data-toggle="modal"
															data-target="#myModal5">Register</a></li>
												</sec:authorize>
												<sec:authorize access="isAuthenticated()">
													<li class="dropdown"><a href="#" class="dropdown-toggle"
															data-toggle="dropdown">
															<sec:authentication property="name" /><b class="caret"></b>
														</a>
														<ul class="dropdown-menu multi-column columns-3">
															<li>
																<div class="col-sm-3">
																	<ul class="multi-column-dropdown">
																		<li><a
																				href="${contextRoot}/user/center">會員中心</a>
																		</li>
																		<li><a id="logoutLink" href="#">Logout</a></li>
																	</ul>
																</div>
																<div class="clearfix"></div>
															</li>
														</ul>
													</li>
													<form:form action="${contextRoot}/logout" method="post"
														hidden="true" id="logoutForm">
														<input type="submit" value="Logout" />
													</form:form>
												</sec:authorize>
											</ul>

										</div>
										<div class="clearfix"></div>
									</nav>

									<div id="search-results" class="search-results-container"></div>
									<div id="movie-details" class="movie-details-container"></div>
									<script>
										$(document).ready(function () {
											$(".dropdown").hover(
												function () {
													$('.dropdown-menu', this).stop(true, true).slideDown("fast");
													$(this).toggleClass('open');
												},
												function () {
													$('.dropdown-menu', this).stop(true, true).slideUp("fast");
													$(this).toggleClass('open');
												}
											);
											$('input[name="query"]').on('input', function () {
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
											$("#logoutLink").on('click', function (event) {
												event.preventDefault();
												$("#logoutForm").submit();
											})
										});

										function searchMovies(query) {
											var apiKey = '2a42a839a54f5cc62dae2671848e035c';
											var apiUrl = 'https://api.themoviedb.org/3/search/movie?api_key='
												+ apiKey + '&query=' + encodeURIComponent(query)
												+ '&language=zh-TW';

											$.getJSON(apiUrl, function (data) {
												displaySearchResults(data.results);
											});
										}

										function displaySearchResults(results) {
											var searchResultsContainer = $('#search-results');
											searchResultsContainer.empty();

											if (results.length > 0) {
												results
													.forEach(function (movie) {
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