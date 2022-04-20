<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
		<!-- 비로그인한 경우 -->
    	<c:if test="${ empty loginMember }">
	    <div align="right">
	    	<a style="padding:10px;" class="btn btn-primary btn-block" href="loginPage.do">로그인</a>
	    	<a style="padding:10px; margin:10px;" class="btn btn-primary btn-block" href="registerPage.do">회원가입</a>
	    </div>
	    </c:if>
	    
	    <!-- 로그인한 경우 : 일반회원인 경우 -->
		<c:if test="${ !empty loginMember and loginMember.admin_ok ne 'Y' }"> 
			<div align="right">
				<a style="padding:10px; color:white;">${ sessionScope.loginMember.user_name }님</a>
				<c:url var="callMyInfo2" value="myinfo.do">
					<c:param name="user_id" value="${ loginMember.user_id }" />
				</c:url>
				<a style="padding:10px; margin:0px;" class="btn btn-primary btn-block" href="${ callMyInfo2 }">My Page</a>
				<button style="padding:10px; margin:10px;" class="btn btn-primary btn-block" onclick="javascript:location.href='logout.do';">로그아웃</button>
			</div>
		</c:if>
		<!-- 로그인한 경우 : 관리자인 경우 -->
		<c:if test="${ !empty loginMember and loginMember.admin_ok eq 'Y' }"> 
			<div align="right">
				<a style="padding:10px; color:white;">관리자(${ sessionScope.loginMember.user_name })님</a>
				<c:url var="callMyInfo" value="myinfo.do">
					<c:param name="user_id" value="${ loginMember.user_id }" />
				</c:url>
				<a style="padding:10px; margin:0px;" class="btn btn-primary btn-block" href="${ callMyInfo }">My Page</a>
				<button style="padding:10px; margin:10px;" class="btn btn-primary btn-block" onclick="javascript:location.href='logout.do';">로그아웃</button>
			</div>
		</c:if>
</body>
</html>