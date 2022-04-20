<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:import url="/WEB-INF/views/common/loginSession.jsp" />
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">인기고양이 등록 페이지</h2>
<br>
<!-- form에서 입력된 값들과 첨부파일을 같이 전송하려면, 반드시 enctype 속성을 추가해야 함
	 enctype="multipart/form-data" 값을 지정해야 함 -->
<!-- 관리자용  -->
<c:if test="${ loginMember.admin_ok eq 'Y' }">
<form action="finsert.do" method="post" enctype="multipart/form-data">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr><th>고양이 이름</th><td><input type="text" name="cat_name"></td></tr>
	<tr><th>작성자</th><td><input type="text" name="user_id" 
								readonly value="${ loginMember.user_id }"></td></tr>
	<tr><th>이미지</th><td><input type="file" name="upfile"></td></tr>
	<tr><th>상세 설명</th><td><textarea name="cat_explain" rows="5" cols="50"></textarea></td></tr>
	<tr><td colspan="2">
		<input type="submit" value="등록하기"> &nbsp;
		<input type="reset" value="작성취소"> &nbsp;
		
		
		<button onclick="javascript:history.go(-1); return false;">목록</button></td></tr>
</table>
</form>
</c:if>
<br>
<hr>
<%-- <c:import url="/WEB-INF/views/common/footer.jsp" /> --%>
</body>
</html>