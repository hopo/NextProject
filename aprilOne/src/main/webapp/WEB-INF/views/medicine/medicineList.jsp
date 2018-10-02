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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>의약품 목록</title>
</head>
<body>

	<!-- 검색  -->
	<!-- // ;Search Part -->
	<table>
		<tr>
			<th>검색타입</th>
			<td>
				<select path="searchType" class="btn btn-default">
					<option value="med_code">의약품코드</option>
					<option value="med_name">의약품이름</option>
				</select>
			</td>
			<td>
				<input path="searchText" placeholder="입력하세요..." class="form-control" />
			</td>
			<td>
				<button id="searchSubmit" type="submit" class="btn btn-primary btn-sm">검색</button>
			</td>
		</tr>
	</table>
	
	<!-- 검색테이블 -->
	<table class="table table-bordered table-hover">
		<thead class="bg-primary">
			<tr>
				<th>의약품코드</th>
				<th>의약품이름</th>
				<th>입고일</th>
				<th>폐기일</th>
				<th>재고 수량</th>
				<th>의약품 주의사항</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${medList}" >
				<tr>
					<td>${i.medCode}</td>
					<td>${i.medCodename}</td>
					<td>${i.medStoredate}</td>
					<td>${i.medDisusedate}</td>
					<td>${i.medAmt}</td>
					<td>${i.medMemo}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a class="btn btn-primary" href="<c:url value='/medicine/medicineCreate' />">의약품등록</a>
	
	<!-- 페이지 -->
	<!-- // ;;기능 코드 -->
</body>
</html>
