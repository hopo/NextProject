<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page session="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html lang="ko">

<head>
<meta charset="UTF-8">
<title>notice view</title>
</head>
<body>
	
		<table class="table table-bordered table-hover">

			<tbody>
				<tr>
					<th>글번호</th>
					<td>${result.NTC_IDX}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${result.NTC_TITLE}</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>${result.EMP_ID}</td>
				</tr>
				<tr>
					<th>글등록일</th>
					<td>${result.NTC_REGDATE}</td>
				</tr>
				<tr>
					<th>글수정일</th>
					<td>${result.NTC_UPDATE}</td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td>${result.NTC_CONTENT}</td>
				</tr>

				<tr>
					<td colspan="2"><a href="<c:url value='/notice/noticeList' />">글목록</a>
						<a href="">수정</a><a href="">삭제</a></td>
				</tr>
			</tbody>
		</table>

	</body>
</html>
