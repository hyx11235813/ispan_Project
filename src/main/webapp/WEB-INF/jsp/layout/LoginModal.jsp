<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!--/banner-bottom-->
<!-- 			  <div class="w3_agilits_banner_bootm"> -->
<!-- 			     <div class="w3_agilits_inner_bottom"> -->
<!-- 			            <div class="col-md-6 wthree_agile_login"> -->
<!-- 						     <ul> -->
<!-- 									<li><i class="fa fa-phone" aria-hidden="true"></i> (+000) 009 455 4088</li> -->
<!-- 									<li><a href="#" class="login"  data-toggle="modal" data-target="#myModal4">Login</a></li> -->
<!-- 									<li><a href="#" class="login reg"  data-toggle="modal" data-target="#myModal5">Register</a></li> -->

<!-- 								</ul> -->
<!-- 						</div> -->
<!-- 						 <div class="col-md-6 wthree_share_agile"> -->
									
<!-- 									<div class="single-agile-shar-buttons"> -->
<!-- 									<ul> -->
<!-- 								<li> -->
<!-- 									<div class="fb-like" data-href="" data-layout="button_count" data-action="like" data-size="small" data-show-faces="false" data-share="false"></div> -->
									
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<div class="fb-share-button" data-href="" data-layout="button_count" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="">Share</a></div> -->
<!-- 								</li> -->
								
<!-- 							</ul> -->
<!-- 								</div> -->
<!-- 						</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<!--//banner-bottom-->
		     <!-- Modal1 -->
					<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" >

							<div class="modal-dialog">
							<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4>Login</h4>
										<h4><a href="${contextRoot}/oauth2/authorization/google">Login With Google</a></h4>
										<div class="login-form">
											<form action="${contextRoot}/login" method="post">
												<jstl:if test="${param.error != null}">
													<p style="color:red;text-align:center">Invalid username or password.</p>												
												</jstl:if>
												<input type="text" name="username" placeholder="Username" id="username">
												<input type="password" name="password" placeholder="Password" id="password">
												<div class="tp">
													<input type="submit" value="LOGIN NOW">
												</div>
												<div class="forgot-grid">
												       <div class="log-check">
														<label class="checkbox testuser">User</label>
														</div>
												       <div class="log-check">
														<label class="checkbox admin">Admin</label>
														</div>
												       <div class="log-check">
														<label class="checkbox meowie">未啟用User</label>
														</div>
														<div class="forgot">
															<a id="forgotPassword" href="${contextRoot}/user/resetPassword" >Forgot Password?</a>
														</div>
														<div class="clearfix"></div>
													</div>
												
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
				<!-- //Modal1 -->
				  <!-- Modal1 -->
					<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" >

							<div class="modal-dialog">
							<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4>Register</h4>
										<div class="login-form">
											<form action="#" method="post">
											    <input type="text" name="regname" placeholder="Name" id="regname" autocomplete="off"/>
											    <span style="color:red" id="spName"></span>
											    <input type="text" name="regusername" placeholder="Username" id="regusername" autocomplete="off"/>
											    <span style="color:red" id="spUsername"></span>
											    <input type="password" name="regpassword" placeholder="Password" id="regpassword" autocomplete="off"/>
											    <span style="color:red" id="spPassword"></span>
												<input type="password" name="conformPassword" placeholder="Confirm Password" id="conformPassword" autocomplete="off"/>
												<span style="color:red" id="spConformPassword"></span>
												<input type="email" name="regemail" placeholder="E-mail" id="regemail" autocomplete="off"/>
												<span style="color:red" id="spEmail"></span>
												<div class="signin-rit">
													<span class="agree-checkbox">
													<label class="checkbox"><input type="checkbox" id="checkbox" name="checkbox">I agree to your <a class="w3layouts-t" href="#" target="_blank">Terms of Use</a> and <a class="w3layouts-t" href="#" target="_blank">Privacy Policy</a></label>
													<label class="checkbox fast-register">快速輸入用</label>
													</span>
													<span style="color:red" id="spCheckbox"></span>
												</div>
												<div class="tp">
													<input id="submitBtn" type="submit" value="REGISTER NOW">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						
	<script>
		$(function () {
			$('.testuser').click(function() {
				$('#username').val('testuser');
				$('#password').val('pAssw0rd');
			})
			
			$('.admin').click(function() {
				$('#username').val('meowieAdmin');
				$('#password').val('pAssw0rd');
			})
			
			$('.meowie').click(function() {
				$('#username').val('meowie');
				$('#password').val('pAssw0rd');
			})
			
			$('.fast-register').click(function() {
				$('#regname').val('meow')
				$('#regusername').val('meowie')
				$('#regpassword').val('pAssw0rd')
				$('#conformPassword').val('pAssw0rd')
				$('#regemail').val('meowieShow@gmail.com')
			})
			
			$('#conformPassword').blur(function () {
				let password = $('#regpassword').val();
				let checkPassword = $('#conformPassword').val();
				
				if(password === checkPassword)
					$('#spConformPassword').text('');
				else
					$('#spConformPassword').text('Password Incorrect!');
			})
			
			$('#submitBtn').click(function (event) {
				event.preventDefault();
				let name = $('#regname').val();
				let username = $('#regusername').val();
				let password = $('#regpassword').val();
				let email = $('#regemail').val();
				let dtoObject = {
					"name": name,
					"username": username,
					"password": password,
					"email": email
				}
				let dtoJsonString = JSON.stringify(dtoObject);
				if(!$('#checkbox').prop("checked")) {
					$('#spCheckbox').text('Please check out terms and privacy policy!');
				}else {
					$('#spCheckbox').text('')
					$.ajax({
						url: 'http://localhost:8080/meow/api/user/registration',
						contentType: 'application/json;charset=UTF-8',
						method: 'post',
						data: dtoJsonString,
						success: function (res) {
							alert(res.message)
							window.location.href= res.url;
						},
						error: function (err) {
							let error = err.responseJSON;
							if(error.name)
								$('#spName').text(error.name);
							else
								$('#spName').text('');
							if(error.username)
								$('#spUsername').text(error.username);
							else
								$('#spUsername').text('');
							if(error.password)
								$('#spPassword').text(error.password)
							else
								$('#spPassword').text('')
							if(error.email)
								$('#spEmail').text(error.email)
							else
								$('#spEmail').text('')
						}
					})
				}
			})
		})
	</script>
</body>
</html>