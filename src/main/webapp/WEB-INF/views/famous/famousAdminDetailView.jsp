<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>3차 프로젝트 1조</title>
<link rel="icon" type="image/x-icon" href="${ pageContext.servletContext.contextPath }/resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
   href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet" />
<link
   href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
   rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${ pageContext.servletContext.contextPath }/resources/css/styles.css" rel="stylesheet" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 절대경로로 대상 파일의 위치를 저장한 경우 -->
<c:import url="/WEB-INF/views/common/loginSession.jsp" />
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<c:if test="${ loginMember.admin_ok eq 'Y' }">
<h2 align="center">${ famous.register_num } 인기고양이 정보 상세보기(관리자용)</h2>
<br>
<table align="center" width="800" border="1" cellspacing="0" cellpadding="5">
	<tr><th>고양이 종류</th><td>${ famous.cat_name }</td></tr>
	<tr><th>작성자</th><td>${ famous.user_id }</td></tr>
	<tr><th>첨부파일</th>
		<td>
			<c:if test="${ !empty famous.cat_original_img }"> <!-- 첨부파일이 있다면 다운로드 요청 설정함 -->
				<c:url var="ffd" value="/ffdown.do">
					<c:param name="ofile" value="${ famous.cat_original_img }" />
					<c:param name="rfile" value="${ famous.cat_rename_img }" />
				</c:url>
				<a href="${ ffd }">${ famous.cat_original_img }</a>
			</c:if>
			<c:if test="${ empty famous.cat_original_img }"> <!-- 첨부파일이 없다면 다운로드 요청 설정함 -->
			&nbsp;
			</c:if>
		</td>
	</tr>
	<tr><th>내  용</th><td>${ famous.cat_explain }</td></tr>
	<tr><td colspan="2">
		<button onclick="javascript:history.go(-1);">목록</button> &nbsp;
		<!-- 수정페이지로 이동하는 버튼 추가 -->
		<c:url var="fup" value="/fupview.do">
			<c:param name="register_num" value="${ famous.register_num }"></c:param>
		</c:url>
		<button onclick="javascript:location.href='${ fup }';">수정페이지로 이동</button>
		<!-- 삭제하기 버튼 -->
		<c:url var="fdel" value="/fdel.do">
			<c:param name="register_num" value="${ famous.register_num }"></c:param>
			<c:if test="${ !empty famous.cat_original_img }">
				<c:param name="rfile" value="${ famous.cat_rename_img }" />
			</c:if>
		</c:url>
		<button onclick="javascript:location.href='${ fdel }';">글삭제</button>
	</td></tr>
</table>
</c:if>
<br>
<hr>
</body>
</html>