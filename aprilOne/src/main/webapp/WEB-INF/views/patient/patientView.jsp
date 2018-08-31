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

	<title>patient view</title>
</head>

<body>
"patient view"

<table class="table table-bordered table-hover">
	<tbody>
		<tr>
			<th>환자 이름</th>
			<td>
				김환자
			</td>
		</tr>
		<tr>
			<th>환자 주민번호</th>
			<td>
				760503-3413021
			</td>
		</tr>
		<tr>
			<th>환자 주소</th>
			<td>
				대전광역시 중구 용두동 444
			</td>
		</tr>
		<tr>
			<th>환자 전화번호</th>
			<td>
				017-2342-4444
			</td>
		</tr>
		<tr>
			<th>환자 질환유무</th>
			<td>
				없음
			</td>
		</tr>
		<tr>
			<th>환자 초진일</th>
			<td>
				2018-04-09
			</td>
		</tr>
		<tr>
			<th>환자 재진일</th>
			<td>
				-	
			</td>
		</tr>
		<tr>
			<th>환자 특이사항</th>
			<td>
				-	
			</td>
		</tr>
		<tr>
			<th>환자 보험코드</th>
			<td>
				RC-123123-4444	
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<button>수정하기</button>
				<a href="<c:url value='/patient/patientList' />">환자목록</a>
			</td>
		</tr>
	</tbody>
	
</table>
</body>
</html>
