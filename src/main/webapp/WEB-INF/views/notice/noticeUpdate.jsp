<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
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
<!-- Core theme JS-->
<script src="${ pageContext.servletContext.contextPath }/resources/js/scripts.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/common/loginSession.jsp" />
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="page-section cta">
	    <div class="container">
	        <div class="row">
	        	<form action="nupdate.do" method="post">
		            <div class="col-xl-9 mx-auto">
		            <h2 align="center">${notice.notice_no}번 공지글 수정 페이지</h2><br>
		                <div class="cta-inner bg-faded text-center rounded">
<!-- =============================================================================== -->
							<input type="hidden" name="notice_no" value="${notice.notice_no }">
							
							<table align="center" width="100%" cellspacing="0" cellpadding="10">
								<tr><th>제     목</th><td><input class="form-control" type="text" name="notice_title" value="${notice.notice_title }" required></td></tr>
								<tr><th>작 성 자</th><td><input class="form-control" type="text" value="${notice.user_id}" readonly></td></tr>
								<tr><th>내     용</th><td><textarea class="form-control" name="notice_content" rows="5" cols="50" required>${notice.notice_content }</textarea></td></tr>
							</table>
<!-- =============================================================================== -->
						</div>
						<br>
						<div align="right">
							<input style="background-color: white;" class="btn btn-primary btn-block" type="submit" value="수정하기"> &nbsp;
							<input style="background-color: white;" class="btn btn-primary btn-block" type="reset" value="수정취소"> &nbsp;
							<button style="background-color: white;" class="btn btn-primary btn-block" onclick="javascript:history.go(-1);return false;">이전페이지로 이동</button>
							<!-- return false로 이벤트 전달 막음 -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
