<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>SmartBill Test</title>
</head>
<body>

	<% 
		// session 정보제거
		session.invalidate();
	%>

	<script>
		location.href = '/BBS/jsp/main/main.jsp';
	</script>

</body>
</html>