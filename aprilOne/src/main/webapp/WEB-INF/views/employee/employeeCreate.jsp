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
<title>직원 등록</title>
<link rel="stylesheet" href="<c:url value="/css/nextit-login.css"/>">
<style type="text/css">
	/* unvisited link */
	a:link {
	    color: red;
	}
	
	/* visited link */
	a:visited {
	    color: red;
	}
	
	/* mouse over link */
	a:hover {
	    color: hotpink;
	}
	
	/* selected link */
	a:active {
	    color: blue;
	}
</style>

<script type="text/javascript" defer="defer">

	function check() {
		empPhone = document.getElementById('empPhone');
		empPhone1 = document.getElementById('empPhone1');
		empPhone2 = document.getElementById('empPhone2');
		empPhone2 = document.getElementById('empPhone3');

		empRrnum = document.getElementById('empRrnum');
		empRrnum1 = document.getElementById('empRrnum1');
		empRrnum2 = document.getElementById('empRrnum2');

		empPhone.value = empPhone1.value + '-' +  empPhone2.value + '-' + empPhone3.value;
		empRrnum.value = empRrnum1.value + '-' +  empRrnum2.value;

		if (empPhone.value == null || empRrnum == null) {
			return fasle;
		} else {
			return true;
		}

	}

</script>
</head>

<body>
	<c:if test="${msgValue ne null}">
		<div class="alert alert-${msgTag}">${msgValue}</div>
	</c:if>

	<%-- <form class="" action="<c:url value='/employee/employeeCreateProc' />" method="POST"> --%>
	<form action="<c:url value='${urls.employee_createProc}' />" method="POST" onsubmit="return check()">
		<div class="loginmo-container" style="max-width: 500px;">
		<h3 style="text-align: center;">계정 만들기</h3>
			<table class="table">
				<thead></thead>
				<tbody>
					<tr>
						<th>직원 ID</th>
						<td><input type="text" name="empId" maxlength="12" placeholder="Id" required autofocus></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="empPwd" class="" placeholder="Password" required value="1111"></td>
					</tr>
					<tr>
						<th>직원 이름</th>
						<td><input type="text" name="empName" class="" placeholder="Name" required value="박테스트"></td>
					</tr>
					<tr>
						<th>직원 전화번호</th> <!-- empPhone -->
						<td>
							<select id="empPhone1">
								<option value='010'>010</option>
								<option value='011'>011</option>
								<option value='017'>017</option>
								<option value='018'>018</option>
								<option value='019'>019</option>
							</select>
							-
							<input id="empPhone2" maxlength="4" size="4" placeholder="가운데자리" required value="1111">
							-
							<input id="empPhone3" maxlength="4" size="4" placeholder="끝자리" required value="2222">
	
							<input type="hidden" id="empPhone" name="empPhone" value="">
						</td>
					</tr>
					<tr>
						<th>직원 주민번호</th> <!-- empRnrnum -->
						<td>
							<input id="empRrnum1" name="empRrnum1" maxlength="6" size="6" placeholder="주민번호 앞" required value="900909">
							-
							<input id="empRrnum2" name="empRrnum2" maxlength="7" size="7" placeholder="주민번호 뒤" required value="1231234">
	
							<input type="hidden" id="empRrnum" name="empRrnum" value="">
						</td>
					</tr>
					<tr>
						<th>직원 주소</th>
						<td><input type="text" name="empAddress" class="" placeholder="Address" required value="대전광역시 중구"></td>
					</tr>
					<tr>
						<th>직책</th>
						<td>
							<div id='type'>
					    	    의사 <input type='radio' id='radio_1' name='empDiv' value='D' />
					    	    간호사 <input type='radio' id='radio_2' name='empDiv' value='N' />
					    	    미분류 <input type='radio' id='radio_3' name='empDiv' value='Z' checked="checked" />
				    		</div>
						</td>
					</tr>
					<!-- 
					<tr>
						<td colspan="2">
							<button class="btn btn-lg btn-primary btn-block" type="submit">직원등록</button>
						</td>
					</tr>
					-->
				</tbody>
			</table>

			<input type="submit" class="login loginmo-submit" value="Create ID">

			<div>계정 만들기를, <a href="<c:url value='${urls.session_login}' />">취소</a></div>
		</div>
	</form>	

</body>
</html>






