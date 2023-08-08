<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
  <meta charset="utf-8">
  <title>MoeWie後台-訂單管理</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicon -->
  <link href="${contextRoot}/images/backImg/favicon.ico" rel="icon">

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
  <link href="${contextRoot}/lib/owlcarousel/assets/owl.carousel.min.css"
        rel="stylesheet">
  <link href="${contextRoot}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
        rel="stylesheet" />

  <!-- Customized Bootstrap Stylesheet -->
  <link href="${contextRoot}/css/backCSS/bootstrap.min.css" rel="stylesheet">

  <!-- Template Stylesheet -->
  <link href="${contextRoot}/css/backCSS/style.css" rel="stylesheet">
<style>
.modal-content {
	background-color: #fefefe73;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #e0d9d9;
	width: 80%;
	color:white;
}
</style>


</head>

<body>
<div class="container-fluid position-relative d-flex p-0">
  <!-- Spinner Start -->
  <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>
  <!-- Spinner End -->


  <jsp:include page="../layout/BackNav.jsp"></jsp:include>


  <!-- Blank Start -->
  <div class="container-fluid pt-4 px-4">
    <div class="row vh-100 bg-secondary rounded justify-content-center mx-0">
      <div class="col-md-12 text-center">
        <h3>訂單列表</h3>
        <section class="section">
          <div class="row align-items-top">
            <div class="col-lg-10 mx-auto">
              <table class="table datatable">
                <thead>
                <tr>
                  <th scope="col">訂單編號</th>
                  <th scope="col">訂購方式</th>
                  <th scope="col">訂單日期</th>
                  <th scope="col">訂單狀態</th>
<%--                  <th scope="col">繳款狀態</th>--%>
                  <th scope="col">合計</th>
                  <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}">
                  <tr>
                    <td style="vertical-align:middle">${order.orderid}</td>
                    <td style="vertical-align:middle">${order.payment}</td>
                    <td style="vertical-align:middle">${order.orderdate}</td>
<%--                    <td style="vertical-align:middle">${order.ordercondition}</td>--%>
                    <td style="vertical-align:middle">${order.paymentcondition}</td>
                    <td style="vertical-align:middle">${order.totalamount}</td>
                    <td >
                      <form action="${contextRoot}/orders/editorder" class="edit-form" style="margin:auto 0px">
                        <input type="hidden" name="id" value="${order.orderid}"/>
                        <input type="submit" class="btn btn-outline-info btn-sm" value="編輯"/>
                      </form>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
              	<div id="myModal" class="modal">
				<div class="modal-dialog">
					<div class="modal-content">
						<span class="close">&times;</span>
						<h2>編輯訂單</h2>
						<form id="update-form" style="color:white;">
							<label>ID:</label> <input type="text" name="id" readonly>

							<label>payment:</label> <input type="text" name="payment"> 
							<label>orderdate:</label><input type="text" name="orderdate"> 
							<label>paymentcondition:</label><textarea name="paymentcondition"></textarea>
							<label>totalamount:</label> <input type="text" name="totalamount"> 

							<button type="submit">
								<i class="fas fa-save"></i> 更新
							</button>
						</form>
						</div>
					</div>
				</div>
              <!-- End Table with stripped rows -->
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
  <!-- Blank End -->
    <%--</jstl:forEach>--%>
    <!-- 在表格下方显示分页 -->
    <div class="row" >
        <div class="col-lg-10 mx-auto">
            <nav aria-label="Order pagination">
                <ul class="pagination d-flex justify-content-center">
                    <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                        <a class="page-link" href="?page=${currentPage - 1}" tabindex="-1" aria-disabled="${currentPage == 0}">Previous</a>
                    </li>
                    <c:forEach var="i" begin="0" end="${totalPages - 1}">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}">${i + 1}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                        <a class="page-link" href="?page=${currentPage + 1}">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

  <jsp:include page="../layout/BackFoot.jsp"></jsp:include>
</div>




<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/lib/chart/chart.min.js"></script>
<script src="${contextRoot}/lib/easing/easing.min.js"></script>
<script src="${contextRoot}/lib/waypoints/waypoints.min.js"></script>
<script src="${contextRoot}/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/moment.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="${contextRoot}/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="${contextRoot}/js/backJS/main.js"></script>
<script src="${contextRoot}/js/backJS/nav.js"></script>
		
<script>
  $(document).ready(function() {
    // Event listener for the "Edit" button
    $('.edit-form').submit(function(event) {
      event.preventDefault(); // Prevent form submission

      // Get the order ID from the hidden input field
      var orderId = $(this).find('input[name="id"]').val();

      // Make an Ajax request to fetch the order details
      $.ajax({
        url: `${contextRoot}/orders/editorder`,
        type: 'GET',
        data: { id: orderId },
        success: function(response) {
          // Populate the modal with the order details
          $('#myModal input[name="id"]').val(response.orderId);
          $('#myModal input[name="payment"]').val(response.payment);
          $('#myModal input[name="orderdate"]').val(response.orderdate);
          $('#myModal input[name="paymentcondition"]').val(response.paymentcondition);
          $('#myModal input[name="totalamount"]').val(response.totalamount);

          // Display the modal
          $('#myModal').show();
        },
        error: function() {
          console.log('Error occurred during Ajax request.');
        }
      });
    });

    // Close the modal when the close button is clicked
    $('.close').click(function() {
      $('#myModal').hide();
    });
  });
</script>
</body>

</html>