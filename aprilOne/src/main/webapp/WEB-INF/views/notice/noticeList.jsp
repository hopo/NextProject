<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>직원 게시판</title>
<script type="text/javascript" defer="defer">
	
	$(document).ready(function() {
		$frm = $('#searchVo');
		
		// 서브밋 버튼 클릭시   
		$('#searchSubmit', $frm).click(function(e) {
			e.preventDefault(); // 이벤트 전파 막기 
			$('input[name=curPage]', $frm).val(1);
			$frm.submit();
		});

		// 페이지 네비~ 버튼 클릭시
		$(".goPage").click(function() {
			var curPage = $(this).data("curpage");
			$('#curPage').val(curPage);
			$frm.submit();
		});
	});

</script>
</head>

<body>
	<div style="background-color : #ffffff; padding: 30px">
	<c:if test="${msgValue ne null}">
		<div class="alert alert-${msgTag}">${msgValue}</div>
	</c:if>

	<!-- // ;Search Part -->
	<form:form commandName="searchVo" method="POST">
		<table>
			<tr>
				<th>검색타입</th>
				<td>
					<form:select path="searchType" class="btn btn-default">
						<form:option value="ntc_title">글 제목</form:option>
						<form:option value="emp_id">직원ID(등록자ID)</form:option>
						<form:option value="ntc_content">내용</form:option>
					</form:select>
				</td>
				<td>
					<form:input path="searchText"  placeholder="입력하세요..."  class="form-control" />
				</td>
				<td>
					<form:button id="searchSubmit" type="submit" class="btn btn-primary btn-sm">검색</form:button>
				</td>
			</tr>
		</table>
		<form:hidden path="curPage" readonly="true" />
		<form:hidden path="totalPageCount" readonly="true" />
		<form:hidden path="totalCount" readonly="true" />
	</form:form> 
	
	<!-- // ;List View Part -->
	<table class="table table-bordered table-hover">
		<thead class="bg-info">
			<tr>
				<th>글번호</th>	<!-- ntcIdx -->
				<th>제목</th> 	<!-- ntcTitle-->
				<th>내용</th> 	<!-- ntcContent -->
				<th>글쓴이</th>	<!-- empId -->
				<th>등록일</th>	<!-- ntcRegdate -->
				<th>조회수</th>	<!-- ntcCount -->
			</tr>
		</thead>

		<tbody>
			<c:forEach var="item" items="${result}">
				<c:url value="/notice/noticeView" var="noticeViewUrl">
					<c:param name="ntcIdx" value="${item.ntcIdx}" />
					<c:param name="curPage" value="${searchVo.curPage}" />
				</c:url>
				<c:if test="${item.ntcDelat eq 'F'}">
					<tr>
						<td><a href="${noticeViewUrl}">${item.ntcIdx}</a></td>
						<td>${item.ntcTitle}</td>
						<td>${item.ntcContent}</td>
						<td>${item.empId}</td>
						<td>${item.ntcRegdate}</td>
						<td>${item.ntcCount}</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>

	<a class="btn btn-default" href="<c:url value='/notice/noticeCreate' />">글작성</a>
				
	<!-- // ;List Number Navigation Part -->
	<nav>
		<ul class="pagination">
			<!-- // ;;Previous Button -->
			<c:if test="${searchVo.startPage ne 1}">
				<li>
					<a href='#' aria-label='Previous' data-curpage='${searchVo.startPage - 1}' class='prev goPage'>
						<span aria-hidden='true'>Prev</span>
					</a>
				</li>
			</c:if>

			<c:if test="${searchVo.startPage eq 1}">
				<li class='disabled'>
					<a href='#' aria-label='Previous'>
						<span aria-hidden='true'>Prev</span>
					</a>
				</li>
			</c:if>
	
			<!-- // ;;Page Numbering -->
			<c:forEach var="i" begin="${searchVo.startPage}" end="${searchVo.endPage}">
				<c:choose>
					<c:when test="${i eq searchVo.curPage}">
						<li class='disabled'>
							<a href='#'>${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class='activate'>
							<a href='#' data-curpage='${i}' class='goPage'>${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	
			<!-- // ;;Next Button-->
			<c:if test="${searchVo.endPage lt searchVo.totalPageCount}">
				<li>
					<a href='#' aria-label='Next' data-curpage='${searchVo.endPage + 1}' class='next goPage'>
						<span aria-hidden='true'>Next</span>
					</a>
				</li>
			</c:if>
	
			<c:if test="${searchVo.endPage ge searchVo.totalPageCount}">
				<li class='disabled'>
					<a href='#' aria-label='Next'>
						<span aria-hidden='true'>Next</span>
					</a>
				</li>
			</c:if>
		</ul>
	</nav>
	</div>	

</body>
</html>
