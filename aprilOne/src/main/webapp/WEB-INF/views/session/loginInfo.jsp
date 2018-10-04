<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>접속자 정보</title>

<style type="text/css">
	body {
		background-image: url("<c:url value='/images/slide1.jpg' />");
	}
</style>


<script type="text/javascript" defer="defer">

	// ;===== jQuery AJAX ========
	$(document).ready(function() {
		$("#showInfo").on("click", function(evt) {
			//alert("@@@ Btn Click!!!");

			evt.preventDefault();
			
			$.ajax({
				url				: '/aprilOne/session/showDateInfoProc', // URL체크 해야합다
				method			: "POST",
				dataType		: 'json',
				data			: $('#sendDataForm').serialize(),
				success			: function(data, status, xhr) {
					//alert("###ajax success: " + JSON.stringify(data.result));
					
					fn_showPrevLogDate(data);
					
				},
				error			: function(jqXhr, textStatus, errorMessage) {
					alert("@@@ ajax error");
					console.log(jqXhr);
					console.log(textStatus);
					console.log(errorMessage);
				}
			});
		});
	});
    // ;=================================

    // ;=== User function ===============
	var nodeTable = null;
	var nodeThead = null;
	var nodeTbody = null;
	var nodeTr = null;
	var nodeTh = null;
	var nodeTd = null;
	
	function fn_showPrevLogDate(data) {
		var showDiv = document.querySelector("#showDiv");					

		$("#showDiv").empty();

		// !!table 생성
		nodeTable = document.createElement("table");
		nodeTable.setAttribute("class", "table-bordered table-condensed")

		// !!thead, tbody 생성
		nodeThead = document.createElement("thead");
		nodeTbody = document.createElement("tbody");
		
		// !!thead 부분
		nodeTr = document.createElement("tr");

		nodeTh = document.createElement("th");
		nodeTh.innerHTML = "로그인 시간";
		nodeTr.appendChild(nodeTh);

		nodeTh = document.createElement("th");
		nodeTh.innerHTML = "로그아웃 시간";
		nodeTr.appendChild(nodeTh);

		nodeThead.appendChild(nodeTr);
		nodeTable.appendChild(nodeThead);
		
		// !!tbody 부분 (여러 레코드들)
		for(e of data.result) {
			nodeTr = document.createElement("tr");

			nodeTd = document.createElement("td");
			nodeTd.innerHTML = e.logLogindate;
			nodeTr.appendChild(nodeTd);

			nodeTd = document.createElement("td");
			nodeTd.innerHTML = e.logLogoutdate;
			nodeTr.appendChild(nodeTd);

			nodeTbody.appendChild(nodeTr);
			nodeTable.appendChild(nodeTbody);
		} 

		// !!최종 'showDiv'에 append
		showDiv.appendChild(nodeTable);
		
	}
    // ;=================================
</script>
</head>

<body>
	<div style="background-color : #ffffff; padding: 30px">
	<table class="table table-bordered">
		<tr style="background-color : gray;">
			<th>접속자 직원 이름</th>
			<th>접속자 직원 아이디</th>
			<th>접속자 직원 직책</th>
		</tr>
		<tr>
			<td>${loginInfo.empName}</td>
			<td>${loginInfo.empId}</td>
			<td>${loginInfo.empDivname} (${loginInfo.empDiv})</td>
		</tr>
	</table>
	
	<form id="sendDataForm">
		<input type="hidden" name="empId" value="${loginInfo.empId}">
		<strong>"${loginInfo.empName}" 님 이전 접속정보</strong>
		<button type="submit" id="showInfo" href="#" class="btn btn-info btn-xs">상세보기</button>
	</form>
	
	<div id="showDiv"></div>
	</div>

</body>
</html>
