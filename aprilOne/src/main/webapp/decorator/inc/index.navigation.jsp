<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">

		<!-- // !!!네비게이션 좌측 -->
		<div class="navbar-header">
			<!--
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
  			-->

			<a class="navbar-brand" href="<c:url value='/index'/>">
				<p><img src="<c:url value='/images/favicon.ico' />" height="28">&nbsp;&nbsp;&nbsp;에이프릴 Clinic</p>
			</a>
		</div>
		
		<!-- // !!!네비게이션 우측 -->
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
			
				<!-- // !!진료 드랍다운 -->
				<span class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu-clinic" data-toggle="dropdown" aria-expanded="true">
						진료
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-clinic">
						<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/clinic/clinicList' />">진료리스트</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/clinic/clinicCreate' />">진료등록</a></li>
					</ul>
				</span>

				<!-- // !!환자 드랍다운 -->
				<span class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu-patient" data-toggle="dropdown" aria-expanded="true">
						환자
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-patient">
						<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/patient/patientList' />">환자리스트</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/patient/patientCreate' />">환자등록</a></li>
				  </ul>
				</span>
			
				<!-- // !!직원 드랍다운 -->
				<span class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu-employee" data-toggle="dropdown" aria-expanded="true">
						직원
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-employee">
						<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/employee/employeeList' />">직원리스트</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/employee/employeeCreate' />">직원등록</a></li>
					</ul>
				</span>
			
				<!-- // !!게시판 버튼 -->
				<span><a class="btn btn-default" href="<c:url value='/notice/noticeList' />">게시판</a></span>
			
				<!-- // !!로그인/아웃 버튼(드랍다운) -->
				<c:if test="${loginInfo eq null}">
					<span><a class="btn btn-default" href="<c:url value='/session/login' />">로그인</a></span>
				</c:if>
				<c:if test="${loginInfo ne null}">
					<span class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu-session" data-toggle="dropdown" aria-expanded="true">
						<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
						${loginInfo.empId}	
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-session">
						<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/session/loginInfo' />">접속정보</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/session/logout' />">로그아웃</a></li>
				 	</ul>
				</c:if>


				<!-- // ;;;아래는 이전 메뉴입니다 -->
				<span class="navbar-brand">|</span>
				<a class="navbar-brand" href="#">처방조회</a>
				<a class="navbar-brand" href="#">약품재고</a>
				<a class="navbar-brand" href="#">약품등록</a>
				<span class="navbar-brand">|</span>
				<a class="navbar-brand" href="#">매출조회</a>
				<a class="navbar-brand" href="#">미수환불</a>
				<span class="navbar-brand">|</span>
			</ul>
		</div>

	</div>
</nav>















