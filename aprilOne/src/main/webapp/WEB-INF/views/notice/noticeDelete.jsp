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
	${param.ntcIdx}
	<c:url value='/notice/noticeDeleteProc' var='notice/noticeDeleteProcUrl'>
		<c:param value='${param.ntcIdx}' name='ntcIdx' />
	</c:url>
	<button class="btn btn-danger"><a href="${noticeDeleteProcUrl}">삭제</a></button>
	<button class="btn btn-secondary"><a href="<c:url value='/notice/noticeList' />">취소</a></button>
</body>
</html>
