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
				<p><img src="<c:url value='/images/favicon01.ico' />" height="28">&nbsp;&nbsp;&nbsp;에이프릴 Clinic</p>
			</a>
		</div>
		
			<!-- // !!!네비게이션 우측 -->
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${loginInfo ne null}">
						
					
		
						<!-- // 메뉴들 -->
						<a class="btn btn-danger" href="<c:url value='/patient/patientList' />">환자 목록</a>
						<a class="btn btn-danger" href="<c:url value='/patient/patientCreate' />">환자 등록</a>
						|
						<a class="btn btn-warning" href="<c:url value='/clinic/clinicList' />">진료 목록</a>
						<a class="btn btn-success" href="<c:url value='/prescription/prescriptionList' />">처방전 목록</a>
						<a class="btn btn-primary" href="<c:url value='/medicine/medicineList' />">의약품 목록</a>
						|
						<a class="btn btn-default" href="<c:url value='/notice/noticeList' />">직원 게시판</a>
						|

						<c:if test="${loginInfo.empDiv eq 'A'}">
							<!-- // !!직원 관리 드랍다운 -->
							<span class="dropdown">
								<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu-employee" data-toggle="dropdown" aria-expanded="true">
									<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
									관리
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-employee">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/employee/employeeList' />">직원 목록</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/employee/employeeCreate' />">직원 등록</a></li>
									<li role="presentation" class="divider"></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/medicine/medicineCreate' />">의약품 등록</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">#의약품 거래처</a></li>
								</ul>
							</span>
						</c:if>
						
						
						<!-- // !!로그인/아웃 버튼(드랍다운) -->
						<!-- // ;;;로그인인포가 없을 시 -->
						<c:if test="${loginInfo eq null}">
							<span><a class="btn btn-default" href="<c:url value='/session/login' />">로그인</a></span>
							<<!-- span><a class="btn btn-default" data-toggle="modal" data-target="#login-modal">Login</a></span> -->
						</c:if>
						<!-- // ;;;로그인인포가 있을 시 -->
						<c:if test="${loginInfo ne null}">
							<span class="dropdown">
								<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu-session" data-toggle="dropdown" aria-expanded="true">
									<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
									${loginInfo.empId} (${loginInfo.empDiv})
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-session">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/session/loginInfo' />">접속정보</a></li>
									<c:url value='/employee/employeeEdit' var='employeeEditUrl'>
										<c:param name="empId" value="${loginInfo.empId}" />
									</c:url>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="${employeeEditUrl}">정보수정</a></li>
									<li role="presentation" class="divider"></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/session/logout' />">로그아웃</a></li>
							 	</ul>
						 	</span>
						</c:if>
	
					</c:if>
				</ul>
			</div>
		
	</div>
</nav>















