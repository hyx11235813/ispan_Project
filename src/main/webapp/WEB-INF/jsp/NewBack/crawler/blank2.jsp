<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
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
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
			<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

			<!-- Libraries Stylesheet -->
			<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
			<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

			<!-- Customized Bootstrap Stylesheet -->
			<link href="css/backCSS/bootstrap.min.css" rel="stylesheet">

			<!-- Template Stylesheet -->
			<link href="css/backCSS/style.css" rel="stylesheet">
			<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
			<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
			<style type="text/css">
				.modal-body {
					overflow-y: scroll;
				}

				/* table { */
				/*   table-layout: fixed; */
				/*   width: 100%; */
				/* } */
			</style>
		</head>

		<body>
			<div class="container-fluid position-relative d-flex p-0">
				<!-- Spinner Start -->
				<div id="spinner"
					class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
					<div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
						<span class="sr-only">Loading...</span>
					</div>
				</div>
				<!-- Spinner End -->


				<jsp:include page="../layout/BackNav.jsp"></jsp:include>


				<!-- Blank Start -->
				<div class="container-fluid pt-4 px-4">
					<div class="row vh-100 bg-secondary rounded justify-content-center  mx-0">
						<div class="col-md-12 text-center">
							<div id="content">
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Modal
													title</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal"
													aria-label="Close"></button>
											</div>
											<div class="modal-body">我是瓢蟲</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- Blank End -->


				<jsp:include page="../layout/BackFoot.jsp"></jsp:include>
			</div>

			<script>
				var data
				const clickableImgs = document.querySelectorAll('.clickable');
				const content = document.getElementById('content');
				const spinner = document.getElementById('spinner');
				const MAX_WIDTH = 300;
				const MAX_HEIGHT = 400;
				window.addEventListener('load', function () {
					spinner.classList.add('show');
					axios.get('http://localhost:8080/meow/crawler/movielist/allMovieComments')
						.then(function (response) {
							data = response.data;
							spinner.classList.remove('show');
							const key_list = Object.keys(response.data);
							const myMap = new Map(Object.entries(data));
							for (const [key, value] of myMap.entries()) {
								// 創建元素
								const modalDiv = document.createElement("div");
								const modalDialogDiv = document.createElement("div");
								const modalContentDiv = document.createElement("div");
								const modalHeaderDiv = document.createElement("div");
								const modalTitle = document.createElement("h5");
								const closeButton = document.createElement("button");
								const modalBodyDiv = document.createElement("div");
								const modalFooterDiv = document.createElement("div");
								const closeButton2 = document.createElement("button");
								// 						modalContentDiv.style.maxWidth = "600px";
								// 設置元素屬性
								modalDiv.className = "modal fade";
								modalDiv.id = key;
								modalDiv.tabIndex = "-1";
								modalDiv.setAttribute("aria-labelledby", "exampleModalLabel");
								modalDiv.setAttribute("aria-hidden", "true");

								modalDialogDiv.className = "modal-dialog modal-xl";


								modalContentDiv.className = "modal-content";

								modalHeaderDiv.className = "modal-header";

								modalTitle.className = "modal-title";
								modalTitle.id = "exampleModalLabel";
								modalTitle.textContent = "Modal title";
								modalContentDiv.style.maxWidth = "100%";
								closeButton.type = "button";
								closeButton.className = "btn-close";
								closeButton.setAttribute("data-bs-dismiss", "modal");
								closeButton.setAttribute("aria-label", "Close");

								modalBodyDiv.className = "modal-body";
								let table = document.createElement('table');
								let thead = document.createElement('thead');
								let tbody = document.createElement('tbody');
								let headers = ['Comment', 'Rating', 'Added'];
								let headerRow = document.createElement('tr');

								headers.forEach(headerText => {
									let header = document.createElement('th');
									header.innerText = headerText;
									headerRow.appendChild(header);
								});
								table.style.maxWidth = "100%";
								// 						tbody.style.maxWidth = "100%";
								thead.appendChild(headerRow);
								table.appendChild(thead);

								for (let item of value) {
									let row = document.createElement('tr');
									// 						  row.style.maxWidth= "100%";
									let cell1 = document.createElement('td');
									cell1.innerText = item.comment;
									row.appendChild(cell1);

									let cell2 = document.createElement('td');
									cell2.innerText = item.rating;
									row.appendChild(cell2);

									let cell3 = document.createElement('td');
									cell3.innerText = item.added;
									row.appendChild(cell3);

									tbody.appendChild(row);
								}

								table.appendChild(tbody);

								// Add the table to your page (e.g. to a div with id "content")
								table.classList.add('table')
								modalBodyDiv.appendChild(table);
								modalFooterDiv.className = "modal-footer";

								closeButton2.type = "button";
								closeButton2.className = "btn btn-secondary";
								closeButton2.setAttribute("data-bs-dismiss", "modal");
								closeButton2.textContent = "Close";

								// 組合元素
								modalHeaderDiv.appendChild(modalTitle);
								modalHeaderDiv.appendChild(closeButton);

								modalFooterDiv.appendChild(closeButton2);

								modalContentDiv.appendChild(modalHeaderDiv);
								modalContentDiv.appendChild(modalBodyDiv);
								modalContentDiv.appendChild(modalFooterDiv);

								modalDialogDiv.appendChild(modalContentDiv);

								modalDiv.appendChild(modalDialogDiv);

								// 將創建好的元素插入 DOM 中
								content.appendChild(modalDiv);

							}
							for (const key of key_list) {
								axios.get('http://localhost:8080/meow/crawler/img/' + key)
									.then(function (response) {
										console.log(response.data)
										const imgUrl = response.data
										const aElem = document.createElement("a");
										const imgElem = document.createElement("img");
										aElem.href = imgUrl;
										// 							  aElem.setAttribute("onclick", 'showModal('+imgUrl+');');
										imgElem.onload = function () {
											if (imgElem.width > MAX_WIDTH || imgElem.height > MAX_HEIGHT) {
												if (imgElem.width > imgElem.height) {
													imgElem.width = MAX_WIDTH;
													imgElem.height = (MAX_WIDTH / imgElem.width) * imgElem.height;
												} else {
													imgElem.height = MAX_HEIGHT;
													imgElem.width = (MAX_HEIGHT / imgElem.height) * imgElem.width;
												}
											}
										};
										imgElem.src = imgUrl; // 将获取到的imgUrl作为img元素的src属性值
										imgElem.classList.add('clickable');
										// 把點擊圖片觸發 showModal 函式的設定放到這裡
										aElem.addEventListener('click', (event) => {
											event.preventDefault();
											showModal(key);
										});
										aElem.appendChild(imgElem);
										content.appendChild(aElem);
									})
							}
						})
						.catch(function (error) {
							console.log(error);
							spinner.classList.remove('show');
						});
				});
				// 		clickableImgs.forEach((img) => {
				// 			  img.addEventListener('click', () => {
				// 			    showModal(key);
				// 			  });
				// 			});
				function showModal(key) {
					const modal = document.getElementById(key);
					const Modal = new bootstrap.Modal(modal);
					Modal.show();
				}
			</script>


			<!-- JavaScript Libraries -->
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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