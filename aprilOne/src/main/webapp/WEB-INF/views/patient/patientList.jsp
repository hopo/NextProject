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

	<title>patient List</title>
</head>

<body>
	<!-- // Search Part -->
	<table class="table table-bordered">
		<tr>
			<th>SearchType</th>
			<td>
				<select>
					<option value="sel1">이름</option>
					<option value="sel2">환자코드</option>
					<option value="sel3">보험코드</option>
					<option value="sel4">전화번호</option>
				</select>
			</td>
			<td>
				<input placeholder="입력하세요..." />
			</td>
			<td>
				<button id="searchsubmit" type="submit" class="btn btn-primary">검색</button>
			</td>
		</tr>
	</table>



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
				<tr>
					<td><a href="<c:url value='/patient/patientView' />">PAT-00${i.patCode}</a></td>
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





