<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
<!-- <body style= "background-color : lightblue;"> -->
<body>
<%
		String userID = null;
		if(session.getAttribute("userID") != null)
		{
			userID = (String) session.getAttribute("userID");
		}
			//로그인이 된 회원은 로그인의 정보를 담을수 있도록 설정  
	%>
<!-- 
<audio controls loop controls autoplay>
	<source src="lovepratice.mp3" type="audio/mpeg" >
</audio>
	<!-- 오디오 태그, hidden => 오디오창 안보이게, loop => 무한반복, autoplay => 자동재생 
 -->
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
		<form id="fr" name="fr" method="post" action="smartbillOldDTTAction.jsp" onsubmit="return issueCheck()">
			<table class="table table-striped"
				style="text-align: center; border: 1px #dddddd">
				<thead>
					<tr>
						<th colspan="22"
							style="background-color: #000000; color: white; text-align: center;">구연동 전자(세금)계산서/거래명세서
							발행</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="6" style="text-align: center;">공급자 사업자번호<br /></th>
						<td></td>
						<td class="DTILeftText" colspan="5" style="text-align: left;"><input
							type="text" id="txtSupComRegNo" name="txtSupComRegNo"
							value="0000000029" maxlength="20" size="17" /></td>
						<th colspan="6" style="text-align: center;">공급받는자 사업자번호<br /></th>
						<td></td>
						<td class="DTILeftText" colspan="5" style="text-align: left;"><input
							type="text" id="txtByrComRegNo" name="txtByrComRegNo"
							value="1111111119" maxlength="20" size="17" /></td>
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
							id="txtSupDeptEmail" name="txtSupDeptEmail" value="jusang9961@businesson.co.kr"
							maxlength="100" size="17" /></td>
						<th colspan="2">부서</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtSupDeptName" name="txtSupDeptName" maxlength="100"
							size="16" /></td>
						<th colspan="3">이메일</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtByrDeptEmail" name="txtByrDeptEmail" value="saz511@naver.com"
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
							id="Bigo" name="Bigo" value="비고" maxlength="100" size="50" /></td>
					</tr>
					<tr>
						<th colspan="3">작성일자</th>
						<td class="DTILeftText" colspan="3"><input type="text"
							id="txtDate" name="txtDate" value=""
							maxlength="8" size="17" /></td>
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
						<th colspan="5"></th>
						<th colspan="3" style="text-align: right;">참조번호</th>
						<td class="DTILeftText" colspan="9"><input type="text"
							id="conversationId" name="conversationId"
							value="자동입력" maxlength="100"
							size="40" disabled/></td>
						<th colspan="2" style="text-align: right;">Batch_id</th>
						<td class="DTILeftText" colspan="2"><input type="text"
							id="conversationId" name="txtBatchId"
							value="자동입력" maxlength="30"
							size="20" disabled/></td>
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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/smartbillOld.js"></script>

</body>
</html>
