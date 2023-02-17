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
								OpenApi 한화 역매입 요청 보관함 조회</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th colspan="6" style="text-align: center;">시작 일자<br /></th>
							<td style="text-align: left;"><input type="text" id="SearchFromDate"
								name="SearchFromDate" value="2022-11-01"/></td>
						</tr>
						<tr>
							<th colspan="6" style="text-align: center;">종료 일자<br /></th>
							<td style="text-align: left;"><input type="text" id="SearchToDate"
								name="SearchToDate" value="2022-11-11"/></td>
						</tr>
						<tr>
							<th colspan="6" style="text-align: center;">조회 사업자번호<br /></th>
							<td style="text-align: left;"><input type="text" id="SearchComRegno"
								name="SearchComRegno" value=""/></td>
						</tr>
					<tbody>
					</tbody>

					<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄-->
				</table>
				<input type="button" onclick="ArApRepo();" class="btn btn-primary pull-right"
					value="보관함 조회">
				<!-- <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a> -->
			</form>
		</div>
	</div>

</body>
</html>
