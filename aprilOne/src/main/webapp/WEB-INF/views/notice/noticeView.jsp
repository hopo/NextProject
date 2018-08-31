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

	<title>notice view</title>
</head>

<body>
<table class="table table-bordered table-hover">
	<tbody>
		<tr>
			<th>글번호</th>
			<td>
				369
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				9월 첫째주 일정 공지
			</td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td>
				김의사
			</td>
		</tr>
		<tr>
			<th>글등록일</th>
			<td>
				2018-08-30	
			</td>
		</tr>
		<tr>
			<th>글수정일</th>
			<td>
				-	
			</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
		</tr>
		<tr>
			<td colspan="2">
				<textarea rows="" cols="">
					0830금: 시작 주제발표
					0903월: 웹서버 시험
					0904화: 이력서/포트폴리오 제출
					0905수: 산업체특강
				</textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<button>글수정</button>
				<a href="<c:url value='/notice/noticeList' />">글목록</a>
			</td>
		</tr>
	</tbody>
	
</table>
</body>
</html>
