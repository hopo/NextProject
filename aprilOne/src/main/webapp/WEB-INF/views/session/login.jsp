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
<title>Login</title>
</head>

<body>
	<c:if test="${message ne null}">
		<div class="alert-info">${message}</div>
	</c:if>

	<form class="form-horizontal" action="<c:url value='/session/loginProc' />" method="POST"> 
		<span class="alert-warning"><form:errors path="employeeVo" /><form:errors path="employeeVo.empId" /></span>
		<%-- <form:errors path="employeeVo.empId" /> --%>		

		<div class="form-group">
			<strong>직원아이디</strong>
			<input name="empId" id="inputEmpId" class="" placeholder="Employee Id" required autofocus>
		</div>

		<div class="form-group">
			<strong class="">비밀번호</strong>
			<input type="password" name="empPwd"  id="inputPassword" class="" placeholder="Password" required>
		</div>
		
		<div class="checkbox">
			<label><input type="checkbox" value="remember-me">Remember me</label>
		</div>
		
		<button class="btn btn-primary" type="submit">로그인</button>
		<div>ID가 없다면, <a href="<c:url value='/employee/employeeCreate' />">등록하기</a></div>
	</form>
</body>
</html>














