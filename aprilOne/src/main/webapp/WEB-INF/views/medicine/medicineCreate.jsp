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
<title>약품 등록</title>
</head>
<body>


	<form class="form-horizontal" action="<c:url value='/medicine/medicineCreateProc' />" method="POST">
		<table class="table">
			<tbody>
				<tr>
					<th>의약품코드 </th>
					<td><input type="text" name="medCode" class="form-control" ></td>
				</tr>
				<tr>
					<th>입고일</th>
					<td><input type="date" name="medStoredate" class="form-control" ></td>
				</tr>
				<tr>
					<th>폐기일</th>
					<td><input type="date" name="medDisusedate" class="form-control" ></td>
				</tr>
				<tr>
					<th>재고 수량 </th>
					<td><input type="text" name="medAmt" class="form-control"></td>
				</tr>
				<tr>
					<th>의약품 주의사항</th>
					<td><textarea name="medMemo" class="form-control" cols="40" rows="5"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-lg btn-primary btn-block" type="submit">약품등록</button>
					</td>
				</tr>
				
			</tbody>
		</table>
	</form>	 

</body>
</html>
















