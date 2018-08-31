<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<!--
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
  			-->
			<a class="navbar-brand" href="/index">
				<p>
					<img src="/images/favicon.ico" height="28">&nbsp;&nbsp;&nbsp;AprilClinic
				</p>
			</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><span class="navbar-brand">|</span></li>
				<li><a class="navbar-brand" href="<c:url value='/patient/patientList' />">환자조회</a></li>
				<li><a class="navbar-brand" href="<c:url value='/patient/patientCreate' />">환자등록</a></li>
				<li><span class="navbar-brand">|</span></li>
				<li><a class="navbar-brand" href="#">진료조회</a></li>
				<li><a class="navbar-brand" href="#">진료</a></li>
				<li><a class="navbar-brand" href="#">처방조회</a></li>
				<li><span class="navbar-brand">|</span></li>
				<li><a class="navbar-brand" href="#">약품재고</a></li>
				<li><a class="navbar-brand" href="#">약품등록</a></li>
				<li><span class="navbar-brand">|</span></li>
				<li><a class="navbar-brand" href="#">매출조회</a></li>
				<li><a class="navbar-brand" href="#">미수환불</a></li>
				<li><span class="navbar-brand">|</span></li>
				<li><a class="navbar-brand" href="<c:url value='/notice/noticeList' />">공지사항</a></li>
				<li><span class="navbar-brand">|</span></li>
				<li><a class="navbar-brand" href="#">접속정보</a></li>
				<li><a class="navbar-brand" href="<c:url value='/session/login' />">로그아웃</a></li> <!-- ;;;임시로 로그인으로 링크-->
				<li><span class="navbar-brand">|</span></li>
			</ul>
		</div>
	</div>
</nav>
