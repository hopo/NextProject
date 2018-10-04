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
<title>삭제</title>
</head>

<body>
	<div>${param.ntcIdx}번 글을 삭제 하겠습니까 ? </div>

	<c:url value='/notice/noticeDeleteProc' var='noticeDeleteProcUrl'>
		<c:param value='${param.ntcIdx}' name='ntcIdx' />
	</c:url>

	<a href="${noticeDeleteProcUrl}" class="btn btn-danger">삭제</a>
	<a href="<c:url value='/notice/noticeList' />" class="btn btn-default">취소</a>
</body>
</html>
