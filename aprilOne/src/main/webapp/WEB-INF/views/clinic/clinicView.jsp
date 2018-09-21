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
	
	<form action="<c:url value='${urls.prescription_create}' />" method="POST">
		<table class="table">
			<tbody>
				<tr>
					<th>진료코드</th> <!-- clnCode -->
					<td>
						${item.clnCode}
						<!-- <input type="text" name="clnCode" id="clnCode" value="${item.clnCode}" >  -->
					</td>
				</tr>
				<tr>
					<th>환자이름 (환자코드)</th>	<!-- patCode -->
					<td>
						${param.patName} - ${item.patCode}
						<!-- <input type="text" name="patCode" id="patCode" value="${item.patCode}" >  -->
						<a href="<c:url value='${patientViewUrl}'/>" class="btn btn-info btn-xs">상세보기</a>
					</td>
				</tr>
				<tr>
					<th>담당의 (직원ID)</th>	<!-- empId -->
					<td>
						${param.empName} - ${item.empId}
						<!-- <input type="text" name="empId" id="empId" value="${item.empId}" > -->
						<a href="<c:url value='${employeeViewUrl}'/>" class="btn btn-xs btn-info">상세보기</a>
					</td>
				</tr>
				<tr>
					<th>진료일</th>	<!-- clnDate -->
					<td>
						${item.clnDate}
						<!-- <input type="text" name="clnDate" id="clnDate" value="${item.clnDate}" > -->
					</td>
				</tr>
				<tr>
					<th>진료내용</th>	<!-- clnDescr -->
					<td>
						<pre>${item.clnDescr}</pre>
						<!-- <input type="text" name="clnDescr" id="clnDescr" value="${item.clnDescr}" >  -->       
					</td>
				</tr>
				
				<tr>				
					<td colspan="2" class="btn-group">
						<a class="btn btn-default btn-sm" href="<c:url value='${urls.clinic_list}' />">진료리스트</a>
						<button type="submit" class="btn btn-primary btn-sm" >처방하기</button>
					</td>
				</tr>	
				
			</tbody>
		</table>
	</form>
	
	<%--
	<c:url value='/employee/employeeEdit' var='employeeEditUrl'>
		<c:param value='${item.empId}' name='empId' />
	</c:url>
	<button class="btn"><a href="${employeeEditUrl}">수정</a></button>

	<c:url value='/employee/employeeRetire' var='employeeRetireUrl'>
		<c:param value='${item.empId}' name='empId' />
	</c:url>
	<button class="btn"><a href="${employeeRetireUrl}">"YOU'RE FIRED!"</a></button>
	--%>

	</body>
</html>

