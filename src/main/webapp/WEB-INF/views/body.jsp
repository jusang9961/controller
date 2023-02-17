<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>


<%--<div id="page-wrapper">
	<!-- 사이드바 -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand">
				<a href="#">Smartbill Test</a>
			</li>
			<li><a href="#">게시판</a></li>
			<li><a href="#">전자(세금)계산서 구연동</a></li>
			<li><a href="#">전자(세금)계산서 차세대</a></li>
			<li><a href="#">전자계약</a></li>
			<li><a href="#">OpenAPI</a></li>
			<li><a href="#">OpenScrap</a></li>
		</ul>
	</div>--%>
<!-- <body style= "background-color : lightblue;"> -->

<%
	session.setMaxInactiveInterval(30*60);

	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	//로그인이 된 회원은 로그인의 정보를 담을수 있도록 설정
%>

<%--<audio controls loop controls autoplay>
	<source src="lovepratice.mp3" type="audio/mpeg" >
</audio>--%>
<!-- 오디오 태그, hidden => 오디오창 안보이게, loop => 무한반복, autoplay => 자동재생  -->
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

		<a class="navbar-brand" href="/">SmartBill Test</a>
		<!-- Bootstrap navbar 기본 메뉴바 -->
	</div>

	<div class="collapse navbar-collapse"
		 id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<!-- navbar-nav => 네비게이션 바의 메뉴 -->
			<!--  navbar-nav => 네비게이션 바의 메뉴 -->
			<!-- 메뉴, 게시판의 main.jsp와 bbs.jsp의 파일로 각각 이동 -->
			<li class="active"><a href="/">main</a></li>
			<li><a href="/BBS/jsp/bbs/bbs.jsp">게시판</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">전자(세금)계산서 구연동<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li class="dropdown-submenu"><a tabindex="-1" href="#" onclick="loginCheck();">전자(세금)계산서
						발행<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="/smartbillOld/smartbillOldArissue">정매출 발행</a></li>
							<li><a href="/smartbillOld/smartbillOldDtt">정매출(거래명세서 포함) 발행</a></li>
							<li><a href="/smartbillOld/smartbillOldReceive">역매입 요청</a></li>
							<li><a href="/smartbillOld/smartbillOldReceiveDtt">역매입(거래명세서 포함) 요청</a></li>
						</ul></li>
					<li><a href="/smartbillOld/smartbillOldList">전자(세금)게산서 조회</a></li>
					<li><a href="javascript:xmlPopUp()">Xml 업로드</a></li>


					<li><a href="/smartbillOld/smartbillOldCert">인증서 등록</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">전자(세금)계산서 차세대<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li class="dropdown-submenu"><a tabindex="-1" href="#">전자(세금)계산서
						발행<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="/smartbillNew/smartbillNewArissue">정매출 발행</a></li>
							<li><a href="/smartbillNew/smartbillNewArissueDtt">정매출(거래명세서 포함) 발행</a></li>
							<li><a href="/smartbillNew/smartbillNewIssue">역매입 요청</a></li>
							<li><a href="/smartbillNew/smartbillNewIssueDtt">역매입(거래명세서 포함) 요청</a></li>
							<li><a href="/BBS/jsp/smartbillNew/smartbillNewDTT_xml.jsp">정매출 거래명세서(xml 파싱)</a></li>
						</ul></li>
					<li class="dropdown-submenu"><a tabindex="-1" href="#">전자(세금)계산서
						보관함<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="/smartbillNew/smartbillNewArList">매출 보관함</a></li>
							<li><a href="/smartbillNew/smartbillNewApList">매입 보관함</a></li>
						</ul></li>
					<li><a href="/smartbillNew/smartbillNewXmlUpload">Xml 업로드</a></li>
					<li><a href="/smartbillNew/smartbillNewCert">인증서 등록</a></li>
					<li><a href="/smartbillNew/smartbillNewMonitor">SBMS 모니터링</a></li>

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
					<li class="dropdown-submenu"><a tabindex="-1" href="#">전자(세금)계산서
						발행<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="/smartbillOpenApi/smartbillOpenApiSave">정매출 저장(DTI_SAVE)</a></li>
							<li><a href="/smartbillOpenApi/smartbillOpenApiArissue">정매출 발행(ARISSUE)</a></li>
							<li><a href="/smartbillOpenApi/smartbillOpenApiReceive">역매입 요청(RARREQUEST)</a></li>
							<li><a href="/BBS/jsp/smartbillOpenApi/smartbillOAPIReceive.jsp">역매출 발행 - 기능만 구현</a></li>
							<li><a href="/smartbillOpenApi/smartbillOpenApiArissueDtt">정매출 거래명세서 발행(DETAILARISSUE)</a></li>
							<li><a href="/BBS/jsp/smartbillOpenApi/smartbillOAPIDtt.jsp">역매입 거래명세서 요청 - 미개발</a></li>
							<li><a href="/BBS/jsp/smartbillOpenApi/smartbillOAPIDtt.jsp">역매출 거래명세서 발행 - 미개발</a></li>
						</ul>
					<li><a href="javascript:chgStatus()">상태변경(CHGSTATUS) - 개발중</a></li>
					<li><a href="/smartbillOpenApi/smartbillOAPISearch.jsp">세금계산서 상태 조회(DTI_STATUS_LIST)</a></li>
					<li><a href="javascript:ArApRepo()">보관함조회(ARAP_REPO) - 기능만 구현</a></li>
					<li><a href="/smartbillOpenApi/smartbillOpenApiViewXml">원본 Xml 조회(VIEW_XML)</a></li>
					<li><a href="/smartbillOpenApi/smartbillOpenApiAescrypto">인증서 패스워드 암/복호화</a></li>
				</ul></li>

			<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">OpenScrap<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/BBS/jsp/smartbillOpenScrap/smartbillOscrapToken.jsp">인증토큰 발급(GET_TOKEN)</a></li>
					<li><a href="/BBS/jsp/smartbillOpenScrap/smartbillOscrapList.jsp">보관함 조회(OS_DTI_LIST)</a></li>
					<li><a href="/BBS/jsp/smartbillOpenScrap/smartbillOscrapXml.jsp">원본 조회(OS_DTI_XML)</a></li>
					<li><a href="javascript:preViewForm()">미리보기 양식(PREVIEW_FORM)</a></li>
				</ul>
			</li>

			<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">에스원 웹링크(테스트)<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li>
						<a tabindex="-1" href="https://www2.smartbill.co.kr/WebLink/Call/Preview/Preview.aspx?CALL_METHOD=POPUP&COM_REGNO=2088113302&IS_ARAP=AR&CONFIRM_KEY=SB208811330200071&CONVERSATION_ID=20881133022018231475220715336649104">S-ONE WebLink<span class="caret"></span></a>
					</li>
					<li>
						<a tabindex="-1" href="http://demo.smartbill.co.kr/WebLink/Call/Preview/Preview.aspx?CALL_METHOD=IFRAME&COM_REGNO=2028145975&IS_ARAP=AR&CONFIRM_KEY=SB202814597500070&CONVERSATION_ID=0000000029111111111920201103pjs0023">Demo_Test(com_regno : 202-81-45975, confirm_key : SB202814597500070)<span class="caret"></span></a>
					</li>
					<li>
						<a tabindex="-1" href="https://naver.com">네이버<span class="caret"></span></a>
					</li>
					<li>
						<a tabindex="-1" href="http://localhost:10009/CALLSB_V3/XXSB_DTI_ARISSUE.ASP?BATCH_ID=1669356338074&ID=29TEST&PASS=TEST" target="_blank">IE 테스트<span class="caret"></span></a>
					</li>


				</ul>
			</li>

			<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">한화 OpenAPI<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/smartbillOpenApi/smartbillOpenApiHanwhaArApRepo">한화_보관함조회(ARAP_REPO)</a></li>
					<li><a href="javascript:chgStatus_hanwha();">한화_상태변경</a></li>
				</ul>
			</li>


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

					<li><a href="/Login">Login</a></li>
					<li><a href="/Join">Join</a></li>
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

					<li><a href="/Logout">Logout</a></li>
				</ul></li>
		</ul>
		<%
			}
		%>


	</div>
</nav>