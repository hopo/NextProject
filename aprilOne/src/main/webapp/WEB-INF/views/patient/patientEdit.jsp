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

<title>patient Update</title>
</head>

<body>
	<form action="<c:url value="/patient/patientUpdateProc"/>" method="POST">
		<table class="table table-bordered">
			<thead></thead>
			<tbody>
				<tr>
					<th>환자 코드</th>
					<td>
						${patUpdt.patCode}
						<input name="patCode" type="hidden" value="${patUpdt.patCode}">
					</td>
				</tr>
				<tr>
					<th>환자 이름</th>
					<td><input name="patName" type="text" value="${patUpdt.patName}"></td>
				</tr>
				<tr>
					<th>환자 담당의</th>
					<td><input name="empId" type="text" value="${patUpdt.empId}"></td>
				</tr>
				<tr>
					<th>환자 주민번호</th>
					<td><input name="patRrnum" type="text" value="${patUpdt.patRrnum}"></td>
				</tr>
				<tr>
					<th>환자 주소</th>
					<td><input name="patAddress" type="text" value="${patUpdt.patAddress}"></td>
				</tr>
				<tr>
					<th>환자 전화번호</th>
					<td><input name="patPhone" type="text" value="${patUpdt.patPhone}"></td>
				</tr>
				<tr>
					<th>환자 질환유무</th>
					<td><input name="patDisease" type="text" value="${patUpdt.patDisease}"></td>
				</tr>
				<tr>
					<th>환자 특이사항</th>
					<td><input name="patMemo" type="text" value="${patUpdt.patMemo}"></td>
				</tr>
			</tbody>
		</table>
		<button type="submit" class="btn btn-default" id="btn-update">수정</button>
	</form>
</body>
</html>














