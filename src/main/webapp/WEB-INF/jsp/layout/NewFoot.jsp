<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html>
<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="contact-w3ls" id="contact">
			<div class="footer-w3lagile-inner">
				<h2>關注 <span>我們</span></h2>
				<p class="para">想收到更多活動/資訊,輸入Email訂閱我們</p>
				<div class="footer-contact">
					<form action="" method="post" id="subEmail">
						<input type="email" name="Email" placeholder="輸入信箱..." required=" ">
						<input type="submit" value="訂閱">
					</form>
					<br><br>
					<h3 class="text-center follow">Connect <span>Us</span></h3>
						<ul class="social-icons1 agileinfo">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-youtube"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						</ul>	
					
			 </div>
						
			</div>
			<div class="w3agile_footer_copy">
				    <p>MoeWie &copy; 2023.喵V影視有限公司</p>
			</div>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</div>
<script>
    $(document).ready(function() {
        $('#subEmail').submit(function(event) {
            event.preventDefault();
            var email = $('input[name="Email"]').val();
            $.ajax({
                type: 'POST',
                url: '/meow/subscribe',
                data: { email: email },
                success: function(data) {
                    console.log(data);
                    showSuccessMessage();
                    clearInput();
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        });

        function showSuccessMessage() {
            var messageBox = $('<div></div>');
            messageBox.css({
                'position': 'fixed',
                'top': '10px',
                'right': '10px',
                'padding': '10px',
                'background-color': 'green',
                'color': 'white',
                'font-size': '16px',
                'border-radius': '5px',
                'box-shadow': '0px 0px 5px rgba(0, 0, 0, 0.3)',
                'z-index': '9999'
            });
            messageBox.text('訂閱成功');
            $('body').append(messageBox);
            setTimeout(function() {
                messageBox.fadeOut(500, function() {
                    messageBox.remove();
                });
            }, 2000);
        }
        function clearInput() {
            $('input[name="Email"]').val('');
        }
    });
</script>

</body>
</html>