<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#floating-text {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: rgba(0, 0, 0, 0.5);
  color: #fff;
  padding: 20px;
  border-radius: 5px;
}

</style>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>
<body>
	<section id="footer" class="wrapper">
		<div class="title">聯絡我們</div>
		<div class="container">
			<header class="style1">
				<h2>Ipsum sapien elementum portitor?</h2>
				<p>Sed turpis tortor, tincidunt sed ornare in metus porttitor
					mollis nunc in aliquet. Nam pharetra laoreet imperdiet volutpat
					etiam feugiat.</p>
			</header>
			<div class="row">
				<div class="col-6 col-12-medium">
					<!-- Contact Form -->
					<section>
						<form:form method="post" action="${contextRoot}/sendEmail" modelAttribute="email">
							<div class="row gtr-50">
								<div class="col-6 col-12-small">
									<input type="text" name="name" id="contact-name"
										placeholder="Name" required />
								</div>
								<div class="col-6 col-12-small">
									<input type="email" name="email" id="contact-email"
										placeholder="Email" required />
								</div>
								<div class="col-12">
									<textarea name="message" id="contact-message"
										placeholder="Message" rows="4" required></textarea>
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><input type="submit" class="style1" value="Send" /></li>
										<li><input type="reset" class="style2" value="Reset" /></li>
									</ul>
								</div>
							</div>
						</form:form>
					</section>
				</div>
				<div class="col-6 col-12-medium">

					<!-- Contact -->
					<section class="feature-list small">
						<div class="row">
							<div class="col-6 col-12-small">
								<section>
									<h3 class="icon solid fa-home">Mailing Address</h3>
									<p>
										Untitled Corp<br /> 1234 Somewhere Rd<br /> Nashville, TN
										00000
									</p>
								</section>
							</div>
							<div class="col-6 col-12-small">
								<section>
									<h3 class="icon solid fa-comment">Social</h3>
									<p>
										<a href="#">@untitled-corp</a><br /> <a href="#">linkedin.com/untitled</a><br />
										<a href="#">facebook.com/untitled</a>
									</p>
								</section>
							</div>
							<div class="col-6 col-12-small">
								<section>
									<h3 class="icon solid fa-envelope">Email</h3>
									<p>
										<a href="#">info@untitled.tld</a>
									</p>
								</section>
							</div>
							<div class="col-6 col-12-small">
								<section>
									<h3 class="icon solid fa-phone">Phone</h3>
									<p>(000) 555-0000</p>
								</section>
							</div>
						</div>
					</section>

				</div>
			</div>
			<div id="copyright">
				<ul>
					<li>&copy; Untitled.</li>
					<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>
		</div>
	</section>
<div id="floating-text" style="display: none;">您的意見已發送成功！</div>

<script>
const form = document.querySelector('form');
form.addEventListener('submit', (event) => {
  event.preventDefault();

  // 發送Ajax請求
  fetch('${contextRoot}/sendEmail', {
    method: 'POST',
    body: new FormData(form)
  })
  .then(response => {
    if (response.ok) {
      // 設定 3 秒後浮出文字消失
      const floatingText = document.querySelector('#floating-text');
      floatingText.style.display = 'block';
      setTimeout(() => {
        floatingText.style.display = 'none';
      }, 2000);
    }
  })
  .catch(error => {
    console.error(error);
  });
});


</script>

</body>
</html>