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
	"//의사만 접근 가능할 예정"
	<form class="form-horizontal" action="<c:url value='/clinic/clinicCreateProc' />" method="POST">
		<table class="table">
			<tbody>
				<tr>
					<th>진료코드(6)</th>
					<td>
						// 서버에서 자동 생성
						<input name="clnCode" class="form-control" placeholder="진료코드" required autofocus value="c00021">
				</td>
				</tr>
				<tr>
					<th>환자코드(6)</th>
					<td>
						// 환자이름 or 환자코드 를 검색하여 입력
						<input name="patCode" class="form-control" placeholder="환자코드" required value="p90149">
					</td>
				</tr>
				<tr>
					<th>담당의(의사-접속맨)</th>
					<td>
						${loginInfo.empId}
						<input type="hidden" name="empId" class="form-control" required value="${loginInfo.empId}">
					</td>
				</tr>
				<tr>
					<th>진료내용</th>
					<td>
						<textarea name="clnDescr" class="form-control" rows="4" cols="50" placeholder="진료내용" required></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-lg btn-primary btn-block" type="submit" value="">진료등록</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>	 
</body>
</html>






