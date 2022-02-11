<%@page import="smartbillOld.SmartbillOldListDAO"%>
<%@page import="smartbillOld.SmartbillOldList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="smartbillOld.SmartbillOldDAO"%>
<%@page import="smartbillOld.SmartbillOld"%>
<!--  자바스크립트문을 작성하기 위해 사용 -->
<%@ page import="java.io.PrintWriter"%>
<!--  모든 데이터를 utf-8로 받음 -->
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- id="빈이름", class="패키지.클래스명", scope="유효범위" page = 현재의 페이지에서만 사용 (빈 파일을 사용한다고 명시(액션테그)-->
<jsp:useBean id="smartbill" class="smartbillOld.SmartbillOld"
	scope="page" />

<!-- name="빈이름", property="필드명", value="값" //Setter 메서드를 사용하기위해 데이터의 값을 설정할때 사용-->
<jsp:setProperty name="smartbill" property="conversationId" />
<jsp:setProperty name="smartbill" property="txtSupComRegNo" />
<jsp:setProperty name="smartbill" property="txtSupComName" />
<jsp:setProperty name="smartbill" property="txtSupComRepName" />
<jsp:setProperty name="smartbill" property="txtByrComName" />
<jsp:setProperty name="smartbill" property="txtByrComRepName" />
<jsp:setProperty name="smartbill" property="txtSupComAddr" />
<jsp:setProperty name="smartbill" property="txtByrComAddr" />
<jsp:setProperty name="smartbill" property="txtSupBizType" />
<jsp:setProperty name="smartbill" property="txtSupClassify" />
<jsp:setProperty name="smartbill" property="txtByrBizType" />
<jsp:setProperty name="smartbill" property="txtByrClassify" />
<jsp:setProperty name="smartbill" property="txtSupDeptPerson" />
<jsp:setProperty name="smartbill" property="txtSupDeptTel" />
<jsp:setProperty name="smartbill" property="txtByrDeptPerson" />
<jsp:setProperty name="smartbill" property="txtByrDeptTel" />
<jsp:setProperty name="smartbill" property="txtSupDeptEmail" />
<jsp:setProperty name="smartbill" property="txtByrComRegNo" />
<jsp:setProperty name="smartbill" property="txtSupDeptName" />
<jsp:setProperty name="smartbill" property="txtByrDeptEmail" />
<jsp:setProperty name="smartbill" property="txtByrDeptName" />
<jsp:setProperty name="smartbill" property="txtBigo" />
<jsp:setProperty name="smartbill" property="txtSupAmount" />
<jsp:setProperty name="smartbill" property="txtTaxAmount" />
<jsp:setProperty name="smartbill" property="txtTotalAmount" />
<jsp:setProperty name="smartbill" property="txtSupbuy_type" />
<jsp:setProperty name="smartbill" property="txtDirection" />
<jsp:setProperty name="smartbill" property="txtBatchId" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/submenu.css">

<!--<link rel="stylesheet" href="css/bootstrap.css"> -->
<!-- 스타일시트로 css폴더의 bootstrap.css파일 사용 -->
<title>SmartBill Test</title>

</head>
<body>
	<%
	String conversationid = request.getParameter("conversationid");
			String dtistatus = request.getParameter("dtistatus");

			String userID = null;
			SmartbillOldVO SmartbillOld = new SmartbillOldDAO().arissueList(conversationid);

			if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
			}

			if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하세요')");
		script.println("location.href = '/BBS/jsp/main/login.jsp'");
		script.println("</script>");
			}
	%>


	<nav class="navbar navbar-default">
		<!-- navbar-색상(inverse = 검은색, default 22222= 색x) -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<!-- class="navbar-toggle collapsed"=>네비게이션의 화면 출력유무 
				data-toggle="collapse" : 모바일 상태에서 클릭하면서 메뉴가 나오게 설정 -->

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				<!-- 아이콘 이미지 -->

			</button>

			<a class="navbar-brand" href="main.jsp">SmartBill Test</a>
			<!-- Bootstrap navbar 기본 메뉴바 -->
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<!-- navbar-nav => 네비게이션 바의 메뉴 -->
				<!--  navbar-nav => 네비게이션 바의 메뉴 -->
				<!-- 메뉴, 게시판의 main.jsp와 bbs.jsp의 파일로 각각 이동 -->
				<li class="active"><a href="/BBS/jsp/main/main.jsp">main</a></li>
				<li><a href="/BBS/jsp/bbs/bbs.jsp">게시판</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">전자(세금)계산서 구연동<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="dropdown-submenu"><a tabindex="-1" href="#">전자(세금)계산서
								발행<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/BBS/jsp/smartbillOld/smartbillOld.jsp">정매출 발행</a></li>
								<li><a href="/BBS/jsp/smartbillOld/smartbillOldReceive.jsp">역매입 요청</a></li>
								<li><a href="/BBS/jsp/smartbillOld/smartbillOldDTT.jsp">정매출 거래명세서</a></li>
							</ul></li>
						<li><a href="/BBS/jsp/smartbillOld/smartbillOldList.jsp">전자(세금)게산서 조회</a></li>
						<li><a href="javascript:popup()">Xml 업로드</a></li>


						<li><a href="/BBS/jsp/smartbillOld/smartbillOldCert.jsp">인증서 등록</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">전자(세금)계산서 차세대<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="dropdown-submenu"><a tabindex="-1" href="#">전자(세금)계산서
								발행<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/BBS/jsp/smartbillNew/smartbillNew.jsp">정매출 발행</a></li>
								<li><a href="/BBS/jsp/smartbillNew/smartbillNewReceive.jsp">역매입 요청</a></li>
								<li><a href="/BBS/jsp/smartbillNew/smartbillNewDTT.jsp">정매출 거래명세서</a></li>
								<li><a href="/BBS/jsp/smartbillNew/smartbillNewDTT_xml.jsp">정매출 거래명세서(xml 파싱)</a></li>
							</ul></li>
						<li><a href="/BBS/jsp/smartbillNew/smartbillNewList.jsp">전자(세금)게산서 조회</a></li>
						<li><a href="/BBS/jsp/smartbillNew/smartbillNewXmlUpload.jsp">Xml 업로드</a></li>
						<li><a href="/BBS/jsp/smartbillNew/smartbillNewCert.jsp">인증서 등록</a></li>
						<li><a href="http://localhost:30000/dti/">SBMS 모니터링</a></li>

					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">전자계약<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="dropdown-submenu"><a tabindex="-1" href="#">전자게약
								발행<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/BBS/jsp/smartbillContract/smartbillContract.jsp">검토요청</a></li>
								<li><a href="/BBS/jsp/smartbillContract/smartbillOldList.jsp">계약요청</a></li>
							</ul></li>
						<li><a href="/BBS/jsp/smartbillContract/smartbillOldList.jsp">전자계약 조회</a></li>
						<li><a href="/BBS/jsp/smartbillContract/certificate.jsp">인증서 등록</a></li>
					</ul></li>


				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">OpenAPI<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="dropdown-submenu"><a tabindex="-1" href="#">OpenAPI
								발행<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/BBS/jsp/smartbillOpenApi/smartbillOAPI.jsp">정매출 발행</a></li>
								<li><a href="/BBS/jsp/smartbillOpenApi/smartbillOAPIReceive.jsp">역매입 요청</a></li>
								<li><a href="/BBS/jsp/smartbillOpenApi/smartbillOAPIDtt.jsp">정매출 거래명세서</a></li>
							</ul></li>
						<li><a href="javascript:REPO()">보관함 조회</a></li>
						<li><a href="aescrypto.jsp">인증서 패스워드 암/복호화</a></li>
					</ul></li>


			</ul>


			<%
				if (userID == null) //로그인이 되어있지 않았을때, 
				{
			%>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Login<span class="caret"></span></a> <!-- 임시의 주소링크 "#"을 기재한다. -->
					<!-- caret = creates a caret arrow icon (▼) -->

					<ul class="dropdown-menu">
						<!-- dropdown-menu : 버튼을 눌렀을때, 생성되는 메뉴(접속하기를 눌렀을때 로그인, 회원가입 메뉴 -->

						<li><a href="/BBS/jsp/main/login.jsp">Login</a></li>
						<li><a href="/BBS/jsp/main/join.jsp">Join</a></li>
					</ul></li>
			</ul>

			<%
				} else //로그인이 되었을때
				{
			%>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a> <!-- 임시의 주소링크 "#"을 기재한다. -->
					<!-- caret = creates a caret arrow icon (▼) -->

					<ul class="dropdown-menu">
						<!-- dropdown-menu : 버튼을 눌렀을때, 생성되는 메뉴(접속하기를 눌렀을때 로그인, 회원가입 메뉴 -->

						<li><a href="/BBS/jsp/main/logoutAction.jsp">Logout</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>


		</div>
	</nav>

	<div class="container">
		<div class="row">
			<form method="post" action="smartbillOldChange.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px #dddddd">
					<thead>
						<tr>
							<th colspan="22"
								style="background-color: #000000; color: white; text-align: center;">전자(세금)계산서
								상태 변경</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th colspan="6" style="text-align: center;">공급자 사업자번호<br /></th>
							<td></td>
							<td class="DTILeftText" colspan="5" style="text-align: left;"><input
								type="text" id="txtSupComRegNo" name="txtSupComRegNo"
								value=<%=SmartbillOld.getTxtSupComRegNo()%> maxlength="20"
								size="17" /></td>
							<th colspan="6" style="text-align: center;">공급받는자 사업자번호<br /></th>
							<td></td>
							<td class="DTILeftText" colspan="5" style="text-align: left;"><input
								type="text" id="txtByrComRegNo" name="txtByrComRegNo"
								value=<%=SmartbillOld.getTxtByrComRegNo()%> maxlength="20"
								size="17" /></td>
						</tr>
						<tr>
							<th colspan="3">상호<br />(법인명)
							</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtSupComName" name="txtSupComName"
								value=<%=SmartbillOld.getTxtSupComName()%> maxlength="200"
								size="17" /></td>
							<th colspan="2">성명</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtSupComRepName" name="txtSupComRepName"
								value=<%=SmartbillOld.getTxtSupComRepName()%> maxlength="100"
								size="16" /></td>
							<th colspan="3">상호<br />(법인명)
							</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtByrComName" name="txtByrComName"
								value=<%=SmartbillOld.getTxtByrComName()%> maxlength="200"
								size="16" /></td>
							<th colspan="2">성명</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtByrComRepName" name="txtByrComRepName"
								value=<%=SmartbillOld.getTxtByrComRepName()%> maxlength="100" /></td>
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
								id="txtSupBizType" name="txtSupBizType"
								value=<%=SmartbillOld.getTxtSupBizType()%> maxlength="100"
								size="17" /></td>
							<th colspan="2">종목</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtSupClassify" name="txtSupClassify"
								value=<%=SmartbillOld.getTxtSupClassify()%> maxlength="100"
								size="16" /></td>
							<th colspan="3">업태</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtByrBizType" name="txtByrBizType"
								value=<%=SmartbillOld.getTxtByrBizType()%> maxlength="100"
								size="16" /></td>
							<th colspan="2">종목</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtByrClassify" name="txtByrClassify"
								value=<%=SmartbillOld.getTxtByrClassify()%> maxlength="100"
								size="16" /></td>
						</tr>
						<tr>
							<th colspan="3">담당자</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtSupDeptPerson" name="txtSupDeptPerson"
								value=<%=SmartbillOld.getTxtSupDeptPerson()%> maxlength="100"
								size="17" /></td>
							<th colspan="2">연락처</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtSupDeptTel" name="txtSupDeptTel"
								value=<%=SmartbillOld.getTxtSupDeptTel()%> maxlength="20"
								size="16" /></td>
							<th colspan="3">담당자</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtByrDeptPerson" name="txtByrDeptPerson"
								value=<%=SmartbillOld.getTxtByrDeptPerson()%> maxlength="100"
								size="16" /></td>
							<th colspan="2">연락처</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtByrDeptTel" name="txtByrDeptTel"
								value=<%=SmartbillOld.getTxtByrDeptTel()%> maxlength="20"
								size="16" /></td>
						</tr>
						<tr>
							<th colspan="3">이메일</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtSupDeptEmail" name="txtSupDeptEmail"
								value=<%=SmartbillOld.getTxtSupDeptEmail()%> maxlength="100"
								size="17" /></td>
							<th colspan="2">부서</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtSupDeptName" name="txtSupDeptName"
								value=<%=SmartbillOld.getTxtSupDeptName()%> maxlength="100"
								size="16" /></td>
							<th colspan="3">이메일</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtByrDeptEmail" name="txtByrDeptEmail"
								value=<%=SmartbillOld.getTxtByrDeptEmail()%> maxlength="100"
								size="16" /></td>
							<th colspan="2">부서</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtByrDeptName" name="txtByrDeptName"
								value=<%=SmartbillOld.getTxtByrDeptName()%> maxlength="100"
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
								id="txtSup1Amount" name="txtSup1Amount" value="" maxlength="100"
								size="17" /></td>
							<th colspan="3">공급가액</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtSupAmount" name="txtSupAmount"
								value=<%=SmartbillOld.getTxtSupAmount()%> maxlength="100"
								size="17" /></td>
							<th colspan="2">세액</th>
							<td class="DTILeftText" colspan="2"><input type="text"
								id="txtTaxAmount" name="txtTaxAmount"
								value=<%=SmartbillOld.getTxtTaxAmount()%> maxlength="100"
								size="16" /></td>
							<th colspan="3">합계금액</th>
							<td class="DTILeftText" colspan="3"><input type="text"
								id="txtTotalAmount" name="txtTotalAmount"
								value=<%=SmartbillOld.getTxtTotalAmount()%> maxlength="100"
								size="16" /></td>
						</tr>
						<tr>
							<th colspan="3" style="text-align: right;">Batch_Id</th>
							<td class="DTILeftText" colspan="9"><input type="text"
								id="txtBatchId" name="txtBatchId"
								value=<%=SmartbillOld.getTxtBatchId()%> maxlength="100"
								size="40" /></td>

							<th colspan="3" style="text-align: right;">참조번호</th>
							<td class="DTILeftText" colspan="9"><input type="text"
								id="conversationId" name="conversationId"
								value=<%=SmartbillOld.getConversationId()%> maxlength="100"
								size="40" /></td>
						</tr>
					</tbody>
				</table>
				<%
		if("AR".equals(SmartbillOld.getTxtSupbuy_type()) && "2".equals(SmartbillOld.getTxtDirection()) && "I".equals(dtistatus)) { 		
		%>
				<input type="submit" class="btn btn-primary pull-right"
					name="statusChange" value="세금계산서발행취소">
				<%
		} else if("AP".equals(SmartbillOld.getTxtSupbuy_type()) && "2".equals(SmartbillOld.getTxtDirection()) && "I".equals(dtistatus)) {
		%>
				<input type="submit" class="btn btn-primary pull-right"
					name="statusChange" value="수신승인"> <input type="submit"
					class="btn btn-primary pull-right" name="statusChange" value="수신거부">
				<%
		}
		%>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/smartbillOld.js"></script>

</body>
</html>