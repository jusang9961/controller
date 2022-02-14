<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. <br>
<a href="/board/list">게시물 목록</a><br>
<a href="/board/write">게시물 작성</a><br>
<a href="/board/modify">게시물 수정</a>
</P>

</body>
</html>
