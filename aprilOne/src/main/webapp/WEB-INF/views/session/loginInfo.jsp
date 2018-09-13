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
<title>접속자 정보</title>
</head>

<body>
	<table class="table">
		<tr>
			<th>접속자 직원 아이디</th>
			<th>접속자 직원 이름</th>
			<th>접속자 직원 직책분류</th>
			<th>접속자 직원 직책이름</th>
		</tr>
		<tr>
			<td>${loginInfo.empId}</td>
			<td>${loginInfo.empName}</td>
			<td>${loginInfo.empDiv}</td>
			<td>${loginInfo.empDivname}</td>
		</tr>
	</table>
	
	<strong>"${loginInfo.empName}"님 이전 접속정보</strong>
	<a href="#" class="btn btn-info btn-xs">상세보기</a> // 난주 ajax로 보여주는거롤 하면 어떨까
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>로그인 시간</th>
				<th>로그아웃 시간</th>
			</tr>
			<c:forEach var="item" items="${result}">
				<tr>
					<td>${item.logLogindate}</td>
					<td>${item.logLogoutdate}</td>
				</tr>
			</c:forEach>
		</thead>
		<tbody>
			
		</tbody>
	</table>
</body>
</html>























