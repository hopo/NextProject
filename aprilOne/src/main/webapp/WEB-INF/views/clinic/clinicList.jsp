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
<title>진료 리스트</title>
</head>

<body>
	<table class="table">
		<thead>
			<tr>
				<th>진료코드</th>	<!-- clnCode -->
				<th>환자코드</th>	<!-- patCode -->
				<th>담당의</th>	<!-- empId -->
				<th>진료일</th>	<!-- clnDate -->
				<th>진료내용</th>	<!-- clnDescr -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${result}">
				<c:url value="clinicView" var="clinicViewUrl">
					<c:param name="clnCode" value="${item.clnCode}" />
					<%-- <c:param name="curPage" value="${search.curPage}" /> --%>
				</c:url>
 				<tr>
					<td><a href="<c:url value='${clinicViewUrl}'/>">${item.clnCode}</a></td>
					<td>${item.patCode}</td>
					<td>${item.empId}</td>
					<td>${item.clnDate}</td>
					<td>${item.clnDescr}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
