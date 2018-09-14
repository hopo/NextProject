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
<title>직원퇴사완료</title>
</head>

<body>
	<div>${param.empName} (${param.empId})님. 정말 퇴사인가요?!</div>
	<c:url value='/employee/employeeRetireProc' var='employeeRetireProcUrl'>
		<c:param value='${param.empId}' name='empId' />
	</c:url>
	<a href="${employeeRetireProcUrl}" class="btn btn-danger">OK</a>
	<a href="<c:url value='/employee/employeeList' />" class="btn btn-default">취소</a>
</body>
</html>
