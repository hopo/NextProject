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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>환자 등록</title>
</head>

<body>

<form action="patientCreateProc"  method="post">

	<table class="table table-bordered" >
		<tbody>
			<tr>
				<th>환자 코드</th>
				<td>// 서버 내부에서 자동 생성됩니다</td>
			</tr>
			<tr>
				<th>보험 코드</th>
				<td><input type="text" name="patInscode" ></td>
			</tr>
			<tr>
				<th>환자 이름</th>
				<td><input type="text" name="patName" ></td>
			</tr>
			<tr>
				<th>환자 전화번호</th>
				<td><input type="text" name="patPhone" ></td>
			</tr>
			<tr>
				<th>환자 주민번호</th>
				<td><input type="text" name="patRrnum" ></td>
			</tr>
			<tr>
				<th>환자 성별</th>
				<td><input type="text" name="patGender" ></td>
			</tr>
			<tr>
				<th>환자 주소</th>
				<td><input type="text" name="patAddress" ></td>
			</tr>
			<tr>
				<th>환자 질환유무</th>
				<td><input type="text" name="patDisease" ></td>
			</tr>
			<tr>
				<th>환자 초진일</th>
				<td><input type="date" name="patFirstdate" ></td>
			</tr>
			<tr>
				<th>환자 재진일</th>
				<td><input type="date" name="patRedate" ></td>
			</tr>
			<tr>
				<th>환자 특이사항</th>
				<td><input type="text" name="patMemo" ></td>
			</tr>
			<tr>
				<th>담당의(직원ID)</th>
				<td>
					${loginInfo.empName} (${loginInfo.empId})
					<input type="hidden" name="empId" value="${loginInfo.empId}" >
				</td>
			</tr>


			<tr>
				<td colspan="2">
					<button>환자등록</button>
				</td>
			</tr>
			
		</tbody>
	</table>
</form>





</body>
</html>











