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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>로그인</title>
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

</head>

<body>
	<c:if test="${msgValue ne null}">
		<div class="alert alert-${msgTag}">${msgValue}</div>
	</c:if>
	
	<div class="loginmo-container">
		<h3 style="text-align: center;">직원 로그인</h3>
		<form action="<c:url value='/session/loginProc' />" method="POST"> 
			<span class="alert-warning"><form:errors path="employeeVo" /><form:errors path="employeeVo.empId" /></span>
			<%-- <form:errors path="employeeVo.empId" /> --%>		
	
			<div>
				<strong>직원아이디</strong>
				<input type="text" name="empId" placeholder="Employee ID" required autofocus>
			</div>
	
			<div>
				<strong>비밀번호</strong>				
				<input type="password" name="empPwd" placeholder="Password" required>
			</div>
			
			<!-- <div class="checkbox"><label><input type="checkbox" value="remember-me">Remember me</label></div> -->
	
			<!-- <button class="btn-primary" type="submit">로그인</button> -->
			<input type="submit" class="login loginmo-submit" value="Login">

			<div>계정이 없으시다면, <a href="<c:url value='${urls.employee_create}' />">등록하기</a></div>
		</form>
	</div>
	
	
	<!-- 
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="loginmodal-container">
				<h1>로그인</h1>
				<br />
				<form>
					<input type="text" name="user" placeholder="Username">
					<input type="password" name="pass" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				</form>
				<div class="login-help">
					<a href="#">Register</a> - <a href="#">Forgot Password</a>
				</div>
			</div>
		</div>
	</div>
	-->	

</body>
</html>
