<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>글 작성</title>
</head>

<body>
	<div style="background-color : #ffffff; padding: 30px">
	<form action="<c:url value='/notice/noticeCreateProc' />">
		<input type="hidden" name="empId" value="${loginInfo.empId}">
		<table class="table">
			<thead></thead>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input class="form-control" name="ntcTitle" placeholder="제목" required autofocus></td>
				</tr>
				<tr>
					<th>직원 ID</th>
					<td>${loginInfo.empName} (${loginInfo.empId})</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea class="form-control" rows="10" cols="60" name="ntcContent" placeholder="내용을 쓰세요.." required></textarea></td>
				</tr>
			</tbody>
		</table>
		<input class="btn btn-primary" type="submit" value="글저장" />
		<a class="btn btn-default" href="<c:url value='/notice/noticeList' />">취소</a>
	</form>
	</div>
</body>
</html>
