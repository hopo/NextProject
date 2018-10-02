<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>환자 상세보기</title>
</head>

<body>
	<c:if test="${msgValue ne null}">
		<div class="alert alert-${msgTag}">${msgValue}</div>
	</c:if>

	<table class="table table-bordered">
		<thead></thead>
		<tbody>
			<tr>
				<th>환자 코드</th>
				<td>
					${patView.patName} (${patView.patCode})
					<c:url value="${urls.clinic_create}" var="clinic_create">
						<c:param name="patCode" value="${patView.patCode}" />
						<c:param name="patName" value="${patView.patName}" />
					</c:url>
					<c:if test="${loginInfo.empDiv eq 'D'}">
						<a class="btn btn-primary btn-xs" href="${clinic_create}">진료하기</a>
					</c:if>
					
				</td>
			</tr>
			<tr>
				<th>환자 담당의</th>
				<td>${patView.empId}</td>
			</tr>
			<tr>
				<th>환자 주민번호</th>
				<td>${patView.patRrnum}</td>
			</tr>
			<tr>
				<th>환자 보험코드</th>
				<td>${patView.insCode}</td>
			</tr>
			<tr>
				<th>환자 주소</th>
				<td>${patView.patAddress}</td>
			</tr>
			<tr>
				<th>환자 전화번호</th>
				<td>${patView.patPhone}</td>
			</tr>
			<tr>
				<th>환자 질환유무</th>
				<td>${patView.patDisease}</td>
			</tr>
			<tr>
				<th>환자 초진일</th>
				<td>${patView.patFirstdate}</td>
			</tr>
			<tr>
				<th>환자 재진일</th>
				<td>${patView.patRedate}</td>
			</tr>
			<tr>
				<th>환자 특이사항</th>
				<td>${patView.patMemo}</td>
			</tr>
		</tbody>
	</table>
	<div class="btn-group" colspan="2">
		<a class="btn btn-default" href="<c:url value='/patient/patientList' />">환자목록</a>
		<a class="btn btn-info" href="<c:url value='/patient/patientEdit?patCode=${patView.patCode}' />">수정</a>
		<!-- <a class="btn btn-danger" href="<c:url value='#' />">삭제</a> -->
	</div>
</body>
</html>
