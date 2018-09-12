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
</head>
<body>
	<form class="form-horizontal" action="<c:url value='/employee/employeeCreateProc' />" method="POST">
		<table class="table">
			<tbody>
				<tr>
					<th>직원 ID</th>
					<td><input type="text" name="empId" class="form-control" placeholder="Id" required autofocus></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="empPwd" class="form-control" placeholder="Password" required value="1111"></td>
				</tr>
				<tr>
					<th>직원 이름</th>
					<td><input type="text" name="empName" class="form-control" placeholder="Name" required value="김테스트"></td>
				</tr>
				<tr>
					<th>직원 전화번호</th>
					<td><input type="text" name="empPhone" class="form-control" placeholder="Phone" required value="010-1111-2222"></td>
				</tr>
				<tr>
					<th>직원 주민번호</th>
					<td><input type="text" name="empRrnum" class="form-control" placeholder="Social Security Number" required value="900909-1231234"></td>
				</tr>
				<tr>
					<th>직원 주소</th>
					<td><input type="text" name="empAddress" class="form-control" placeholder="Address" required value="대전광역시 중구"></td>
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
				<tr>
					<td colspan="2">
						<button class="btn btn-lg btn-primary btn-block" type="submit">직원등록</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>	 

</body>
</html>






