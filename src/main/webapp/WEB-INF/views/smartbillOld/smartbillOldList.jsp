<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

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
		<form method="post" >
			<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<!-- <table class="table" style="text-align:center; border: 4px; border-style:double; border-width: thick;"> -->
			<thead>
				<tr>
					<th colspan="22"
						style="background-color: #000000; color: white; text-align: center;">구연동 전자(세금)계산서 보관함</th>
					</tr>
				<tr>
					<!--  <th style="background-color: #4CAF50; color : blue;text-align:center; font-style: italic;
							   font-size: 25px; font-weight: bold;">번호</th>-->
					<th
						style="background-color: #ebedef; text-align: center; font-weight: bold; vertical-align: middle;">참조번호</th>

					<th
						style="background-color: #ebedef; text-align: center; font-weight: bold; vertical-align: middle;">국세청 승인번호</th>

					<th
						style="background-color: #ebedef; text-align: center; font-weight: bold; vertical-align: middle;">공급자<br>사업자번호</th>

					<th
						style="background-color: #ebedef; text-align: center; font-weight: bold; vertical-align: middle;">공급받는자<br>사업자번호</th>
					<th
						style="background-color: #ebedef; text-align: center; font-weight: bold; vertical-align: middle;">작성일</th>
					<th
						style="background-color: #ebedef; text-align: center; font-weight: bold; vertical-align: middle;">문서상태</th>
					<th
						style="background-color: #ebedef; text-align: center; font-weight: bold; vertical-align: middle;">정/역</th>
					<th
						style="background-color: #ebedef; text-align: center; font-weight: bold; vertical-align: middle;">매출/매입</th>
					<th
						style="background-color: #ebedef; text-align: center; font-weight: bold; vertical-align: middle;">결과코드</th>
				</tr>
				</thead>
			<tbody>

			<c:forEach items="${list}" var="list">
				<tr>
					<td style='vertical-align: middle;'>
						<a href="/smartbillOld/smartbillOldview?conversationId=${list.conversationId}">${list.conversationId}</a>
					</td>
					<td style='vertical-align: middle;'>${list.issueId}</td>
					<td style='vertical-align: middle;'>${list.txtSupComRegNo}</td>
					<td style='vertical-align: middle;'>${list.txtByrComRegNo}</td>
					<td style='vertical-align: middle;'>${list.txtDate}</td>
					<td style='vertical-align: middle;'>${list.dtiStatus}</td>

					<c:set var="Direction" value="${list.txtDirection}" />
					<c:if test="${Direction eq '2'}">
						<td style='vertical-align: middle;'>정</td>
					</c:if>
					<c:if test="${Direction eq '1'}">
						<td style='vertical-align: middle;'>역</td>
					</c:if>
					<td style='vertical-align: middle;'>${list.txtSupbuy_type}</td>
					<td style='vertical-align: middle;'>${list.returnCode}</td>

				</tr>
			</c:forEach>

			<%--<%
				SmartbillOldListDAO smartbillOldListDAO = new SmartbillOldListDAO();
				ArrayList<SmartbillOldList> list = smartbillOldListDAO.getList(1);

				for(int i=0; i<list.size(); i++){
					
				String Supbuytype =list.get(i).getSupbuytype();
				String Direction =list.get(i).getDirection();
					
					if("AR".equals(Supbuytype))
						{
							Supbuytype = "매출";
						} else {
							Supbuytype = "매입";
						}
					
//					if(Direction.equals("1"))  이렇게 가능한데, Direction 이 null인 경우 오류.
//					if(Direction == "1")  String 에서 비교 안됨.. 
					if("1".equals(Direction))
						{
							Direction = "역발행";
						} else {
							Direction = "정발행";
						}
			%>
			

				<tr>
					<td><a href="smartbillOldview.jsp?conversationid=<%= list.get(i).getConversationid() %>&dtistatus=<%= list.get(i).getDtistatus() %>">
						<%= list.get(i).getConversationid() %></a></td>
					<!-- 번호, 제목, 작성자, 작성일 표시 -->
					&lt;%&ndash; <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
							<%= list.get(i).getBbsTitle() %></a></td> &ndash;%&gt;
					<td><%= list.get(i).getIssueid() %></td>
					<td><%= list.get(i).getSupcomregno() %></td>
					<td><%= list.get(i).getByrcomregno() %></td>
					<td><%= list.get(i).getWdate() %></td>
					<td><%= list.get(i).getDtistatus() %></td>
					<td><%= Supbuytype %></td>
					<td><%= Direction %></td>
					<td><%= list.get(i).getRetuncode() %></td>

				</tr>
			
			<%
				}
			%>--%>
			</tbody>
		</table>
				
		<%--<input type="submit" class="btn btn-primary pull-right" value="세금계산서 조회" >--%>
	 </form>
	</div>
</div>

</body>
</html>
