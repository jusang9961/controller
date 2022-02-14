<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<%@ include file="/WEB-INF/views/head.jsp" %>

</head>
<body>

		<!-- body 파일 -->
	<%@ include file="/WEB-INF/views/body.jsp" %>

<!--  Login Form -->
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<!-- 점보트론 -->
		<div class="jumbotron" style="padding-top:: 20px;">
			<!-- 로그인 정보를 숨기면서 post 정송 -->
			<form method="post">
				<h3 style="text-align: center;">login view</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>
				
				<div class="form-group">
					<input type="password" class="form-control" placeholder="패스워드" name="userPass" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="로그인">
			</form>
		</div>
	</div>
</div>

</body>
</html>