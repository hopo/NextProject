<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>환자 리스트</title>
<script type="text/javascript" defer="defer">
	$(document).ready(function(){	
		
		$frm = $('#searchForm');
		// 서브밋 버튼 클릭시   
		$('button[type=submit]', $frm).click(function(e){
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
	<c:if test="${msgValue ne null}">
		<div class="alert alert-${msgTag}">${msgValue}</div>
	</c:if>

	<!-- // ;Search Part -->
	<form action="<c:url value='/patient/patientList' />" id="searchForm" method="POST">
		<table class="table table-bordered">
			<tr>
				<th>SearchType</th>
				<td>
					<select name="searchType">
						<option value="sel1" ${searchType eq 'sel1'?'selected="selected"':''}>이름</option>
						<option value="sel2" ${searchType eq 'sel2'?'selected="selected"':''}>환자코드</option>
						<option value="sel3" ${searchType eq 'sel3'?'selected="selected"':''}>보험코드</option>
						<option value="sel4" ${searchType eq 'sel4'?'selected="selected"':''}>전화번호</option>
					</select>
				</td>
          		
				<td>
					<!-- <input type="text" name="searchText" value="<%= request.getParameter("searchText")%>" /> -->
					<input type="text" name="searchText" value="${searchText}" />
				</td>
				
				<td>
					<button id="searchsubmit" type="submit" class="btn btn-primary">검색</button>
				</td>
				
			</tr>
		</table>
		<input type="hidden" name="curPage" />
		<input type="hidden" name="totalPageCount" />
		<input type="hidden" name="totalCount" />
	</form>




	<!-- 검색테이블 -->
	<table class="table table-bordered table-hover">
		<thead class="bg-danger">
			<tr>
				<th>환자코드</th>
				<th>환자이름</th>
				<th>담당의</th>
				<th>환자주민번호</th>
				<th>보험코드</th>
				<th>환자주소</th>
				<th>환자전화번호</th>
				<th>질환유무</th>
				<th>초진일</th>
				<th>재진일</th>
				<th>특이사항</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${patList}">
				<c:url var="viewUrl" value="/">
					<c:param name="patCode" value="${i.patCode}"/>
					<c:param name="patCode" value="${patientSearchVo.curPage}"/>
				</c:url>
				<tr>
					<td><a href="<c:url value='/patient/patientView?patCode=${i.patCode}' />">${i.patCode}</a></td>
					<td>${i.patName}</td>
					<td>${i.empId}</td>
					<td>${i.patRrnum}</td>
					<td>${i.patInscode}</td>
					<td>${i.patAddress}</td>
					<td>${i.patPhone}</td>
					<td>${i.patDisease}</td>
					<td>${i.patFirstdate}</td>
					<td>${i.patRedate}</td>
					<td>${i.patMemo}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


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

</body>
</html>





