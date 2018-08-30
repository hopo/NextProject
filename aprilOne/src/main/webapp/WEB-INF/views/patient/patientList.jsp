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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>patient list</title>
</head>

<body>
"patient list"

<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>환자코드</th>
			<th>환자이름</th>
			<th>담장의</th>
			<th>환자주민번호</th>
			<th>보험코드</th>
			<th>환자주소</th>
			<th>환자전화번호</th>
			<th>질환유무</th>
			<th>초진일</th>
			<th>재진일</th>
			<th>특이사항</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="i" begin="0" end="9" step="1">
			<tr>
				<td><a href="<c:url value='/patient/patientView' />">ABC-00${i}</a></td>
				<td>환자이름${i}</td>
				<td>담장의${i}</td>
				<td>환자주민번호${i}</td>
				<td>보험코드${i}</td>
				<td>환자주소${i}</td>
				<td>환자전화번호${i}</td>
				<td>질환유무${i}</td>
				<td>초진일${i}</td>
				<td>재진일${i}</td>
				<td>특이사항${i}</td>
			</tr>		
		</c:forEach>
	</tbody>
</table>
</body>
</html>
