<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="smartbillOld.SmartbillOldDAO"%>
<!--  자바스크립트문을 작성하기 위해 사용 -->
<%@ page import="java.io.PrintWriter"%>
<!--  모든 데이터를 utf-8로 받음 -->
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- get 방식 호출방법 -->
<!-- http://localhost:8080/BBS/smartbillOldListAction.jsp?conversationId=123 -->

<!-- id="빈이름", class="패키지.클래스명", scope="유효범위" page = 현재의 페이지에서만 사용 (빈 파일을 사용한다고 명시(액션테그)-->
<jsp:useBean id="smartbill" class="smartbillOld.SmartbillOld" scope="page" />
<!-- name="빈이름", property="필드명", value="값" //Setter 메서드를 사용하기위해 데이터의 값을 설정할때 사용-->
<jsp:setProperty name="smartbill" property="messageid" />
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




<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<%
		String statusChange = request.getParameter("statusChange");
		String batchid = request.getParameter("txtBatchId");
	%>
	<%=statusChange%>
	<%
		String userID = null;

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
			if (smartbill.getTxtSupComName() == null || smartbill.getTxtSupComRepName() == null
			|| smartbill.getTxtByrComName() == null || smartbill.getTxtByrComRepName() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용 기입해주시기 바랍니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		if("세금계산서발행취소".equals(statusChange)){

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'http://localhost:10001/callSB_V3/XXSB_DTI_STATUS_CHANGE.asp?BATCH_ID="+batchid+"&STATUS=O&SIGNAL=CANCELALL&ID=29test&PASS=111'");
			script.println("</script>");
		} else if("수신승인".equals(statusChange)){
					
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'http://localhost:10001/callSB_V3/XXSB_DTI_STATUS_CHANGE.asp?BATCH_ID="+batchid+"&STATUS=C&SIGNAL=APPROVE&ID=29test&PASS=111'");
			script.println("</script>");
					
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'http://localhost:10001/callSB_V3/XXSB_DTI_STATUS_CHANGE.asp?BATCH_ID="+batchid+"&STATUS=R&SIGNAL=REJECT&ID=29test&PASS=111'");
				script.println("</script>");
			}
		}

	%>


</body>
</html>