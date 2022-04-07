<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

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
		<form method="post" action="http://localhost:30000/dti/api/v1/parse/" enctype="multipart/form-data">
			<table class="table table-striped"
				style="text-align: center; border: 1px #dddddd">
				<thead>
					<tr>
						<th colspan="22"
							style="background-color: #FF0000; color: white; text-align: center;">차세대 전자(세금)계산서
							Xml Upload</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="6" style="text-align: center;">매출 / 매입<br /></th>
							<td class="form-group" style="text-align: left;">
								<div class="byn-group" data-toggle="buttons">
									<input type="radio" name="supbuyType" autocomplete="off" value="AR" checked>매출
									<input type="radio" name="supbuyType" autocomplete="off" value="AP">매입
									</div>
							</td>
					</tr>
					<tr>
						<th colspan="6" style="text-align: center;">DataBase 저장 여부<br /></th>		
							<td class="form-group" style="text-align: left;">
								<div class="byn-group" data-toggle="buttons">
									<input type="radio" name="write" autocomplete="off" value="true" checked>저장
									<input type="radio" name="write" autocomplete="off" value="false">저장안함
									</div>
							</td>
					</tr>
					<tr>
						<th colspan="6" style="text-align: center;">어댑터 키(멀티 라우팅인 경우 필수)<br /></th>		
							<td class="form-group" style="text-align: left;">
								<div class="byn-group" data-toggle="buttons">
									<input type="radio" name="targetKey" autocomplete="off" value="default" checked>Default
									<input type="radio" name="targetKey" autocomplete="off" value="false">멀티
									</div>
							</td>
					</tr>
						<tr>
						<th colspan="6" style="text-align: center;">xml 원본<br /></th>
							<td>
								<input type="file" name="xml">
							</td>	
					</tr>
				<tbody>
				</tbody>


				<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄-->
			</table>
			<input type="submit" class="btn btn-primary pull-right"
				value="XML 업로드">
			<!-- <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a> -->
		</form>
	</div>
</div>

</body>
</html>
