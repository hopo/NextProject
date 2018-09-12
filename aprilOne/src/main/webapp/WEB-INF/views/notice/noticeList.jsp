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

<title>게시판</title>
<script type="text/javascript" defer="defer">
$(document).ready(function(){	
	
	$frm = $('#NoticeSearchVo');
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

	<div class="row">

		<div class="col-sm-12 blog-main">
			<blockquote>
				
				<form:form commandName="NoticeSearchVo" method="post">
					<form:hidden path="curPage" />
					<form:hidden path="screenSize" />
					<table class="table">
						<tr>
							<th>조회 조건 (Search) : 타입</th>
							<td>
								<form:select path="searchType" >
									<form:option value="title"> 제목 </form:option>
									<form:option value="reg_user"> 작성자 </form:option>
								</form:select>
							</td>
							<td>
								<form:input path="searchText" />
							</td>
							<td>
								<button type="submit">검색</button>
							</td>
						</tr>
					</table>
				</form:form>



	<table class="table">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>글 제목</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>수정일</th>
				<th>직원 ID</th>
				<!-- <th>del여부</th> -->
			</tr>
		</thead>

		<tbody>

			<c:forEach var="item" items="${result}">
				<c:url var="viewUrl" value="/notice/noticeView">
					<c:param name="ntcIdx" value="${item.ntcIdx }" />
				</c:url>

				<c:if test="${item.ntcDelat eq 'F'}">
					<tr>
						<td><a href="${viewUrl}"> ${item.ntcIdx } </a></td>
						<td><a href="${viewUrl}">${item.ntcTitle } </a></td>
						<td>${item.ntcCount }</td>
						<td>${item.ntcRegdate }</td>
						<td>${item.ntcUpdate }</td>
						<td>${item.empId }</td>
						<%-- <td>${item.ntcDelat }</td> --%>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<td colspan="2"><a href="<c:url value='/notice/noticeForm' />">글작성</a>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
