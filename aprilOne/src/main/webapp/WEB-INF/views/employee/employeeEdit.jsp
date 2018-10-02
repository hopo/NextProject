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
<title>직원 수정하기</title>
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
			return false;
		} else {
			return true;
		}

	}

</script>
</head>

<body>
	<form class="form-horizontal" action="<c:url value='${urls.employee_editProc}' />" onsubmit="return check()" method="POST">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>	<!-- empId -->
					<td><input type="hidden" name="empId" value="${item.empId}">${item.empId}</td>
				</tr>
				<tr>
					<th>패스워드</th>	<!-- empId -->
					<td><input type="password" name="empPwd" value="${item.empPwd}"></td>
				</tr>
				<tr>
					<th>이름</th>	<!-- empName -->
					<td><input name="empName" value="${item.empName}"></td>
				</tr>
				<tr>
					<th>전화번호</th>	<!-- empPhone -->
					<td>
						<select id="empPhone1">
							<option value='010' ${phone[0] eq '010' ? 'selected' : ''}>010</option>
							<option value='011' ${phone[0] eq '011' ? 'selected': ''}>011</option>
							<option value='017' ${phone[0] eq '017' ? 'selected' : ''}>017</option>
							<option value='018' ${phone[0] eq '018' ? 'selected' : ''}>018</option>
							<option value='019' ${phone[0] eq '019' ? 'selected' : ''}>019</option>
						</select>
						-
						<input type="text" id="empPhone2" maxlength="4" placeholder="가운데자리" required value="${phone[1]}">
						-
						<input type="text" id="empPhone3" maxlength="4" placeholder="끝자리" required value="${phone[2]}">

						<input type="hidden" id="empPhone" name="empPhone" value="">
					</td>
				</tr>
				<tr>
					<th>직원 주민번호</th>
					<td>
						<input type="text" id="empRrnum1" name="empRrnum1" maxlength="6" placeholder="주민번호 앞" required value="${rrnum[0]}">
						-
						<input type="text" id="empRrnum2" name="empRrnum2" maxlength="7" placeholder="주민번호 뒤" required value="${rrnum[1]}">

						<input type="hidden" id="empRrnum" name="empRrnum" value="">
					</td>

				</tr>
				<tr>
					<th>주소</th>	<!-- empAddress -->
					<td><input name="empAddress" value="${item.empAddress}"></td>
				</tr>
				<tr>
					<th>직책</th>	<!-- empDiv -->
					<td>
						<div id='empDiv_radio'>
				    	    의사 <input type='radio' id='radio_1' name='empDiv' value='D' ${(item.empDiv eq 'D')? 'checked' : ''} />
				    	    간호사 <input type='radio' id='radio_2' name='empDiv' value='N' ${(item.empDiv eq 'N')? 'checked' : ''} />
				    	    관리자 <input type='radio' id='radio_3' name='empDiv' value='A' ${(item.empDiv eq 'A')? 'checked' : ''} />
				    	    *미분류 <input type='radio' id='radio_4' name='empDiv' value='Z' ${(item.empDiv eq 'Z')? 'checked' : ''} />
			    		</div>
					</td>
				</tr>
				<c:if test="${loginInfo.empDiv eq 'A'}">
					<tr>
						<th>연봉</th>	<!--empSalary -->
						<td><input name="empSalary" value="${item.empSalary}"></td>
					</tr>
				</c:if>
				
				<tr>
					<th>입사일</th>	<!-- empHiredate -->
					<td><span>${item.empHiredate}</span>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-lg btn-primary btn-block" type="submit">직원수정</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
