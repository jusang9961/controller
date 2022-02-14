<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
	<!-- head 파일 -->
	<%@ include file="/WEB-INF/views/head.jsp" %>
</head>

<body>
	<!-- body 파일 -->
	<%@ include file="/WEB-INF/views/body.jsp" %>
	
<script>
	
	var message = "${msg}";
	//var url = "${url}";
	
	if(message !== null && message !== ''){
		alert(message);	
	}
		//location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';
</script>

</body>
</html>
