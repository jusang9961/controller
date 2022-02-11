<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="smartbillOld.SmartbillOldDTTDAO"%>
<%@ page import="java.util.Date" %>
<!--  자바스크립트문을 작성하기 위해 사용 -->
<%@ page import="java.io.PrintWriter"%>
<!--  모든 데이터를 utf-8로 받음 -->
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- get 방식 호출방법 -->
<!-- http://localhost:8080/BBS/smartbillOldListAction.jsp?conversationId=123 -->

<!-- id="빈이름", class="패키지.클래스명", scope="유효범위" page = 현재의 페이지에서만 사용 (빈 파일을 사용한다고 명시(액션테그)-->
<jsp:useBean id="smartbill" class="smartbillOld.SmartbillOldDTT" scope="page" />
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
<jsp:setProperty name="smartbill" property="txtBatchId" />
<jsp:setProperty name="smartbill" property="txtDate" />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<%
	SmartbillOldDTTDAO SmartbillOldDTTDAO = new SmartbillOldDTTDAO();

		String userID = null;
		
		//conversation_ID 랜덤값 생성
		StringBuffer ConId = SmartbillOldDTTDAO.Conid();
		String Conversation_id = smartbill.getTxtSupComRegNo() + smartbill.getTxtByrComRegNo() + smartbill.getTxtDate() + ConId + "003";
		
		// batch_id 생성
		//Date now = new Date();
		//SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
		Long Batchid = new Date().getTime();
		
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}

		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인하세요')");
			script.println("location.href = '/BBS/jsp/main/login.jsp'");
			script.println("</script>");
		} else {
			if(smartbill.getTxtSupComName() == null || smartbill.getTxtSupComRepName() == null || smartbill.getTxtByrComName() == null || smartbill.getTxtByrComRepName() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용 기입해주시기 바랍니다.')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		int result = SmartbillOldDTTDAO.arissue(Conversation_id, smartbill.getTxtSupComRegNo(), smartbill.getTxtSupComRepName(), smartbill.getTxtSupComName(), smartbill.getTxtSupBizType(), smartbill.getTxtSupClassify(), smartbill.getTxtSupComAddr(), smartbill.getTxtSupDeptName(), smartbill.getTxtSupDeptPerson(), smartbill.getTxtSupDeptTel(), smartbill.getTxtSupDeptEmail(), smartbill.getTxtByrComRegNo(), smartbill.getTxtByrComRepName(), smartbill.getTxtByrComName(), smartbill.getTxtByrBizType(), smartbill.getTxtByrClassify(), smartbill.getTxtByrComAddr(), smartbill.getTxtByrDeptName(), smartbill.getTxtByrDeptPerson(), smartbill.getTxtByrDeptTel(), smartbill.getTxtByrDeptEmail(), smartbill.getTxtBigo(), smartbill.getTxtSupAmount(), smartbill.getTxtTaxAmount(), smartbill.getTxtTotalAmount(), Batchid);
		int result1 = SmartbillOldDTTDAO.arissueItem(Conversation_id, smartbill.getTxtSupAmount(), smartbill.getTxtTaxAmount());
		int result2 = SmartbillOldDTTDAO.arissueStatus(Conversation_id);
		int result3 = SmartbillOldDTTDAO.arissueItemDtt(Conversation_id, smartbill.getTxtSupAmount(), smartbill.getTxtTaxAmount());
		//int result4 = SmartbillOldDTTDAO.arissueItemDtt2(Conversation_id, smartbill.getTxtSupAmount(), smartbill.getTxtTaxAmount());
		if(result == -1 || result1 == -1 || result2 == -1 || result3 == -1){
			    //if(result1 == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('세금계산서 발행 실패')");
		script.println("history.back()");
		script.println("</script>");
 			} else {
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("location.href = 'http://localhost:10001/callSB_V3/XXSB_DTI_ARISSUE_T.asp?BATCH_ID="+Batchid+"&ID=29test&PASS=111'");
  		script.println("</script>");
  			}
			
		}
	}
	%>


</body>
</html>