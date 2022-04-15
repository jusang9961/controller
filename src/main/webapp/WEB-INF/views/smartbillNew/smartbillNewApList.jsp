<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
						style="background-color: #FF0000; color: white; text-align: center;">차세대 전자(세금)계산서 매입 보관함</th>
					</tr>
				<tr>
					<th style="background-color: #ebedef; text-align: center; font-weight: bold; vertical-align: middle;">
					</th>
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
						<input type="checkbox" name="CheckBox">
					</td>
					<td style='vertical-align: middle;'>
						<a href="/smartbillNew/smartbillNewview?conversationId=${list.conversationId}&supbuytype=${txtSupbuy_type}">${list.conversationId}</a>
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

			</tbody>
		</table>

			<button type="button" class="btn btn-primary pull-right" id="selectBtn">세금계산서 보기</button>
			<button type="button" class="btn btn-primary pull-right" id="ajaxTest">ajaxTest</button>
		</form>
		<!--
		<button class="btn btn-primary pull-right" onclick="location.href='http://192.168.100.118:30000/dti/api/v1/view/stype=AR'">세금계산서 보기</button>
        -->
	</div>
</div>
<script src="/js/smartbillNew.js"></script>
<script>
    $("#selectBtn").click(function(){

        var rowData = new Array();
        var tdArr = new Array();
        var checkbox = $("input[name=CheckBox]:checked");
        var conversationId;

// 체크된 체크박스 값을 가져온다
        checkbox.each(function(i) {

// checkbox.parent() : checkbox의 부모는 <td>이다.
            // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
            var tr = checkbox.parent().parent().eq(i);
            var td = tr.children();

            // 체크된 row의 모든 값을 배열에 담는다.
            rowData.push(td.text());

            // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
            //var conversationId = td.eq(1).text()
            conversationId = td.children("A")[0].text

            // 가져온 값을 배열에 담는다.
            tdArr.push(conversationId);

        });

        console.log("conversationId : " + conversationId);
        console.log("tdArr 배열 : "+ tdArr);

        //location.href = "http://192.168.100.118:30000/dti/api/v1/view/" + tdArr + "?stype=AR";
        window.open("http://192.168.100.118:30000/dti/api/v1/view/" + tdArr + "?stype=AP");

    });
</script>

</body>
</html>
