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
<style>
</style>
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
						<label for="movie-search">輸入想搜尋的電影名:</label> <input style=""
							name="moviename" id="movie-search" required="required"
							list="movie-list" style="textalign=left">
						<datalist id="movie-list"></datalist>
						<button class="btn btn-primary" id="submit">Search</button>
						<span id="avg"></span>
						<div style="height: 700px; overflow-y: scroll;">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Comment</th>
										<th>Rating</th>
									</tr>
								</thead>
								<tbody id="review-table-body">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Blank End -->


		<jsp:include page="../layout/BackFoot.jsp"></jsp:include>
	</div>

	<script>
		const input = document.getElementById('movie-search');
		var movieName;
		var data;
		var reviews;
		const btn = document.getElementById('submit');
		const tableBody = document.querySelector('#review-table-body');
		const movielist=document.getElementById('movie-list');
		const avgRatingdiv = document.getElementById('avg');
		const spinner = document.getElementById('spinner');
		btn.addEventListener('click', () => {
			  movieName = input.value;
			  spinner.classList.add('show');
			  // 構造要發送的 URL
			  const url = 'http://localhost:8080/meow/crawler/imdb/comments?moviename='+movieName;
			  // 發送 GET 請求並等待回應
			  axios.get(url)
			    .then(response => {
			      spinner.classList.remove('show');
			      data=response.data;
			      tableBody.innerHTML='';
			      // 在這裡處理回應的數據
				  const ratings = data.map(review => review.rating); // 取出所有 rating
				  const sum = ratings.reduce((acc, cur) => acc + cur, 0); // 計算總和
				  const avgRating = sum / ratings.length; // 計算平均值
				  const roundedRating = avgRating.toFixed(1);
				  if(roundedRating!=NaN){
				  avgRatingdiv.innerHTML='<span>平均評分為:'+roundedRating+'</span>';
				  }
					if(data==''){
					  avgRatingdiv.innerHTML='<span>查無資料</span>'
				  }
				  data.forEach(review => {
			          const tr = document.createElement('tr');
			          const commentTd = document.createElement('td');
			          const ratingTd = document.createElement('td');
			          const urlTd = document.createElement('td');
			          commentTd.style.textAlign = "left";
						
			          commentTd.innerText = review.comment;
			          ratingTd.innerText = review.rating;
			      
										
			          tr.appendChild(commentTd);
			          tr.appendChild(ratingTd);
			          tr.appendChild(urlTd);

			          tableBody.appendChild(tr);
			        });
			    })
			    .catch(error => {
			      console.error(error);
			      // 在這裡處理錯誤
			      spinner.classList.remove('show');
			    });
			});
		window.addEventListener('load', () => {
			  axios.get('http://localhost:8080/meow/crawler/toplist/today')
			    .then(response => {
			      reviews = response.data;
			      reviews.forEach(movie => {
			          const option = document.createElement('option');
			          option.text = movie.moviename;
			          movielist.appendChild(option);
			      	});
			    })
			    .catch(error => {
			      console.error(error);
			    });
			});
	</script>

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
</body>

</html>