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
		<table class="table">


			 <tbody>
				<tr>
					<th>글번호</th>
					<td><input type="hidden" name="ntcIdx" value="${item.ntcIdx}">${item.ntcIdx}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="ntcTitle" value="${item.ntcTitle}">${item.ntcTitle}</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td><input type="hidden" name="empName" value="${item.empName} ( ${item.empDiv} )">${item.empName} </td>
				</tr>
				<tr>
					<th>글등록일</th>
					<td>${item.ntcRegdate}</td>
				</tr>
				<tr>
					<th>글수정일</th>
					<td>${item.ntcUpdate}</td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td><input type="text" name="ntcContent" value="${item.ntcContent}">${item.ntcContent}</td>
				</tr>
 
				<tr>
					<td colspan="2">
					<a href="<c:url value='/notice/noticeList'/>">글목록</a>
				</tr>
				<tr>
					<td colspan="2">
					<button type="submit">수정</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
