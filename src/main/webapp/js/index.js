$(document).ready(function() {
	// 電影的生成指令
	$.ajax({
		url: "https://api.themoviedb.org/3/movie/upcoming",
		type: "GET",
		data: {
			api_key: "2a42a839a54f5cc62dae2671848e035c", // Replace with your TMDB API key
			language: "zh-TW",
			page: 1
		},
		success: function(response) {
			var movies = response.results;
			var topMovies = getTopMovies(movies, 8); // 取得隨機的8個電影

			$.each(topMovies, function(index, movie) {
				// 動態生成每部電影的 HTML
				var movieDiv = $('<div>', { class: 'w3l-movie-gride-agile', style: 'height: 350px' });
				var movieLink = $('<a>', { href: getTrailerUrl(movie.id), class: 'hvr-sweep-to-bottom', target: '_blank' });
				var movieImage = $('<img>', { src: getImageUrl(movie.poster_path), title: movie.title, class: 'img-responsive', alt: '' });
				var actionIconDiv = $('<div>', { class: 'w3l-action-icon' });
				var actionIcon = $('<i>', { class: 'fa fa-play-circle-o', 'aria-hidden': 'true' });
				var mid1Div = $('<div>', { class: 'mid-1 agileits_w3layouts_mid_1_home' });
				var movieTextDiv = $('<div>', { class: 'w3l-movie-text' });
				var movieTitle = $('<h6>').html($('<a>', { href: getTrailerUrl(movie.id), target: '_blank' }).text(movie.title));
				var mid2Div = $('<div>', { class: 'mid-2 agile_mid_2_home' });
				var movieInfo = $('<p>').text(movie.release_date);
				var blockStarsDiv = $('<div>', { class: 'block-stars' });
				var ratingsUl = $('<ul>', { class: 'w3l-ratings' });

				var clearfixDiv = $('<div>', { class: 'clearfix' });

				// 將動態生成的 HTML 加入網頁
				actionIconDiv.append(actionIcon);
				movieLink.append(movieImage).append(actionIconDiv);
				movieTextDiv.append(movieTitle);
				mid2Div.append(movieInfo).append(blockStarsDiv).append(clearfixDiv);
				mid1Div.append(movieTextDiv).append(mid2Div);
				movieDiv.append(movieLink).append(mid1Div);
				$('#movie-list').append(movieDiv);
			});
		}
	});

	// 取得前n部強檔電影
	function getTopMovies(movies, count) {
		return movies.slice(0, count);
	}

	// 取得電影海報的完整 URL
	function getImageUrl(posterPath) {
		if (posterPath) {
			return "https://image.tmdb.org/t/p/w500" + posterPath;
		}


		// 若沒有海報資料，可以設定一個預設的圖片 URL 或回傳空字串
		return "";
	}

	// 取得電影預告片的 URL
	function getTrailerUrl(movieId) {
		var trailerUrl = "";
		$.ajax({
			url: "https://api.themoviedb.org/3/movie/" + movieId + "/videos",
			type: "GET",
			data: {
				api_key: "2a42a839a54f5cc62dae2671848e035c", // Replace with your TMDB API key
				language: "en-US"
			},
			async: false, // 設定為同步請求，等待預告片資訊獲取完畢再返回 URL
			success: function(response) {
				if (response.results && response.results.length > 0) {
					var trailerKey = response.results[0].key;
					trailerUrl = "https://www.youtube.com/watch?v=" + trailerKey;
				}
			}
		});
		return trailerUrl;
	}
});

$(document).ready(function() {
	// 電影的生成指令
	$.ajax({
		url: "https://api.themoviedb.org/3/movie/upcoming",
		type: "GET",
		data: {
			api_key: "2a42a839a54f5cc62dae2671848e035c", // Replace with your TMDB API key
			language: "zh-TW",
			page: 2
		},
		success: function(response) {
			var movies = response.results;
			var topMovies = getTopMovies(movies, 8); // 取得隨機的8個電影

			$.each(topMovies, function(index, movie) {
				// 動態生成每部電影的 HTML
				var movieDiv = $('<div>', { class: 'w3l-movie-gride-agile', style: 'height: 350px' });
				var movieLink = $('<a>', { href: getTrailerUrl(movie.id), class: 'hvr-sweep-to-bottom', target: '_blank' });
				var movieImage = $('<img>', { src: getImageUrl(movie.poster_path), title: movie.title, class: 'img-responsive', alt: '' });
				var actionIconDiv = $('<div>', { class: 'w3l-action-icon' });
				var actionIcon = $('<i>', { class: 'fa fa-play-circle-o', 'aria-hidden': 'true' });
				var mid1Div = $('<div>', { class: 'mid-1 agileits_w3layouts_mid_1_home' });
				var movieTextDiv = $('<div>', { class: 'w3l-movie-text' });
				var movieTitle = $('<h6>').html($('<a>', { href: getTrailerUrl(movie.id), target: '_blank' }).text(movie.title));
				var mid2Div = $('<div>', { class: 'mid-2 agile_mid_2_home' });
				var movieInfo = $('<p>').text(movie.release_date);
				var blockStarsDiv = $('<div>', { class: 'block-stars' });
				var ratingsUl = $('<ul>', { class: 'w3l-ratings' });

				var clearfixDiv = $('<div>', { class: 'clearfix' });

				// 將動態生成的 HTML 加入網頁
				actionIconDiv.append(actionIcon);
				movieLink.append(movieImage).append(actionIconDiv);
				movieTextDiv.append(movieTitle);
				mid2Div.append(movieInfo).append(blockStarsDiv).append(clearfixDiv);
				mid1Div.append(movieTextDiv).append(mid2Div);
				movieDiv.append(movieLink).append(mid1Div);
				$('#movie-list2').append(movieDiv);
			});
		}
	});

	// 取得前n部強檔電影
	function getTopMovies(movies, count) {
		return movies.slice(0, count);
	}

	// 取得電影海報的完整 URL
	function getImageUrl(posterPath) {
		if (posterPath) {
			return "https://image.tmdb.org/t/p/w500" + posterPath;
		}


		// 若沒有海報資料，可以設定一個預設的圖片 URL 或回傳空字串
		return "";
	}

	// 取得電影預告片的 URL
	function getTrailerUrl(movieId) {
		var trailerUrl = "";
		$.ajax({
			url: "https://api.themoviedb.org/3/movie/" + movieId + "/videos",
			type: "GET",
			data: {
				api_key: "2a42a839a54f5cc62dae2671848e035c", // Replace with your TMDB API key
				language: "en-US"
			},
			async: false, // 設定為同步請求，等待預告片資訊獲取完畢再返回 URL
			success: function(response) {
				if (response.results && response.results.length > 0) {
					var trailerKey = response.results[0].key;
					trailerUrl = "https://www.youtube.com/watch?v=" + trailerKey;
				}
			}
		});
		return trailerUrl;
	}
});
$(document).ready(function() {
	// 電影的生成指令
	$.ajax({
		url: "https://api.themoviedb.org/3/movie/upcoming",
		type: "GET",
		data: {
			api_key: "2a42a839a54f5cc62dae2671848e035c", // Replace with your TMDB API key
			language: "zh-TW",
			page: 3
		},
		success: function(response) {
			var movies = response.results;
			var topMovies = getTopMovies(movies, 8); // 取得隨機的8個電影

			$.each(topMovies, function(index, movie) {
				// 動態生成每部電影的 HTML
				var movieDiv = $('<div>', { class: 'w3l-movie-gride-agile', style: 'height: 350px' });
				var movieLink = $('<a>', { href: getTrailerUrl(movie.id), class: 'hvr-sweep-to-bottom', target: '_blank' });
				var movieImage = $('<img>', { src: getImageUrl(movie.poster_path), title: movie.title, class: 'img-responsive', alt: '' });
				var actionIconDiv = $('<div>', { class: 'w3l-action-icon' });
				var actionIcon = $('<i>', { class: 'fa fa-play-circle-o', 'aria-hidden': 'true' });
				var mid1Div = $('<div>', { class: 'mid-1 agileits_w3layouts_mid_1_home' });
				var movieTextDiv = $('<div>', { class: 'w3l-movie-text' });
				var movieTitle = $('<h6>').html($('<a>', { href: getTrailerUrl(movie.id), target: '_blank' }).text(movie.title));
				var mid2Div = $('<div>', { class: 'mid-2 agile_mid_2_home' });
				var movieInfo = $('<p>').text(movie.release_date);
				var blockStarsDiv = $('<div>', { class: 'block-stars' });
				var ratingsUl = $('<ul>', { class: 'w3l-ratings' });

				var clearfixDiv = $('<div>', { class: 'clearfix' });

				// 將動態生成的 HTML 加入網頁
				actionIconDiv.append(actionIcon);
				movieLink.append(movieImage).append(actionIconDiv);
				movieTextDiv.append(movieTitle);
				mid2Div.append(movieInfo).append(blockStarsDiv).append(clearfixDiv);
				mid1Div.append(movieTextDiv).append(mid2Div);
				movieDiv.append(movieLink).append(mid1Div);
				$('#movie-list3').append(movieDiv);
			});
		}
	});

	// 取得前n部強檔電影
	function getTopMovies(movies, count) {
		return movies.slice(0, count);
	}

	// 取得電影海報的完整 URL
	function getImageUrl(posterPath) {
		if (posterPath) {
			return "https://image.tmdb.org/t/p/w500" + posterPath;
		}


		// 若沒有海報資料，可以設定一個預設的圖片 URL 或回傳空字串
		return "";
	}

	// 取得電影預告片的 URL
	function getTrailerUrl(movieId) {
		var trailerUrl = "";
		$.ajax({
			url: "https://api.themoviedb.org/3/movie/" + movieId + "/videos",
			type: "GET",
			data: {
				api_key: "2a42a839a54f5cc62dae2671848e035c", // Replace with your TMDB API key
				language: "en-US"
			},
			async: false, // 設定為同步請求，等待預告片資訊獲取完畢再返回 URL
			success: function(response) {
				if (response.results && response.results.length > 0) {
					var trailerKey = response.results[0].key;
					trailerUrl = "https://www.youtube.com/watch?v=" + trailerKey;
				}
			}
		});
		return trailerUrl;
	}
});



$(document).ready(function() {
	// Make an AJAX request to TMDB API - Discover Movies
	$.ajax({
		url: 'https://api.themoviedb.org/3/discover/movie?api_key=2a42a839a54f5cc62dae2671848e035c&language=zh-TW&sort_by=popularity.desc',
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			// Get a random movie from the results
			var movies = response.results;
			var randomIndex = Math.floor(Math.random() * movies.length);
			var randomMovie = movies[randomIndex];

			// Extract the required data from the random movie
			var movieTitle = randomMovie.title;
			var releaseDate = randomMovie.release_date;
			var genres = randomMovie.genre_ids;
			var overview = randomMovie.overview;
			var posterPath = randomMovie.poster_path;

			// Build the dynamic content HTML
			var dynamicContent = `
          <div class="col-md-5 video_agile_player">
            <div class="video-grid-single-page-agileits">
              <div data-video="${randomMovie.id}" id="video">
                <img src="https://image.tmdb.org/t/p/w500${posterPath}" alt="" class="img-responsiveBig" />
              </div>
            </div>
            <div class="player-text">
              <p class="fexi_header">${movieTitle}</p>
              <p class="fexi_header_para">
                <span class="conjuring_w3">簡介<label>:</label></span>${overview}
              </p>
              <p class="fexi_header_para">
                <span>上映日<label>:</label></span>${releaseDate}
              </p>
              <p class="fexi_header_para">
                <span>類型<label>:</label></span>
                ${genres.map(genreId => `<a href="genre.html">${getGenreName(genreId)}</a>`).join(' | ')}
              </p>
              <p class="fexi_header_para fexi_header_para1">
                <span>評分<label>:</label></span>
                <a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
              </p>
            </div>
          </div>
        `;

			// Update the dynamic-content div with the generated HTML
			$('#dynamic-content').html(dynamicContent);
			$('#dynamic-content2').html(dynamicContent);
			$('#dynamic-content3').html(dynamicContent);
		},
		error: function() {
			console.log('Error occurred while fetching movie data.');
		}
	});
});

// Function to get genre name by ID
function getGenreName(genreId) {
	// Replace with your own genre mapping or use a separate API request to fetch genre names
	var genreMap = {
		28: "動作",
		12: "冒險",
		16: "動畫",
		35: "喜劇",
		80: "犯罪",
		99: "紀錄片",
		18: "劇情",
		10751: "家庭",
		14: "奇幻",
		36: "歷史",
		27: "恐怖",
		10402: "音樂",
		9648: "懸疑",
		10749: "愛情",
		878: "科幻",
		10770: "電視電影",
		53: "驚悚",
		10752: "戰爭",
		37: "西部"
		// Add more genre mappings as needed
	};
	return genreMap[genreId] || '';
}
