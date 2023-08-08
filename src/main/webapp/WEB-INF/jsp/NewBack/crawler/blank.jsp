<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<title>DarkPan - Bootstrap 5 Admin Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="images/backImg/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/backCSS/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/backCSS/style.css" rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
		<div class="container-fluid pt-4 px-4">
			<div
				class="row vh-100 bg-secondary rounded justify-content-center  mx-0">
				<div class="col-md-12 text-center">
					<div>
						<form>
							<span>搜尋電影資料:</span> <select id="movie-select"></select>
						</form>
						<br>
						<div id="checkbox">
							<input type="radio" value="" id="required-radio"
								name="required-radio" style="display: none" required> <input
								type="radio" value="過去七天" id="6" name="time" required><label
								for="6">過去七天</label> <input type="radio" value="過去一個月" id="30"
								name="time"><label for="30">過去一個月</label> <input
								type="radio" value="過去一個月" id="60" name="time"><label
								for="60">過去兩個月</label>
						</div>
						<canvas id="myChart" style="height: 90%;">
        <script>
            var url;
            var data;
            var map;
            var jsonObject
            var selectedMovie
            var datasets
            var labels
            var allMovies
            const canvas = document.getElementById("my-chart");
            const select = document.getElementById("movie-select");
            const ctx = document.getElementById('myChart').getContext('2d');
            var myChart = null;
            document.getElementById('checkbox').addEventListener('change', send)
            function send() {
   			createUrl()
   			axios.get(url)
   		  	.then(response => {
   		    data = response.data;
   		    labels = Object.keys(data).sort();
   		    allMovies = [];
   		 	if (myChart) {
   		  	myChart.destroy();
   			}
   		 	select.innerHTML = ""; // 清空select
   			
   		 	labels.forEach(date => {
   		    allMovies = allMovies.concat(Object.keys(data[date]));
   		    });
   		    allMovies = Array.from(new Set(allMovies));
   		    datasets = [];
   		    for (let i = 0; i < allMovies.length; i++) {
   		      let movie = allMovies[i];
   		      let movieData = [];
   		      for (let j = 0; j < labels.length; j++) {
   		        let date = labels[j];
   		        if (data[date][movie]) {
   		          movieData.push(data[date][movie]);
   		        } else {
   		          movieData.push(null);
   		        }
   		      }
   		      datasets.push({
   		        label: movie,
   		        data: movieData,
   		        fill: false,
   		        borderColor: getRandomUniqueColor(),
   		        hidden: movieData.every(val => val === 0)
   		      });
   		    }
   		 	allMovies.forEach(movie => {
   		  	const option = document.createElement("option");
   		  	option.value = movie;
   		  	option.text = movie;
   		 	select.add(option);
   			});
   		    myChart = new Chart(ctx, {
   		      type: 'line',
   		      data: {
   		        labels: labels,
   		        datasets: datasets
   		      },
   		   options: {
   		      responsive: true,
   		      maintainAspectRatio: true,
   		      scales: {
   		        y: {
   		          reverse: true,
   		          beginAtZero: false,
   		          ticks: {
   		            stepSize: 1,
   		            min: 1,
   		          }
   		        },
   		      },
   		      plugins: {
   		        tooltip: {
   		          callbacks: {
   		            label: function(context) {
   		              var label = context.dataset.label || '';
   		              if (label) {
   		                label += ': ';
   		              }
   		              if (context.parsed.y !== null) {
   		                label += context.parsed.y;
   		              }
   		              return label;
   		            }
   		          }
   		        }
   		      }
   		    }
   		    });
   		  })
   		  .catch(error => {
   		    console.log(error);
   		  });
			}	
			function createUrl() {
                let x = document.querySelector('input[name="time"]:checked').id
                console.log(x)
                url = 'http://localhost:8080/meow/crawler/movielist/' + x
                console.log(url)
            }
			function getRandomBrightColor() {
				  var letters = '0123456789ABCDEF';
				  var color = '#';
				  var brightnessThreshold = 200; // 設定亮度閾值，超過此值視為亮色
				  var r, g, b, brightness;
				  do {
				    r = Math.floor(Math.random() * 256);
				    g = Math.floor(Math.random() * 256);
				    b = Math.floor(Math.random() * 256);
				    brightness = (r * 299 + g * 587 + b * 114) / 1000; // 計算亮度
				  } while (brightness < brightnessThreshold); // 如果顏色暗色則重新生成
				  color += (r < 16 ? '0' : '') + r.toString(16); // 將RGB轉換為16進位
				  color += (g < 16 ? '0' : '') + g.toString(16);
				  color += (b < 16 ? '0' : '') + b.toString(16);
				  return color;
				}
			function getRandomUniqueColor() {
				  const usedColors = [];
				  return function () {
				    let color;
				    do {
				      color = getRandomBrightColor();
				    } while (usedColors.includes(color));
				    usedColors.push(color);
				    return color;
				  };
				}
			select.addEventListener("change", () => {
				  // 取得 select 元素中選取的電影名稱
				  let selectedMovie = select.value;

				  // 從資料中取得所選電影的數據
				  let selectedMovieData = [];
				  for (let j = 0; j < labels.length; j++) {
				    let date = labels[j];
				    if (data[date][selectedMovie]) {
				      selectedMovieData.push(data[date][selectedMovie]);
				    } else {
				      selectedMovieData.push(null);
				    }
				  }

				  // 產生對應的圖表
				  if (myChart) {
				    myChart.destroy(); // 刪除先前的圖表
				  }
				  myChart = new Chart(ctx, {
				    type: "line",
				    data: {
				      labels: labels,
				      datasets: [
				        {
				          label: selectedMovie,
				          data: selectedMovieData,
				          fill: false,
				          borderColor: getRandomUniqueColor(),
				          hidden: selectedMovieData.every((val) => val === 0),
				        },
				      ],
				    },
				    options: {
				        responsive: true,
				        maintainAspectRatio: true,
				        scales: {
				          y: {
				            reverse: true,
				            beginAtZero: false,
				            ticks: {
				              stepSize: 1,
				              min: 1,
				              max:20,
				            }
				          },
				        },
				        plugins: {
				          tooltip: {
				            callbacks: {
				              label: function(context) {
				                var label = context.dataset.label || '';
				                if (label) {
				                  label += ': ';
				                }
				                if (context.parsed.y !== null) {
				                  label += context.parsed.y;
				                }
				                return label;
				              }
				            }
				          }
				        }
				      }
				  });
				});
        </script>				
					</div>
				</div>
			</div>
		</div>
		<!-- Blank End -->
		<jsp:include page="../layout/BackFoot.jsp"></jsp:include>
	</div>
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/chart/chart.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/tempusdominus/js/moment.min.js"></script>
	<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/backJS/main.js"></script>
	<script src="js/backJS/nav.js"></script>
</body>

</html>