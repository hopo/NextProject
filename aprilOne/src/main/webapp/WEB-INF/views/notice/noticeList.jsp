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

	<title>notice list</title>
</head>

<body>
	<!-- // ;Search Part -->
	<table class="table table-bordered">
		<tr>
			<th>SearchType</th>
			<td>
				<select>
					<option value="sel1">글번호</option>
					<option value="sel2">글제목</option>
					<option value="sel3">글쓴이</option>
					<option value="sel4">글등록일</option>
				</select>
			</td>
			<td>
				<input placeholder="검색내용입력..." />
			</td>
			<td>
				<button id="searchsubmit" type="submit" class="btn btn-primary">검색</button>
			</td>
		</tr>
	</table>

	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>글등록일</th>
				<th>글수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" begin="0" end="9" step="1">
				<tr>
					<td><a href="<c:url value='/notice/noticeView' />">NTC-00${i}</a></td>
					<td>제목${i}</td>
					<td>글쓴이${i}</td>
					<td>2018-08-30</td>
					<td>2018-09-01</td>
				</tr>		
			</c:forEach>
		</tbody>
	</table>
	
	<nav>
		<ul class="pagination">
			<!-- // ;;Previous Button -->
				<li>
					<a href='#' aria-label='Previous' data-curpage='${customerSearchVo.startPage - 1}' class='prev goPage'>
						<span aria-hidden='true'>Prev</span>
					</a>
				</li>
	
			<!-- // ;;Page Numbering -->
				<li class='activate'>
					<a href='#' class='goPage'>1</a>
				</li>
				<li class='activate'>
					<a href='#' class='goPage'>2</a>
				</li>
				<li class='activate'>
					<a href='#' class='goPage'>3</a>
				</li>
	
			<!-- // ;;Next Button-->
	
				<li class='disabled'>
					<a href='#' aria-label='Next'>
						<span aria-hidden='true'>Next</span>
					</a>
				</li>
			</ul>
	</nav>
</body>
</html>
