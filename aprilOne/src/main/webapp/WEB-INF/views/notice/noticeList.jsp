<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>notice list</title>
</head>

<body>
				<table class="table">
					<thead>
						<tr>
							<th>순번</th>
							<th>보드타입</th>
							<th>제목</th>
							<th>조회수</th>
							<th>등록일</th>
							<th>수정일</th>
							<th>작성자</th>
						</tr>
					</thead>

					<tbody>

						<c:forEach var="item" items="${result}">

							<c:url var="viewUrl" value="/notice/noticeView">
								<c:param name="idx" value="${item.idx }" />
								<c:param name="curPage" value="${noticeSearchVo.curPage}"></c:param>
							</c:url>

							<tr>
								<td><a href="${viewUrl}"> ${item.rnum } </a></td>
								<td>${item.boardType }</td>
								<td><a href="${viewUrl}">${item.title } </a></td>
								<td>${item.readCount }</td>
								<td>${item.regDate }</td>
								<td>${item.upDate }</td>
								<td>${item.regUser }</td>
							</tr>

						</c:forEach>

					</tbody>


				</table>
</body>
</html>
