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

<title>처방  리스트</title>
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
 
	<!-- 검색 -->
	<form action="<c:url value='/prescription/prescriptionList' />" id="searchForm" method="POST">
		<input type="hidden" name="curPage" id="curPage" />
		
		<table class="table table-bordered">
			<tr>
				<th>SearchType</th>
				<td>
					<select name="searchType">
						<option value="sel1" ${PagingVo.searchType eq 'sel1'?'selected="selected"':''}>환자이름</option>
						<option value="sel2" ${PagingVo.searchType eq 'sel2'?'selected="selected"':''}>처방코드</option>
					</select>
				</td>
				<td>
					<input type="text" name="searchText"  value="<%= request.getParameter("searchText")%>" />
				</td>
				<td>
					<button id="searchsubmit" type="submit" class="btn btn-primary">검색</button>
				</td>
			</tr>
		</table>
	</form>




	<!-- 검색테이블 -->
	<table class="table table-bordered table-hover">
		<thead class="bg-success">
			<tr>
				<th>처방코드</th>
				<th>진료코드</th>
				<th>처방내용</th>
				<th>의약품코드</th>
				<th>의약품코드2</th>
				<th>의약품코드3</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${prsList }">
				<c:url var="viewUrl" value="/">
					<c:param name="prsCode" value="${i.prsCode }"/>
				
				</c:url>
					<td><a href="<c:url value='/prescription/prescriptionCreate?prsCode=${i.prsCode}' />">${i.prsCode}</a></td>
					<td>${i.clnCode}</td>
					<td>${i.prsDescr}</td>
					<td>${i.medCode}</td>
					<td>${i.medCode2}</td>
					<td>${i.medCode3}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>





	<!-- 네비게이션 -->

	<nav>
	<ul class="pagination">
	
		<!-- // Previous Button -->

			<li><a href='#' aria-label='Previous' data-curpage='${PagingVo.startPage - 1}' class='prev goPage'> 
			<span aria-hidden='true'>Prev</span>
			</a></li>
		
		<c:forEach var="i" begin="${PagingVo.startPage}" end="${PagingVo.endPage}">
			<c:choose>
				<c:when test="${i eq PagingVo.curPage}">
					<li class="active"><a>${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#" data-curpage='${i}' class="goPage">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>





	<!-- // 다음버튼  -->
	<%--  <c:if test="${PagingVo.endPage < PagingVo.totalPageCount}">
		<li>
          <a href="#" data-curpage="${PagingVo.endPage + 1}" 
          			  class="next goPage"  
          		      aria-label="Next" title="Next">
            <span aria-hidden="true">다음 »</span>
          </a>
        </li>
	</c:if>  --%>
	

		<!-- // ;;Next Button-->
		 <c:if test="${PagingVo.endPage >= PagingVo.totalPageCount}">
			<li class='disabled'><a href='#' aria-label='Next'> <span aria-hidden='true'>Next</span>
			</a></li>
		</c:if> 

	</ul>
	</nav> 



</body>
</html>





