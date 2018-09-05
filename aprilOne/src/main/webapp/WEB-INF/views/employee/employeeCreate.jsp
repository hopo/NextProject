<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title> 직원 등록 </title>
</head>

<body>

<form class="form-horizontal" action="employeeCreateProc" method="post">
	
	
	
		직원 ID
		<input type="text"  name="empId" id="inputEmpId" class="form-control" placeholder="Id" required autofocus>
		
		비밀번호
		<input type="password" name="empPwd"  id="inputPassword" class="form-control" placeholder="Password" required>
		
		직원 이름
		<input type="text" name="empName"  id="inputName" class="form-control" placeholder="Name" required>
		
		직원 주민번호
		<input type="text" name="empRrnum"  id="inputRrnum" class="form-control" placeholder="Social Security Number" required>
		
		직원 전화번호
		<input type="text" name="empPhone"  id="inputPhone" class="form-control" placeholder="Phone" required>
		
		직원 주소
		<input type="text" name="empAddress"  id="inputAddress" class="form-control" placeholder="Address" required>
		
		<br>
		직책
		
		<div id='type'>
	        의사 <input type='radio' id='radio_1' name='empDiv' value='D' />
	        직원 <input type='radio' id='radio_2' name='empDiv' value='Y' />
    	</div>
		<br>



		연봉
		<input type="text" name="empSalary"  id="inputSalary" class="form-control" placeholder="Salary" required>
		
		입사일
		<input type="date" name="empHiredate"  id="inputHiredate"  class="form-control" placeholder="Hiredate" required>
		
		퇴사일
		<input type="date" name="empRetiredate"  id="inputRetiredate" class="form-control" placeholder="Retiredate" required>

		
		<button class="btn btn-lg btn-primary btn-block" type="submit" > 등록 </button>
	
	</form>	 
		 
					 
</body>
</html>






