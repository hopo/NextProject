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

<title>게시판</title>
<script type="text/javascript" defer="defer">
	
	$(document).ready(function() {
		$frm = $('#NoticeSearchVo');
		
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
	<!-- 검색 -->
	 
	 <form:form  commandName="NoticeSearchVo" method="POST">
	    <form:hidden path="curPage" readonly="true" />
		<table>
			<tr>
				<th>검색타입</th>
				<td>
					<form:select path="searchType" class="btn-dark btn-sm">
						<form:option value="ntc_idx">제목</form:option>
						<form:option value="emp_id">직원ID</form:option>
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
<%-- 		currentPage: 
		totalPage: <form:input path="totalPageCount" readonly="true" />
		totalRecord: <form:input path="totalCount" readonly="true" /> --%>
	</form:form> 
	

				<!-- 게시판 리스트 -->
				<table class="table">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>글 제목</th>
							<th>조회수</th>
							<th>등록일</th>
							<th>직원 ID</th>
							<!-- <th>del여부</th> -->
						</tr>
					</thead>

					<tbody>

						<c:forEach var="item" items="${result}">
							<c:url var="viewUrl" value="/notice/noticeView">
								<c:param name="ntcIdx" value="${item.ntcIdx }" />
								<c:param name="curPage" value="${NoticeSearchVo.curPage }" />
							</c:url>
							<c:if test="${item.ntcDelat eq 'F'}">
								<tr>
									<td><a href="${viewUrl}"> ${item.rnum }</a></td>
									<td><a href="${viewUrl}">${item.ntcTitle } </a></td>
									<td>${item.ntcCount }</td>
									<td>${item.ntcRegdate }</td>
									<td>${item.empId }</td>
									<%-- <td>${item.ntcDelat }</td> --%> 
								</tr>
							</c:if>
						</c:forEach>
						<tr>
							<td colspan="2"><a
								href="<c:url value='/notice/noticeForm' />">글작성</a></td>
						</tr>
					</tbody>
				</table>
				
			<!-- 네비게이션 -->
		<nav>
			<ul class="pagination">
				<!-- 이전 -->
				<c:if test="${NoticeSearchVo.startPage ne 1}">
					<li>
						<a href='#' aria-label='Previous' data-curpage='${NoticeSearchVo.startPage - 1}' class='prev goPage'>
							<span aria-hidden='true'>Prev</span>
						</a>
					</li>
				</c:if>
	
				<c:if test="${NoticeSearchVo.startPage eq 1}">
					<li class='disabled'>
						<a href='#' aria-label='Previous'>
							<span aria-hidden='true'>Prev</span>
						</a>
					</li>
				</c:if>
		
			<!-- 페이지 -->
			<c:forEach var="i" begin="${NoticeSearchVo.startPage}" end="${NoticeSearchVo.endPage}">
				<c:choose>
					<c:when test="${i eq NoticeSearchVo.curPage}">
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
	
			<!-- 다음 -->
			<c:if test="${NoticeSearchVo.endPage lt NoticeSearchVo.totalPageCount}">
				<li>
					<a href='#' aria-label='Next' data-curpage='${NoticeSearchVo.endPage + 1}' class='next goPage'>
						<span aria-hidden='true'>Next</span>
					</a>
				</li>
			</c:if>
	
			<c:if test="${NoticeSearchVo.endPage ge NoticeSearchVo.totalPageCount}">
				<li class='disabled'>
					<a href='#' aria-label='Next'>
						<span aria-hidden='true'>Next</span>
					</a>
				</li>
			</c:if>
		</ul>
	</nav>	

</body>
</html>
