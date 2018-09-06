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

<title>글 작성</title>
</head>

<body>
	<form action="noticeRegist">
		<table class="table table-bordered table-hover">
			<tbody>

				<tr>
					<th>제목</th>
					<td><input type="text" name="ntcTitle"></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>홍길동</td>
				</tr>

				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="10" cols="60"
							name="ntcContent">
					
				</textarea></td>
				</tr>

				<tr>
					<td colspan="2">
						<button type="submit">글저장</button> <a
						href="<c:url value='/notice/noticeList' />">글목록</a>
					</td>
				</tr>
			</tbody>

		</table>
	</form>
</body>
</html>
