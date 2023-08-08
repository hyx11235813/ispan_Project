<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<title>MoeWie後台</title>
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
<style type="text/css">
.text-decoration-line-through-red {
  text-decoration: line-through;
  color: red;
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


		<jsp:include page="layout/BackNav.jsp"></jsp:include>


		<!-- Sale & Revenue Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4">
				<div class="col-sm-6 col-xl-4">
					<div
						class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
						<i class="fa fa-chart-line fa-3x text-primary"></i>
						<div class="ms-3">
							<p class="mb-2">昨日銷售額</p>
							<h6 class="mb-0" id="todaysale"></h6>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-xl-4">
					<div
						class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
						<i class="fa fa-chart-bar fa-3x text-primary"></i>
						<div class="ms-3">
							<p class="mb-2">昨日滿座率</p>
							<h6 class="mb-0" id="todayseat"></h6>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-xl-4">
					<div
						class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
						<i class="fa fa-chart-area fa-3x text-primary"></i>
						<div class="ms-3">
							<p class="mb-2">近一星期最熱銷電影</p>
							<h6 class="mb-0" id="hot"></h6>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Sale & Revenue End -->


		<!-- Sales Chart Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4">
				<div class="col-sm-12 col-xl-6">
					<div class="bg-secondary text-center rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<h6 class="mb-0">過去一周每部電影滿座率:</h6>
						</div>
						<canvas id="seats"></canvas>
					</div>
				</div>
				<div class="col-sm-12 col-xl-6">
					<div class="bg-secondary text-center rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<h6 class="mb-0">過去一個星期各個電影銷售額:</h6>
						</div>
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</div>
		</div>
		<!-- Sales Chart End -->
		<!-- Widgets Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4">
				<div class="col-sm-12 col-md-6 col-xl-4">
					<div class="h-100 bg-secondary rounded p-4" id="shortMessage">
						<div
							class="d-flex align-items-center justify-content-between mb-2">
							<h6 class="mb-0">Messages</h6>
							<a href="http://localhost:8080/meow/emailEdit">Show All</a>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-xl-4">
					<div class="h-100 bg-secondary rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<h6 class="mb-0">Calender</h6>
							<a href="">Show All</a>
						</div>
						<div id="calender"></div>
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-xl-4">
					<div class="h-100 bg-secondary rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<h6 class="mb-0">To Do List</h6>
							<a href="">Show All</a>
						</div>
						<div class="d-flex mb-2">
							<input class="form-control bg-dark border-0" type="text"
								placeholder="Enter task" id="addtodoinput">
							<button type="button" class="btn btn-primary ms-2" id="addtodo">Add</button>
						</div>
							<div class="bg-secondary rounded" id="addtodolist">
					</div>
					</div>
				
				</div>
			</div>
		</div>
		<!-- Widgets End -->
		<script>
var shortMessage = document.getElementById("shortMessage");
var url = 'http://localhost:8080/meow/ticket/canva';
var data;
const canvas2 = document.getElementById("seats");
const ctx = document.getElementById('myChart').getContext('2d');
const ctx2 = document.getElementById('seats').getContext('2d');
var myChart = null;
var myChart2 =null;
const select = document.getElementById("movie-select");
function getTotal(){
	  // 创建一个XMLHttpRequest对象
	  var xhr = new XMLHttpRequest();

	  // 定义回调函数，用于处理响应结果
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      // 处理成功响应结果
	      var response = xhr.responseText;
	      console.log(response)
	      document.getElementById("todaysale").innerHTML='$'+response
	    } else if (xhr.readyState === 4 && xhr.status !== 200) {
	      // 处理错误响应结果
	      console.error('请求发生错误');
	    }
	  };

	  // 发送Ajax请求
	  xhr.open('GET', 'http://localhost:8080/meow/ticket/today/totalsale', true);
	  xhr.send();
	};
	
	function getSeat() {
		  // 创建一个XMLHttpRequest对象
		  var xhr = new XMLHttpRequest();

		  // 定义回调函数，用于处理响应结果
		  xhr.onreadystatechange = function() {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		      // 处理成功响应结果
		      var response = xhr.responseText;
		      console.log(response)
		      document.getElementById("todayseat").innerHTML=response
		    } else if (xhr.readyState === 4 && xhr.status !== 200) {
		      // 处理错误响应结果
		      console.error('请求发生错误');
		    }
		  };

		  // 发送Ajax请求
		  xhr.open('GET', 'http://localhost:8080/meow/ticket/today/seat', true);
		  xhr.send();
		};
		function getHot() {
			  // 创建一个XMLHttpRequest对象
			  var xhr = new XMLHttpRequest();

			  // 定义回调函数，用于处理响应结果
			  xhr.onreadystatechange = function() {
			    if (xhr.readyState === 4 && xhr.status === 200) {
			      // 处理成功响应结果
				  var response = JSON.parse(xhr.responseText);
        		  var movieName = Object.keys(response)[0];
        		  var hotness = response[movieName];
       			  document.getElementById("hot").innerHTML = movieName + ': $' + hotness;
      
			    } else if (xhr.readyState === 4 && xhr.status !== 200) {
			      // 处理错误响应结果
			      console.error('请求发生错误');
			    }
			  };

			  // 发送Ajax请求
			  xhr.open('GET', 'http://localhost:8080/meow/ticket/hottest', true);
			  xhr.send();
			};
			function getShortMessage() {
				  // 创建一个XMLHttpRequest对象
				  var xhr = new XMLHttpRequest();

				  // 定义回调函数，用于处理响应结果
				  xhr.onreadystatechange = function() {
				    if (xhr.readyState === 4 && xhr.status === 200) {
				    	var count = 0;
				    	// 处理成功响应结果
					  var jsonData = JSON.parse(xhr.responseText);
					  jsonData.sort(function(a, b) {
						    return b.id - a.id;
						});
					  jsonData.forEach(function(data) {
						  if (count >= 4) {
						        return; // 跳出循环
						    }  
						  // 创建元素
						    var outerDiv = document.createElement("div");
						    outerDiv.className = "d-flex align-items-center border-bottom py-3";

						    var innerDiv = document.createElement("div");
						    innerDiv.className = "w-100 ms-3";

						    var innerDiv2 = document.createElement("div");
						    innerDiv2.className = "d-flex w-100 justify-content-between";

						    var heading = document.createElement("h6");
						    heading.className = "mb-0";
						    heading.textContent = data.name;

						    var createdDate = parseDateString(data.createdDate);
						    var now = new Date();
						    var timeDifference = getTimeDifference(now, createdDate);

						    // 创建时间差元素
						    var timeDifferenceElement = document.createElement("small");
						    timeDifferenceElement.textContent = timeDifference;

						    // 添加时间差元素到内部元素中
						    innerDiv2.appendChild(timeDifferenceElement);
						    var span = document.createElement("span");
						    span.textContent = data.message;

						    // 组装元素
						    innerDiv2.appendChild(heading);
						    innerDiv2.appendChild(timeDifferenceElement);
						    innerDiv.appendChild(innerDiv2);
						    innerDiv.appendChild(span);
						    outerDiv.appendChild(innerDiv);

						    // 插入父元素
						    shortMessage.appendChild(outerDiv);
						    count++;
						});
	      
				    } else if (xhr.readyState === 4 && xhr.status !== 200) {
				      // 处理错误响应结果
				      console.error('请求发生错误');
				    }
				  };

				  // 发送Ajax请求
				  xhr.open('GET', 'http://localhost:8080/meow/back/shortMessage', true);
				  xhr.send();
				};
	
	function getBorderColor(context) {
	    // 这里是根据其他方法生成边线颜色的逻辑，返回一个包含 r、g、b 分量的对象
	    // 可以根据实际情况进行调整
	    var randomR = Math.floor(Math.random() * 256);
	    var randomG = Math.floor(Math.random() * 256);
	    var randomB = Math.floor(Math.random() * 256);
	    return { r: randomR, g: randomG, b: randomB };
	}
	window.onload=controller();
	function controller(){
		send();
		getSeat();
		getTotal();
		getHot();
		getShortMessage();
		send2();
	}
	function send() {
			axios.get(url)
		  	.then(response => {
		    data = response.data;
		    console.log(data)
		    labels = Object.keys(data).sort();
		    allMovies = [];
		 	if (myChart) {
		  	myChart.destroy();
			}
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
		        fill: 'start',
		        backgroundColor: getRandomColor(), // 生成随机颜色
		        borderColor: function(context) {
		          return context.dataset.backgroundColor; // 使用背景颜色作为边线颜色
		        },
		        hidden: movieData.every(val => val === 0),
		      });
		    }
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
		          reverse: false,
		          beginAtZero: false,
		          ticks: {
		            stepSize: 100,
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
	function send2() {
		  axios.get('http://localhost:8080/meow/ticket/seats')
		    .then(response => {
		      data = response.data;
		      console.log(data);
		      labels = Object.keys(data).sort();
		      
		      allMovies = [];

		      if (myChart2) {
		        myChart2.destroy();
		      }

		      labels.forEach(date => {
		        allMovies = allMovies.concat(Object.keys(data[date]));
		      });

		      allMovies = Array.from(new Set(allMovies));
		      datasets = [];

		      allMovies.forEach(movie => {
		        let movieData = labels.map(date => {
		          if (data[date][movie]) {
		            return data[date][movie];
		          } else {
		            return null;
		          }
		        });

		        datasets.push({
		          label: movie,
		          data: movieData,
		          backgroundColor: getRandomColor(),
		          borderColor: function(context) {
		            return context.dataset.backgroundColor;
		          },
		          hidden: movieData.every(val => val === null),
		        });
		      });

		      myChart2 = new Chart(ctx2, {
		        type: 'bar',
		        data: {
		          labels: labels,
		          datasets: datasets
		        },
		        options: {
		          responsive: true,
		          maintainAspectRatio: true,
		          scales: {
		            y: {
		              reverse: false,
		              beginAtZero: false,
		              ticks: {
		                  stepSize: 0.01, // 设置刻度步长为0.01
		                  min: 0,
		                  max: 1,
		                  callback: function(value) {
		                    return (value * 100).toLocaleString(undefined, { style: 'percent', minimumFractionDigits:0 });
		                  }
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
	function getRandomColor() {
		  // 生成随机的 R、G、B 分量值
		  var randomR = Math.floor(Math.random() * 256);
		  var randomG = Math.floor(Math.random() * 256);
		  var randomB = Math.floor(Math.random() * 256);
		  
		  // 将 R、G、B 分量值转换为 CSS 颜色字符串
		  var color = 'rgba(' + randomR + ', ' + randomG + ', ' + randomB + ', 0.2)';
		  
		  return color;
		}
	function getTimeDifference(date1, date2) {
	    var timeDiff = Math.abs(date1.getTime() - date2.getTime());

	    var secondsDiff = Math.floor(timeDiff / 1000);
	    var minutesDiff = Math.floor(secondsDiff / 60);
	    var hoursDiff = Math.floor(minutesDiff / 60);
	    var daysDiff = Math.floor(hoursDiff / 24);

	    if (daysDiff > 0) {
	        return daysDiff + " days ago";
	    } else if (hoursDiff > 0) {
	        return hoursDiff + " hours ago";
	    } else if (minutesDiff > 0) {
	        return minutesDiff + " minutes ago";
	    } else {
	        return secondsDiff + " seconds ago";
	    }
	}
	function parseDateString(dateString) {
		  var parts = dateString.split(" ");
		  var datePart = parts[0];
		  var timePart = parts[1];

		  var dateParts = datePart.split("-");
		  var year = parseInt(dateParts[0]);
		  var month = parseInt(dateParts[1]) - 1;
		  var day = parseInt(dateParts[2]);

		  var timeParts = timePart.split(":");
		  var hour = parseInt(timeParts[0]);
		  var minute = parseInt(timeParts[1]);
		  var second = parseInt(timeParts[2]);

		  var date = new Date(year, month, day, hour, minute, second);
		  return date;
		}
	// 获取相关元素
	var todoInput = document.getElementById("addtodoinput");
	var todoAddButton = document.getElementById("addtodo");
	var todoList = document.getElementById("addtodolist");


	// 从本地存储中获取代辦事項
	function getSavedTodos() {
	  var savedTodos = localStorage.getItem("todos");
	  return savedTodos ? JSON.parse(savedTodos) : [];
	}

	// 保存代辦事項到本地存储
	function saveTodos(todos) {
	  localStorage.setItem("todos", JSON.stringify(todos));
	}

	// 渲染代辦事項列表
	function renderTodos() {
	  var todos = getSavedTodos();

	  todoList.innerHTML = ""; // 清空代辦事項列表

	  todos.forEach(function (todo) {
	    var todoItem = document.createElement("div");
	    todoItem.classList.add("d-flex", "align-items-center", "border-bottom", "py-2");

	    var checkbox = document.createElement("input");
	    checkbox.classList.add("form-check-input", "m-0");
	    checkbox.type = "checkbox";
	    checkbox.checked = todo.completed;

	    var todoText = document.createElement("div");
	    todoText.classList.add("w-100", "ms-3");
	    todoText.textContent = todo.task;

	    var deleteButton = document.createElement("button");
	    deleteButton.classList.add("btn", "btn-sm");
	    deleteButton.innerHTML = '<i class="fa fa-times"></i>';

	    // 删除按钮的点击事件处理程序
	    deleteButton.addEventListener("click", function () {
	      removeTodo(todo.id);
	    });

	    // 复选框的变更事件处理程序
	    checkbox.addEventListener("change", function () {
  if (checkbox.checked) {
    todoText.classList.add("text-decoration-line-through-red"); // 添加删除线和红色
  } else {
    todoText.classList.remove("text-decoration-line-through-red"); // 移除删除线和红色
  }
});

	    todoText.appendChild(deleteButton);
	    todoItem.appendChild(checkbox);
	    todoItem.appendChild(todoText);
	    todoList.appendChild(todoItem);
	  });
	}

	// 添加代辦事項
	function addTodo() {
	  var task = todoInput.value;
	  if (task.trim() === "") {
	    return;
	  }

	  var todos = getSavedTodos();

	  var newTodo = {
	    id: Date.now(),
	    task: task,
	    completed: false
	  };

	  todos.push(newTodo);
	  saveTodos(todos);

	  renderTodos();

	  todoInput.value = "";
	}

	// 删除代辦事項
	function removeTodo(todoId) {
	  var todos = getSavedTodos();

	  todos = todos.filter(function (todo) {
	    return todo.id !== todoId;
	  });

	  saveTodos(todos);

	  renderTodos();
	}

	// 切换代辦事項的完成状态
	function toggleTodoCompleted(todoId) {
	  var todos = getSavedTodos();

	  todos.forEach(function (todo) {
	    if (todo.id === todoId) {
	      todo.completed = !todo.completed;
	    }
	  });

	  saveTodos(todos);

	  renderTodos();
	}

	// 监听添加按钮的点击事件
	todoAddButton.addEventListener("click", addTodo);

	// 页面加载完成时渲染代辦事項列表
	document.addEventListener("DOMContentLoaded", renderTodos);

</script>

		<jsp:include page="layout/BackFoot.jsp"></jsp:include>
	</div>
	<!-- Content End -->



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