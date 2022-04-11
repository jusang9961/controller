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
        <!-- method를 get방식으로 전송시 리스트 조회 가능 -->
		<form method="port" action="http://localhost:30000/dti/api/v1/certificate/0000000029" enctype="multipart/form-data">
			<table class="table table-striped"
				style="text-align: center; border: 1px #dddddd">
				<thead>
					<tr>
						<th colspan="22"
							style="background-color: #FF0000; color: white; text-align: center;">차세대 전자(세금)계산서
							인증서 등록 / 갱신</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="6" style="text-align: center;">서명용 공개키(SignCert.der)<br /></th>
							<td>
								<input type="file" name="signCertPublic" />
							</td>
					</tr>
					<tr>
					<th colspan="6" style="text-align: center;">서명용 개인키(SignPri.key)<br /></th>		
							<td>
								<input type="file" name="signCertPrivate" />
							</td>
					</tr>
					<tr>
						<th colspan="6" style="text-align: center;">암호화용 공개키(KmCert.der)<br />(option)</th>		
							<td>
								<input type="file" name="kmCertPublic" />
							</td>
					</tr>
					<tr>
						<th colspan="6" style="text-align: center;">암호화용 개인키(KmPri.key)<br />(option)</th>
							<td>
								<input type="file" name="kmCertPrivate" />
							</td>	
					</tr>
					<tr>
						<th colspan="6" style="text-align: center;">인증서 패스워드<br /></th>
							<td style="text-align: left;">
								<input type="password" name="password" />
							</td>	
					</tr>
				<tbody>
				</tbody>

				<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄-->
			</table>
			<input type="submit" class="btn btn-primary pull-right"
				value="인증서 등록/갱신">
			<!-- <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a> -->
		</form>
	</div>
</div>
			
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>