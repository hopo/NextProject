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

<title>환자 목록</title>

<script type="text/javascript" defer="defer">

	$(document).ready(function() {
		$frm = $('#searchVo');

		// ;;on click submit btn
		$('#searchSubmit', $frm).click(function(evt) {
			evt.preventDefault();
			$('input[name=curPage]', $frm).val(1);
			$frm.submit();
		});

		// ;;on click  page nav btn
		$('.goPage').click(function() {
			var curPage = $(this).data('curpage');
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
						<form:option value="pat_name">환자이름</form:option>
						<form:option value="pat_phone">환자전화번호</form:option>
						<form:option value="emp_id">담당의</form:option>
					</form:select>
				</td>
				<td>
					<form:input path="searchText" placeholder="입력하세요..." class="form-control" />
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
		<thead class="bg-danger">
			<tr>
				<th>환자코드</th>
				<th>보험코드</th>
				<th>환자이름</th>
				<th>환자주민번호</th>
				<th>환자주소</th>
				<th>환자전화번호</th>
				<th>질환유무</th>
				<th>특이사항</th>
				<th>담당의</th>
				<th>최근진료일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${patList}">
				<c:url var="viewUrl" value="/">
					<c:param name="patCode" value="${i.patCode}"/>
					<c:param name="curPage" value="${patientSearchVo.curPage}"/>
				</c:url>
				<tr>
					<td><a href="<c:url value='/patient/patientView?patCode=${i.patCode}' />">${i.patCode}</a></td>
					<td>${i.patName}</td>
					<td>${i.insCode}</td>
					<td>${i.patRrnum}</td>
					<td>${i.patAddress}</td>
					<td>${i.patPhone}</td>
					<td>${i.patDisease}</td>
					<td>${i.patMemo}</td>
					<td>${i.empId}</td>
					<td>${i.patFirstdate eq null ? i.patRedate : i.patFirstdate}</td>
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
						<li class='disabled'><a href='#'>${i}</a></li>
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
