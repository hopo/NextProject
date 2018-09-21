<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>수정</title>
</head>

<body>
	<body>
	<form class="form-horizontal" action="<c:url value='/notice/noticeEditProc' />" method="POST">
		<table class="table table-bordered">
			 <tbody>
				<tr>
					<th>글번호</th>
					<td><input type="hidden" name="ntcIdx" value="${item.ntcIdx}">${item.ntcIdx}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="ntcTitle" value="${item.ntcTitle}"></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td><input type="hidden" name="empName" value="${item.empName}">${item.empName} - ${item.empId}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="60" name="ntcContent" rows="" cols="">${item.ntcContent}</textarea>
					</td>
				</tr>
				<tr>
					<th>글등록일</th>
					<td>${item.ntcRegdate}</td>
				</tr>
				<tr>
					<th>글수정일</th>
					<td>${item.ntcUpdate}</td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<button class="btn btn-info" type="submit">수정등록</button>
			<a class="btn btn-default" href="<c:url value='/notice/noticeList' />">취소</a>
		</div>
	</form>
</body>
</html>
