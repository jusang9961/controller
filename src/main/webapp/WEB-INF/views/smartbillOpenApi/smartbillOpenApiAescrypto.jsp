<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
	<!-- head 파일 -->
	<%@ include file="/WEB-INF/views/head.jsp" %>
</head>

<!-- <body style= "background-color : lightblue;"> -->
<body>
<!-- body 파일 -->
<%@ include file="/WEB-INF/views/body.jsp" %>

	<div class="container">
		<div class="row">
			<form method="post" action="aescryptoAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px #dddddd">
					<thead>
						<tr>
							<th colspan="22"
								style="background-color: #00CC00; color: white; text-align: center;">
								OpenApi 인증서 패스워드 암/복호화</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th colspan="6" style="text-align: center;">인증서 패스워드<br /></th>
							<td style="text-align: left;"><input type="text" id="txtPassword"
								name="txtPassword" /></td>
						</tr>
						<tr>
							<th colspan="6" style="text-align: center;">암호화 데이터<br /></th>
							<td style="text-align: left;"><input type="text" id="Encrypt"
								name="Encrypt" /></td>
						</tr>
						<tr>
							<th colspan="6" style="text-align: center;">복호화 데이터<br /></th>
							<td style="text-align: left;"><input type="text"
								name="Decrypt" /></td>
						</tr>
					<tbody>
					</tbody>

					<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄-->
				</table>
				<input type="button" onclick="TEST();" class="btn btn-primary pull-right"
					value="인증서 비밀번호 암/복호화">
				<!-- <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a> -->
			</form>
		</div>
	</div>

</body>
</html>
