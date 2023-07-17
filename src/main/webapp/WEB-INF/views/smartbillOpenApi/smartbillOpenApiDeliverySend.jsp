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
			<form method="post" action="/smartbillOpenApi/smartbillOpenApiDeliverySendAction" enctype="multipart/form-data">
				<table class="table table-striped"
					style="text-align: center; border: 1px #dddddd">
					<thead>
						<tr>
							<th colspan="22"
								style="background-color: #00CC00; color: white; text-align: center;">
								OpenApi 전자세금계산서 첨부파일 전송</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th colspan="6" style="text-align: center;">참조번호(Conversation_id)<br /></th>
							<td style="text-align: left;"><input type="text" id="conversationId"
								name="conversationId" /></td>
						</tr>
						<tr>
							<th colspan="6" style="text-align: center;">첨부파일 선택<br /></th>
							<td>
								<input type="file" id="DeliveryFile" name="DeliveryFile" />
							</td>
						</tr>
					</tbody>
				</table>

				<input type="submit"  class="btn btn-primary pull-right"  value="전자세금계산서 첨부파일 전송">

			</form>
		</div>
	</div>

</body>
</html>
