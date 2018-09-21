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

<title> 처방 수정 </title>
</head>

<body>
	

	<form method="post" action="<c:url value="/prescription/prescriptionUpdateProc"/>">
		<table class="table table-bordered table-hover">
			<tbody>
				<tr>
					<th>처방 코드</th>
					<td><input name="patCode" type="text" value="${prsUpdt.prsCode}"></td>
				</tr>
				<tr>
					<th>처방 코드</th>
					<td><input name="patInscode" type="text" value=" ${prsUpdt.patInscode}"></td>
				</tr> 
				<tr>
					<th>환자 코드</th>
					<td><input name="patName" type="text" value=" ${prsUpdt.patName}"></td>
				</tr>
				<tr>
					<th> 담당의</th>
					<td><input name="empId" type="text" value=" ${patUpdt.empId}"></td>
				</tr>
				<tr>
					<th>진료일</th>
					<td><input name="patRrnum" type="text" value=" ${prsUpdt.patRrnum}"></td>
				</tr>
				<tr>
					<th> 진료내용 </th>
					<td><input name="patAddress" type="text" value=" ${prsUpdt.patAddress}"></td>
				</tr>
				<tr>
					<th> 처방내역 </th>
					<td><input name="patPhone" type="text" value=" ${prsUpdt.patPhone}"></td>
				</tr>
				<tr>
					<th>의약품 코드</th>
					<td><input name="patDisease" type="text" value=" ${prsUpdt.patDisease}"></td>
				</tr>
				<tr>
					<th>의약품 코드2</th>
					<td><input name="patDisease" type="text" value=" ${prsUpdt.patDisease}"></td>
				</tr>
				<tr>
					<th>의약품 코드3</th>
					<td><input name="patDisease" type="text" value=" ${prsUpdt.patDisease}"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<button type="submit" id="btn-update">수정하기</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>

</body>
</html>














