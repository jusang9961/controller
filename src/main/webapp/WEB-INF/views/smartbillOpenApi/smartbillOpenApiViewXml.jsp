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
								OpenApi 전자(세금)계산서 Xml 조회</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th colspan="6" style="text-align: center;">참조번호(Conversation_id)<br /></th>
							<td style="text-align: left;"><input type="text" id="conversationId"
								name="conversationId" />
							<input type="button" onclick="ViewXml();" class="btn btn-primary"
								   value="XML원본 가져오기"></td>
						</tr>
						<tr>
							<th colspan="6" style="text-align: center;">Xml 내용<br /></th>
							<td style="text-align: left;"><textarea id ="viewXml" name="viewXml" style="width: 1000px; height: 736px"></textarea></td>
						</tr>
					<tbody>
					</tbody>

					<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄-->
				</table>
			</form>
		</div>
	</div>

</body>
</html>
