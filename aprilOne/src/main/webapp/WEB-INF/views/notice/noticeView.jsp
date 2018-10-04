<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="ko">

<head>
<meta charset="UTF-8">
<title>notice view</title>
</head>

<body>
	<div style="background-color : #ffffff; padding: 30px">
	<table class="table">
		<tbody>
			<tr>
				<th>글번호</th>
				<td>${item.ntcIdx}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${item.ntcTitle}</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${item.empName}</td>
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
				<th>내용</th>
				<td>
					<pre>${item.ntcContent}</pre>
				</td>
			</tr>
		</tbody>
	</table>



	<div class="btn-group">
		<a class="btn btn-default" href="<c:url value='/notice/noticeList'/>">글목록</a> 

		<c:if test="${loginInfo.empId eq item.empId}">
			<c:url value='/notice/noticeEdit' var='noticeEditUrl'>
				<c:param value='${item.ntcIdx}' name='ntcIdx' />
			</c:url>
			<a class="btn btn-info" href="${noticeEditUrl}">수정</a>
		</c:if>

		<c:if test="${loginInfo.empId eq item.empId or loginInfo.empDiv eq 'A'}">
			<c:url value='/notice/noticeDelete' var='noticeDeleteUrl'>
				<c:param value='${item.ntcIdx}' name='ntcIdx' />
			</c:url>
			<a class="btn btn-danger" href="${noticeDeleteUrl}">삭제</a>
		</c:if>
	</div>
	</div>
	
</body>
</html>
