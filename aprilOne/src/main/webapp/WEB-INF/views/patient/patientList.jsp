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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>patient List</title>


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
	<!-- // Search Part -->
	
	<form action="/patient/patientList" id="searchForm" method="post">
		<input type="hidden" name="curPage" id="curPage" />
		
		<table class="table table-bordered">
			<tr>
				<th>SearchType</th>
				<td>
					<select name="searchType">
						<option value="sel1" ${patientSearchVO.searchType eq 'sel1'?'selected="selected"':''}>이름</option>
						<option value="sel2" ${patientSearchVO.searchType eq 'sel2'?'selected="selected"':''}>환자코드</option>
						<option value="sel3" ${patientSearchVO.searchType eq 'sel3'?'selected="selected"':''}>보험코드</option>
						<option value="sel4" ${patientSearchVO.searchType eq 'sel4'?'selected="selected"':''}>전화번호</option>
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





	<table class="table table-bordered table-hover">
		<thead>
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
			<c:forEach var="i" items="${patList }">
				<c:url var="viewUrl" value="/">
					<c:param name="patCode" value="${i.patCode }"/>
					<c:param name="patCode" value="${patientSearchVo.curPage }"/>
					
				
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



	<nav>
	<ul class="pagination">
	
		<!-- // ;;Previous Button -->

			<li><a href='#' aria-label='Previous' data-curpage='${patientSearchVo.startPage - 1}' class='prev goPage'> <span aria-hidden='true'>Prev</span>
			</a></li>
		
		<c:forEach var="i" begin="${patientSearchVo.startPage}" end="${patientSearchVo.endPage}">
			<c:choose>
				<c:when test="${i eq patientSearchVo.curPage}">
					<li class="active"><a>${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#" data-curpage='${i}' class="goPage">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>





	<!-- // 다음버튼  -->
<%-- 	<c:if test="${patientSearchVo.endPage < patientSearchVo.totalPageCount}">
		<li>
          <a href="#" data-curpage="${patientSearchVo.endPage + 1}" 
          			  class="next goPage"  
          		      aria-label="Next" title="Next">
            <span aria-hidden="true">다음 »</span>
          </a>
        </li>
	</c:if> --%>
	





		<!-- // ;;Next Button-->
		<c:if test="${patientSearchVo.endPage >= patientSearchVo.totalPageCount}">
			<li class='disabled'><a href='#' aria-label='Next'> <span aria-hidden='true'>Next</span>
			</a></li>
		</c:if>

	</ul>
	</nav>



</body>
</html>





