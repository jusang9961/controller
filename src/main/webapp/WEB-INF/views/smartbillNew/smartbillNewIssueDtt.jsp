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
		<form method="post" action="smartbillNewIssueDttPost" onsubmit="return issueCheck();">
			<table class="table table-striped"
				style="text-align: center; border: 1px #dddddd">
				<thead>
					<tr>
						<th colspan="22"
							style="background-color: #FF0000; color: white; text-align: center;">차세대 전자(세금)계산서/거래명세서 역매입 요청</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="6" style="text-align: center;">공급자 사업자번호<br /></th>
						<td></td>
						<td class="DTILeftText" colspan="5" style="text-align: left;"><input
							type="text" id="txtSupComRegNo" name="txtSupComRegNo"
							value="1111111119" maxlength="20" size="17" /></td>
						<th colspan="6" style="text-align: center;">공급받는자 사업자번호<br /></th>
						<td></td>
						<td class="DTILeftText" colspan="5" style="text-align: left;"><input
							type="text" id="txtByrComRegNo" name="txtByrComRegNo"
							value="0000000029" maxlength="20" size="17" /></td>
					</tr>
					<tr>
						<th colspan="3">상호<br />(법인명)
						</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupComName" name="txtSupComName" value="공급자상호명"
							maxlength="200" size="17" /></td>
						<th colspan="2">성명</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupComRepName" name="txtSupComRepName" value="29Test"
							maxlength="100" size="16" /></td>
						<th colspan="3">상호<br />(법인명)
						</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrComName" name="txtByrComName" value="공급받는자상호명"
							maxlength="200" size="16" /></td>
						<th colspan="2">성명</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrComRepName" name="txtByrComRepName" value="119Test"
							maxlength="100" /></td>
					</tr>
					<tr>
						<th colspan="3">사업장<br />주소
						</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupComAddr" name="txtSupComAddr" value="공급자주소"
							maxlength="300" size="17" /></td>
						<th colspan="2">종사업<br>장번호
						</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupBizCode" name="txtSupBizCode" maxlength="4" size="16" /></td>

						<th colspan="3">사업장<br />주소
						</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrComAddr" name="txtByrComAddr" value="공급받는자주소"
							maxlength="300" size="16" /></td>
						<th colspan="2">종사업<br>장번호
						</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrBizCode" name="txtByrBizCode" maxlength="4" size="16" /></td>
					</tr>
					<tr>
						<th colspan="3">업태</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupBizType" name="txtSupBizType" value="공급자업태"
							maxlength="100" size="17" /></td>
						<th colspan="2">종목</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupClassify" name="txtSupClassify" value="공급자업종"
							maxlength="100" size="16" /></td>
						<th colspan="3">업태</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrBizType" name="txtByrBizType" value="공급받는자업태"
							maxlength="100" size="16" /></td>
						<th colspan="2">종목</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrClassify" name="txtByrClassify" value="공급받는자업태"
							maxlength="100" size="16" /></td>
					</tr>
					<tr>
						<th colspan="3">담당자</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupDeptPerson" name="txtSupDeptPerson" value="박주상"
							maxlength="100" size="17" /></td>
						<th colspan="2">연락처</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupDeptTel" name="txtSupDeptTel" value="1234-1234"
							maxlength="20" size="16" /></td>
						<th colspan="3">담당자</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrDeptPerson" name="txtByrDeptPerson" value="테스트"
							maxlength="100" size="16" /></td>
						<th colspan="2">연락처</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrDeptTel" name="txtByrDeptTel" value="1234-1234"
							maxlength="20" size="16" /></td>
					</tr>
					<tr>
						<th colspan="3">이메일</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupDeptEmail" name="txtSupDeptEmail" value="aaa@bbb.com"
							maxlength="100" size="17" /></td>
						<th colspan="2">부서</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupDeptName" name="txtSupDeptName" maxlength="100"
							size="16" /></td>
						<th colspan="3">이메일</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrDeptEmail" name="txtByrDeptEmail" value="aaa@bbb.com"
							maxlength="100" size="16" /></td>
						<th colspan="2">부서</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrDeptName" name="txtByrDeptName" maxlength="100"
							size="16" /></td>
					</tr>
					<tr>
						<th colspan="12"></th>
						<th colspan="3" style="text-align: right;">비고</th>
						<td class="DTILeftText" colspan="9"><input type="text"
							id="txtBigo" name="txtBigo" value="비고" maxlength="100" size="50" /></td>
					</tr>
					<tr>
						<th colspan="3">작성일자</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtDate" name="txtDate" value=""
							maxlength="100" size="17" /></td>
						<th colspan="3">공급가액</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupAmount" name="txtSupAmount" value="100" maxlength="100"
							size="17" /></td>
						<th colspan="2">세액</th>
						<td class="DTILeftText" colspan="2"><input type="text"
							id="txtTaxAmount" name="txtTaxAmount" value="10" maxlength="100"
							size="16" /></td>
						<th colspan="3">합계금액</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtTotalAmount" name="txtTotalAmount" value="110"
							maxlength="100" size="16" /></td>
					</tr>
					<tr>
						<th colspan="12"></th>
						<th colspan="3" style="text-align: right;">참조번호</th>
						<td class="DTILeftText" colspan="9"><input type="text"
							id="conversationId" name="conversationId"
							value="자동생성" maxlength="100"
							size="40" disabled/></td>
					</tr>
				</tbody>


				<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄-->
			</table>
			<input type="submit" class="btn btn-primary pull-right"
				value="세금계산서 발행">
			<!-- <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a> -->
		</form>
	</div>
</div>

</body>
</html>
