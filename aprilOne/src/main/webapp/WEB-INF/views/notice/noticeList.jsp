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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>게시판</title>
</head>

<body>
	<table class="table">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>글 제목</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>수정일</th>
				<th>직원 ID</th>
			</tr>
		</thead>

		<tbody>

			<c:forEach var="item" items="${result}">
				<c:url var="viewUrl" value="/notice/noticeView">
					<c:param name="idx" value="${item.ntcIdx }" />
				</c:url>

				<tr>
					<td><a href="${viewUrl}"> ${item.ntcIdx } </a></td>
					<td><a href="${viewUrl}">${item.ntcTitle } </a></td>
					<td>${item.ntcCount }</td>
					<td>${item.ntcRegdate }</td>
					<td>${item.ntcUpdate }</td>
					<td>${item.empId }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="2">
					<a href="<c:url value='/notice/noticeForm' />">글작성</a>
				</td>
			</tr>

		</tbody>


	</table>
</body>
</html>
