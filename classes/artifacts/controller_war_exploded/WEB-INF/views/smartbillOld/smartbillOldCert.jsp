<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="smartbillOld.SmartbillOldCertDAO" %>
<%@ page import="smartbillOld.SmartbillOldCert" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
				<%
					SmartbillOldCertDAO smartbillOldCertDAO = new SmartbillOldCertDAO();
					ArrayList<SmartbillOldCert> list = smartbillOldCertDAO.getList(1);					
					
					for(int i=0; i<list.size(); i++){
				%>
					<tr>
					
						<th colspan="3" style="text-align: center;">사업자번호<br /></th>
						<td colspan="2"><input type="text" style="width:100px" value=<%= list.get(i).getRegno() %> /></td>
						<th colspan="3" style="text-align: center;">상호명<br /></th>
						<td colspan="2"><input type="text" style="width:120px" value=<%= list.get(i).getComname() %> /></td>
						<th colspan="3" style="text-align: center;">User DN</th>
						<td colspan="2"><input type="text" style="width:300px" value=<%= list.get(i).getUserdn() %> /></td>
						<th colspan="3" style="text-align: center;">인증서 만료일</th>
						<td colspan="2"><input type="text" style="width:100px" value=<%= list.get(i).getExpiration().substring(0, 11) + list.get(i).getExpiration().substring(11, 13) + list.get(i).getExpiration().substring(14, 16)%> /></td>
						<td colspan="1"><button onclick="window.open('http://localhost:10001/callSB_V3/XXSB_DTI_CERT.asp?CERT_REGNO=<%= list.get(i).getRegno() %>&CERT_COMNAME=<%= list.get(i).getComname() %>')">갱신</button></td>

					</tr>
					<%
						} 
					%>

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

				<tbody>
				</tbody>

				<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄-->
			</table>
			<input type="submit" class="btn btn-primary pull-right"
				value="인증서 등록">
			<!-- <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a> -->
			</form>
	</div>
</div>
			
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/smartbillOld.js"></script>
	
</body>
</html>