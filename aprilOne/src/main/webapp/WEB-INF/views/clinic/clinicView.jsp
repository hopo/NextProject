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
<title>진료 상세보기</title>
</head>

<body>
	<c:url value="../patient/patientView" var="patientViewUrl">
		<c:param name="patCode" value="${item.patCode}" />
	</c:url>
	<c:url value="../employee/employeeView" var="employeeViewUrl">
		<c:param name="empId" value="${item.empId}" />
	</c:url>
	<table class="table">
		<tbody>
			<tr>
				<th>진료코드</th>	<!-- clnCode -->
				<td>${item.clnCode}</td>
			</tr>
			<tr>
				<th>환자코드</th>	<!-- patCode -->
				<td>
					${item.patCode}<a href="<c:url value='${patientViewUrl}'/>"><button class="btn btn-sm btn-info">상세보기</button></a>
				</td>
			</tr>
			<tr>
				<th>담당의</th>	<!-- empId -->
				<td>
					${item.empId}<a href="<c:url value='${employeeViewUrl}'/>"><button class="btn btn-sm btn-info">상세보기</button></a>
				</td>
			</tr>
			<tr>
				<th>진료일</th>	<!-- clnDate -->
				<td>${item.clnDate}</td>
			</tr>
			<tr>
				<th>진료내용</th>	<!-- clnDescr -->
				<td>${item.clnDescr}</td>
			</tr>
		</tbody>
	</table>

<%-- 	<c:url value='/employee/employeeEdit' var='employeeEditUrl'>
		<c:param value='${item.empId}' name='empId' />
	</c:url>
	<button class="btn"><a href="${employeeEditUrl}">수정</a></button>

	<c:url value='/employee/employeeRetire' var='employeeRetireUrl'>
		<c:param value='${item.empId}' name='empId' />
	</c:url>
	<button class="btn"><a href="${employeeRetireUrl}">"YOU'RE FIRED!"</a></button>
 --%></body>
</html>
