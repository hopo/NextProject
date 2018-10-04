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

<script type="text/javascript" defer="defer">

	function check() {
		patPhone = document.getElementById('patPhone');
		patPhone1 = document.getElementById('patPhone1');
		patPhone2 = document.getElementById('patPhone2');
		patPhone2 = document.getElementById('patPhone3');

		patRrnum = document.getElementById('patRrnum');
		patRrnum1 = document.getElementById('patRrnum1');
		patRrnum2 = document.getElementById('patRrnum2');

		patPhone.value = patPhone1.value + '-' +  patPhone2.value + '-' + patPhone3.value;
		patRrnum.value = patRrnum1.value + '-' +  patRrnum2.value;

		if (patPhone.value == null || patRrnum == null) {
			return false;
		} else {
			return true;
		}

	}

</script>

</head>

<body>
	<div style="background-color : #ffffff; padding: 30px">
	<c:if test="${msgValue ne null}">
		<div class="alert alert-${msgTag}">${msgValue}</div>
	</c:if>

	<form action="<c:url value='/patient/patientCreateProc' />"  method="POST" onsubmit="return check()">
	<div class="form-horizontal">
		<table class="table table-bordered" >
			<thead></thead>
			<tbody>
				<tr>
					<th>보험 코드</th>
					<td><input class="form-control" type="text" name="insCode" placeholder="Insurance"></td>
				</tr>
				<tr>
					<th>환자 이름</th>
					<td><input class="form-control" type="text" name="patName" required placeholder="Name"></td>
				</tr>
				<tr>
					<th>환자 전화번호</th>
					<td>
						<select id="patPhone1">
							<option value='010'>010</option>
							<option value='011'>011</option>
							<option value='017'>017</option>
							<option value='018'>018</option>
							<option value='019'>019</option>
						</select>
						-
						<input id="patPhone2" maxlength="4" size="4">
						-
						<input id="patPhone3" maxlength="4" size="4">
						<input type="hidden" id="patPhone" name="patPhone" value="">
					</td>
				</tr>
				<tr>
					<th>환자 주민번호</th>
					<td>
						<input id="patRrnum1" name="patRrnum1" maxlength="6" size="6" required>
						-
						<input id="patRrnum2" name="patRrnum2" maxlength="7" size="7" required>
						<input type="hidden" id="patRrnum" name="patRrnum" value="">
					</td>
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
						<input class="form-control" type="text" name="patAddress" required placeholder="Adress"></td>
				</tr>
				<tr>
					<th>환자 질환유무</th>
					<td><input class="form-control" type="text" name="patDisease" placeholder="Disease"></td>
				</tr>
				<tr>
					<th>환자 특이사항</th>
					<td><input class="form-control" type="text" name="patMemo" placeholder="Memo"></td>
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
		<button class="btn btn-primary">등록하기</button>
	</div>
	</form>
	</div>
</body>
</html>
