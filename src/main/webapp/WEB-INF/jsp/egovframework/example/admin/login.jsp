<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../adminFrame/header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Login</h3>
					</div>
					<div class="panel-body">
						<form role="form" method="post" id="loginForm">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="ID" name="id" type="text" autofocus>
								</div>
								<div class="form-group">
									<input onkeyup="enterkey();" class="form-control" placeholder="Password" name="pw" type="password" value="">
								</div>
								<button type="button" onclick="adminLogin()" class="btn btn-lg btn-success btn-block">Login</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../adminFrame/footer.jsp"></jsp:include>
	<script>
		function adminLogin() {
			var data = $("#loginForm").serialize();
			$.ajax({
				type : 'post',
				data : data,
				url : '/klottery/admin/loginProcess.do',
				success : function(data) {
					if (data.result == "success") {
						location.href = '/klottery/admin/user/userList.do';
					}
					if (data.result == "fail") {
						alert(data.msg);
					}
				}
			})
		}
		function enterkey() {
			if (window.event.keyCode == 13) {
				adminLogin();
			}
		}
	</script>
</body>
</html>