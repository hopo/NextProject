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
<title>진료 등록</title>
</head>

<body>
	<form class="form-horizontal" action="<c:url value='/clinic/clinicCreateProc' />" method="POST">
		<table class="table">
			<tbody>
				<tr>
					<th>환자이름(환자코드)</th>
					<td>
						<c:if test="${param.patCode ne null}">
							${param.patName} (${param.patCode})
						</c:if>

						<input type="hidden" name="patCode" id="patCode" required value="${param.patCode}"> <!-- null상태서 서브밋 하면 에러터짐 -->
						<c:if test="${param.patCode eq null}">
							<a class='btn btn-primary btn-xs' href="<c:url value='/patient/patientList' />">환자검색</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>담당의</th>
					<td>
						${loginInfo.empName} (${loginInfo.empId})
						<input type="hidden" name="empId" class="form-control" required value="${loginInfo.empId}">
					</td>
				</tr>
				<tr>
					<th colspan="2">진료내용</th>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="clnDescr" class="form-control" rows="4" cols="50" placeholder="진료내용" require></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<button class="btn btn-primary" type="submit" value="">진료등록</button>
	</form>	 

</body>
</html>





