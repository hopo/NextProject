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
	<form action="<c:url value='/patient/patientCreateProc' />"  method="POST">
		<table class="table table-bordered" >
			<tbody>
				<tr>
					<th>보험 코드</th>
					<td><input type="text" name="insCode"></td>
				</tr>
				<tr>
					<th>환자 이름</th>
					<td><input type="text" name="patName" required placeholder="이름" value="김환자"></td>
				</tr>
				<tr>
					<th>환자 전화번호</th>
					<td><input type="text" name="patPhone" required placeholder="전화번호" value="010-0000-0000"></td>
				</tr>
				<tr>
					<th>환자 주민번호</th>
					<td><input type="text" name="patRrnum" required placeholder="주민번호" value="900101-1112222"></td>
				</tr>
				<tr>
					<th>환자 성별</th>
					<td>
						<div id='type'>
							여자 <input type='radio' id='radio_2' name='patGender' value='F' />
				    	    남자 <input type='radio' id='radio_1' name='patGender' value='M' />
				    	    미분류 <input type='radio' id='radio_3' name='patGender' value='Z' checked="checked" />
			    		</div>
				</tr>
				<tr>
					<th>환자 주소</th>
					<td>
						<input type="text" name="patAddress" required placeholder="주소" value="대전광역시 중구"></td>
				</tr>
				<tr>
					<th>환자 질환유무</th>
					<td><input type="text" name="patDisease" ></td>
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
			</tbody>
		</table>
		<button class="btn btn-primary">환자등록</button>
	</form>
</body>
</html>











