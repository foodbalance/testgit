<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>3차 프로젝트 1조</title>
<link rel="icon" type="image/x-icon"
	href="${ pageContext.servletContext.contextPath }/resources/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${ pageContext.servletContext.contextPath }/resources/css/styles.css"
	rel="stylesheet" />
</head>

<style>
.bubble {
	position: relative;
	width: 100%;
	height: 12%;
	padding: 0px;
	background: #FFFF;
	-webkit-border-radius: 31px;
	-moz-border-radius: 31px;
	border-radius: 31px;
	border: #E19600 solid 5px;
}

.bubble:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 24px 44px;
	border-color: #FFFF transparent;
	display: block;
	width: 0;
	z-index: 1;
	top: -44px;
	left: 50%;
}

.bubble:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 28px 48px;
	border-color: #E19600 transparent;
	display: block;
	width: 0;
	z-index: 0;
	top: -53px;
	left: 49%;
}
</style>

<body>
	<c:import url="/WEB-INF/views/common/loginSession.jsp" />
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="page-section cta">
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<div class="cta-inner bg-faded text-center rounded">
						<div class="row">
							<div class="col-xl-9 mx-auto">
								<div class="cta-inner bg-faded text-center rounded">
									<img
										src="${ pageContext.servletContext.contextPath }/resources/static/img/img1.png">
									<!-- 세션 만료 안내 -->
									<c:set var="e" value="${ message }" />
									<c:if test="${ !empty e }">
										<h3 class="bubble site-heading-upper text-primary mb-3">${ message }</h3>
									</c:if>

									<!-- 비밀번호 찾기 완료, 가입, 탈퇴 안내-->
									<c:set var="m" value="${ user_pwd }" />
									<c:if test="${ !empty m }">
										<h2 class="bubble site-heading-upper text-primary mb-3">${ pwd }</h2>
									</c:if>
									<c:set var="m2" value="${ register }" />
									<c:if test="${ !empty m2 }">
										<h2 class="bubble site-heading-upper text-primary mb-3">${ register }</h2>
									</c:if>
									<c:set var="m3" value="${ userdel }" />
									<c:if test="${ !empty m3 }">
										<h2 class="bubble site-heading-upper text-primary mb-3">${ userdel }</h2>
									</c:if>
									<div class="form-floating mb-3">
										<input class="btn btn-primary btn-block" type="button" onclick="javascript:history.go(-1); return false;" value="이전 페이지로"> 
										<input class="btn btn-primary btn-block" type="button" onclick="location.href='main.do'" value="홈으로 이동하기">
										<!-- <button type="submit" class="btn btn-primary btn-block">회원가입</button>
                                   <button type="reset" class="btn btn-primary btn-block">작성취소</button> -->

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
>
