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
	<form>
			<table class="table table-striped"
				style="text-align: center; border: 1px #dddddd">
				<thead>
					<tr>
						<th colspan="22"
							style="background-color: #000000; color: white; text-align: center;">구연동 전자(세금)계산서
							인증서 등록 / 갱신</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${certList}" var="certList">
				<tr>

					<th colspan="3" style="text-align: center;">사업자번호<br /></th>
					<td colspan="2"><input type="text" style="width:100px" value=${certList.certRegno} /></td>


					<th colspan="3" style="text-align: center;">상호명<br /></th>
					<td colspan="2"><input type="text" style="width:120px" value=${certList.certComName} /></td>


					<th colspan="3" style="text-align: center;">User DN<br /></th>
					<td colspan="2"><input type="text" style="width:300px" value=${certList.userDn} /></td>

					<th colspan="3" style="text-align: center;">인증서 만료일</th>
					<td colspan="2"><input type="text" style="width:100px" value=${certList.expirationDate} /></td>

                                                                    <%--<td colspan="2"><input type="text" style="width:100px" value=<%= list.get(i).getExpiration().substring(0, 11) + list.get(i).getExpiration().substring(11, 13) + list.get(i).getExpiration().substring(14, 16)%> /></td>--%>
					<td colspan="1"><button onclick="window.open('http://localhost:10001/callSB_V3/XXSB_DTI_CERT.asp?CERT_REGNO=${certList.certRegno}&CERT_COMNAME=${certList.certComName}')">갱신</button></td>

				</tr>
				</c:forEach>

					<tr>
						<th colspan="3" style="text-align: center;">사업자번호<br /></th>
						<td colspan="2"><input type="text" id="regno" style="width:100px"/></td>
						<th colspan="3" style="text-align: center;">상호명<br /></th>
						<td colspan="2"><input type="text" id="comname" style="width:120px"/></td>
						<th colspan="3" style="text-align: center;"></th>
						<td colspan="2"><input type="text" style="width:300px; display:none;" /></td>
						<th colspan="3" style="text-align: center;"></th>
						<td colspan="2"><input type="text" style="width:100px; display:none;" /></td>
						<td colspan="1"><button id="cert_button" onclick="CertInsert();">등록</button>
					</tr>

			</table>
<%--			<input type="submit" class="btn btn-primary pull-right"
				value="인증서 등록">--%>
			</form>
	</div>
</div>
			

</body>
</html>