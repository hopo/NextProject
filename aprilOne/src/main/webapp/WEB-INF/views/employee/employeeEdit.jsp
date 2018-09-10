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
</head>

<body>
	<form class="form-horizontal" action="<c:url value='/employee/employeeEditProc' />" method="POST">
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
					<td><input name="empPhone" value="${item.empPhone}"></td>
				</tr>
				<tr>
					<th>주민번호</th>	<!-- empRrnum -->
					<td><input name="empRrnum" value="${item.empRrnum}"></td>
				</tr>
				<tr>
					<th>주소</th>	<!-- empAddress -->
					<td><input name="empAddress" value="${item.empAddress}"></td>
				</tr>
				<tr>
					<th>직책</th>	<!-- empDiv -->
					<td>
						<div id='empDiv_radio'>
				    	    의사 <input type='radio' id='radio_1' name='empDiv' value='D' ${(item.empDiv eq 'D')? 'checked=\'checked\'' : ''} />
				    	    간호사 <input type='radio' id='radio_2' name='empDiv' value='N' ${(item.empDiv eq 'N')? 'checked=\'checked\'' : ''} />
				    	    미분류 <input type='radio' id='radio_3' name='empDiv' value='A' ${(item.empDiv eq 'A')? 'checked=\'checked\'' : ''} />
			    		</div>
					</td>
				</tr>
				<tr>
					<th>연봉</th>	<!--empSalary -->
					<td><input name="empSalary" value="${item.empSalary}"></td>
				</tr>
				<tr>
					<th>입사일</th>	<!-- empHiredate -->
					<td><input name="empHiredate" value="${item.empHiredate}"></td>
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
