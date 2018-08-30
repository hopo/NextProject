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


<title>
	<sitemesh:write property='title' />
</title>

<script src="<c:url value="/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.min.css"/>">

<link rel="icon" href="<c:url value="/images/favicon.ico"/>" type="image/x-icon" />

<!-- // ;;추가 할 수도 있는 css -->
<!--
<link rel="stylesheet" href="<c:url value="/css/signin.css"/>">
<link rel="stylesheet" href="<c:url value="/css/nextit.css"/>">
-->

<sitemesh:write property='head' />
</head>


<body>
	<c:import url="/decorator/inc/index.navigation.jsp" />

	<div class="container">
		<div id="body-top" class="blog-header">
			<div lass="blog-title" style="color:tomato; font-size:3em;">
				<sitemesh:write property='title' />
			</div>
			<!-- <p class="lead blog-description">"there is no meaning"</p> -->
		</div>
		<hr>
		<sitemesh:write property='body' />
		<hr>
	</div>

	<!-- // ;필요시 푸터 사용 -->
	<%--
	<c:import url="/decorator/inc/index.footer.jsp" />
	--%>
</body>
</html>
