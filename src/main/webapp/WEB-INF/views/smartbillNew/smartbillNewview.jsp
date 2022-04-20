<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>

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
		<form method="post" action="smartbillNewChange">
			<table class="table table-striped"
				   style="text-align: center; border: 1px #dddddd">
				<thead>
				<tr>
					<th colspan="22"
						style="background-color: #FF0000; color: white; text-align: center;">차세대 전자(세금)계산서
						상태 변경
					</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<th colspan="6" style="text-align: center;">공급자 사업자번호<br/></th>
					<td></td>
					<td class="DTILeftText" colspan="5" style="text-align: left;">
						<input type="text" id="txtSupComRegNo" name="txtSupComRegNo" value="${view.get(0).txtSupComRegNo}" maxlength="20" size="17"/></td>
					<th colspan="6" style="text-align: center;">공급받는자 사업자번호<br/></th>
					<td></td>
					<td class="DTILeftText" colspan="5" style="text-align: left;"><input type="text" id="txtByrComRegNo" name="txtByrComRegNo" value="${view.get(0).txtByrComRegNo}" maxlength="20" size="17"/></td>
				</tr>
				<tr>
					<th colspan="3">상호<br/>(법인명)
					</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtSupComName" name="txtSupComName" value="${view.get(0).txtSupComName}" maxlength="200" size="17"/></td>
					<th colspan="2">성명</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtSupComRepName" name="txtSupComRepName" value="${view.get(0).txtSupComRepName}" maxlength="100" size="16"/></td>
					<th colspan="3">상호<br/>(법인명)
					</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtByrComName" name="txtByrComName" value="${view.get(0).txtByrComName}" maxlength="200" size="16"/></td>
					<th colspan="2">성명</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtByrComRepName" name="txtByrComRepName" value="${view.get(0).txtByrComRepName}" maxlength="100"/></td>
				</tr>
				<tr>
					<th colspan="3">사업장<br/>주소</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtSupComAddr" name="txtSupComAddr" value="공급자주소" maxlength="300" size="17"/></td>
					<th colspan="2">종사업<br>장번호</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtSupBizCode" name="txtSupBizCode" maxlength="4" size="16"/></td>
					<th colspan="3">사업장<br/>주소</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtByrComAddr" name="txtByrComAddr" value="공급받는자주소" maxlength="300" size="16"/></td>
					<th colspan="2">종사업<br>장번호</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtByrBizCode" name="txtByrBizCode" maxlength="4" size="16"/></td>
				</tr>
				<tr>
					<th colspan="3">업태</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtSupBizType" name="txtSupBizType" value="${view.get(0).txtSupBizType}" maxlength="100" size="17"/></td>
					<th colspan="2">종목</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtSupClassify" name="txtSupClassify" value="${view.get(0).txtSupClassify}" maxlength="100" size="16"/></td>
					<th colspan="3">업태</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtByrBizType" name="txtByrBizType" value="${view.get(0).txtByrBizType}" maxlength="100" size="16"/></td>
					<th colspan="2">종목</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtByrClassify" name="txtByrClassify" value="${view.get(0).txtByrClassify}" maxlength="100" size="16"/></td>
				</tr>
				<tr>
					<th colspan="3">담당자</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtSupDeptPerson" name="txtSupDeptPerson" value="${view.get(0).txtSupDeptPerson}" maxlength="100" size="17"/></td>
					<th colspan="2">연락처</th>
					<td class="DTILeftText" colspan="3"><input type="text"id="txtSupDeptTel" name="txtSupDeptTel" value="${view.get(0).txtSupDeptTel}" maxlength="20" size="16"/></td>
					<th colspan="3">담당자</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtByrDeptPerson" name="txtByrDeptPerson" value="${view.get(0).txtByrDeptPerson}" maxlength="100" size="16"/></td>
					<th colspan="2">연락처</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtByrDeptTel" name="txtByrDeptTel" value="${view.get(0).txtByrDeptTel}" maxlength="20" size="16"/></td>
				</tr>
				<tr>
					<th colspan="3">이메일</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtSupDeptEmail" name="txtSupDeptEmail" value="${view.get(0).txtSupDeptEmail}" maxlength="100" size="17"/></td>
					<th colspan="2">부서</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtSupDeptName" name="txtSupDeptName" value="${view.get(0).txtSupDeptName}" maxlength="100" size="16"/></td>
					<th colspan="3">이메일</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtByrDeptEmail" name="txtByrDeptEmail" value="${view.get(0).txtByrDeptEmail}" maxlength="100" size="16"/></td>
					<th colspan="2">부서</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtByrDeptName" name="txtByrDeptName" value="${view.get(0).txtByrDeptName}" maxlength="100" size="16"/></td>
				</tr>
				<tr>
					<th colspan="12"></th>
					<th colspan="3" style="text-align: right;">비고</th>
					<td class="DTILeftText" colspan="9"><input type="text" id="txtBigo" name="txtBigo" value="${view.get(0).txtBigo}" maxlength="100" size="50"/></td>
				</tr>
				<tr>
					<th colspan="3">작성일자</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtDate" name="txtDate" value="${view.get(0).txtDate}" maxlength="100" size="17"/></td>
					<th colspan="3">공급가액</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtSupAmount" name="txtSupAmount" value="${view.get(0).txtSupAmount}" maxlength="100" size="17"/></td>
					<th colspan="2">세액</th>
					<td class="DTILeftText" colspan="2"><input type="text" id="txtTaxAmount" name="txtTaxAmount" value="${view.get(0).txtTaxAmount}" maxlength="100" size="16"/></td>
					<th colspan="3">합계금액</th>
					<td class="DTILeftText" colspan="3"><input type="text" id="txtTotalAmount" name="txtTotalAmount" value="${view.get(0).txtTotalAmount}" maxlength="100" size="16"/></td>
				</tr>
				<tr>
					<th colspan="3" style="text-align: right;">messageid</th>
					<td class="DTILeftText" colspan="9"><input type="text" id="messageid" name="messageid" value="${view.get(0).messageid}" maxlength="100" size="40"/></td>

					<th colspan="3" style="text-align: right;">참조번호</th>
					<td class="DTILeftText" colspan="9"><input type="text" id="conversationId" name="conversationId" value="${view.get(0).conversationId}" maxlength="100" size="40"/></td>
				</tr>
				</tbody>
			</table>

			<c:set var="viewStatus" value="${viewStatus}" />
			<c:set var="view" value="${view}" />

			<c:if test="${view.get(0).txtSupbuy_type eq 'AR' && view.get(0).txtDirection eq '2' && viewStatus.get(0).dtiStatus eq 'I'}">
				<input type="submit" class="btn btn-primary pull-right" name="statusChange" value="세금계산서발행취소">
			</c:if>
			<c:if test="${view.get(0).txtSupbuy_type eq 'AP' && view.get(0).txtDirection eq '2' && viewStatus.get(0).dtiStatus eq 'I'}">
				<input type="submit" class="btn btn-primary pull-right" name="statusChange" value="수신승인">
				<td></td>
				<input type="submit" class="btn btn-primary pull-right" name="statusChange" value="수신거부">
			</c:if>
			<c:if test="${view.get(0).txtSupbuy_type eq 'AP' && view.get(0).txtDirection eq '1' && viewStatus.get(0).dtiStatus eq 'V'}">
				<input type="submit" class="btn btn-primary pull-right" name="statusChange" value="역매입요청취소">
			</c:if>
			<c:if test="${view.get(0).txtSupbuy_type eq 'AP' && view.get(0).txtDirection eq '1' && viewStatus.get(0).dtiStatus eq 'I'}">
				<input type="submit" class="btn btn-primary pull-right" name="statusChange" value="수신승인">
			</c:if>
			<c:if test="${view.get(0).txtSupbuy_type eq 'AR' && view.get(0).txtDirection eq '1' && viewStatus.get(0).dtiStatus eq 'V'}">
				<input type="submit" class="btn btn-primary pull-right" name="statusChange" value="역매출발행">
				<td></td>
				<input type="submit" class="btn btn-primary pull-right" name="statusChange" value="역매출수신거부">
			</c:if>
			<c:if test="${view.get(0).txtSupbuy_type eq 'AR' && view.get(0).txtDirection eq '1' && viewStatus.get(0).dtiStatus eq 'I'}">
				<input type="submit" class="btn btn-primary pull-right" name="statusChange" value="역매출발행취소">
				<td></td>
				<input type="submit" class="btn btn-primary pull-right" name="statusChange" value="역매출수신승인">
			</c:if>

			<%-- <c:choose>
                       <c:when test="${txtSupbuy_type eq 'AR' && txtDirection eq '2' && dtistatus eq 'I'}">
                            <input type="submit" class="btn btn-primary pull-right" name="statusChange" value="세금계산서발행취소">
                        </c:when>
                        <c:otherwise>
                            <input type="submit" class="btn btn-primary pull-right" name="statusChange" value="수신승인"> <input type="submit" class="btn btn-primary pull-right" name="statusChange" value="수신거부">
                        </c:otherwise>
                    </c:choose>--%>
		</form>
	</div>
</div>

<script>
    $('input').prop('readonly', true);
</script>

</body>
</html>
