<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="listCount" value="${ requestScope.listCount }"/>
<c:set var="startPage" value="${ requestScope.startPage }"/>
<c:set var="endPage" value="${ requestScope.endPage }"/>
<c:set var="maxPage" value="${ requestScope.maxPage }"/>
<c:set var="currentPage" value="${ requestScope.currentPage }"/>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>3차 프로젝트 1조</title>
<style type="text/css">
form.sform {
	display: none;
	background: lightborwn;
}
</style>
<link rel="icon" type="image/x-icon"
	href="${ pageContext.servletContext.contextPath }/resources/assets/favicon.ico" />
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

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script
	src="${ pageContext.servletContext.contextPath }/resources/js/scripts.js"></script>
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//jQuery 로 이벤트 처리 : 검색 from 을 보이게 안보이게 처리함
	/**
	 * jQuery(document.ready(){}); => 이페이지가 브라우저에 읽어들이기가 완료되면 {}안의 내용이 자동 실행됨
	 jQuery 는 $ 로 표기해도 됨. 위의 구문은 줄여서 $(function(){}); 사용해도 됨
	 => 자바스크림트로는 window.onload = function(){};
	 */
	$(function() {
		//작성된 이벤트 처리 코드는 실행 대기 상태가 됨
		//jQuery("태그선택자").실행할메소드(전달값, ...);
		$("input[name=item]").on("change", function() {
			//change 이벤트가 발생한 radio 와 연결된 폼만 보이게하고, 나머지 폼들은 안보이게 처리함
			$("input[name=item]").each(function(index) {
				//해당 index 번째 radio 가 checked 인지 확인하고
				if ($(this).is(":checked")) {
					$("form.sform").eq(index).css("display", "block");
				} else {
					$("form.sform").eq(index).css("display", "none");
				}
			});
		});

	});

	//로그인 가능/제한 라디오 체크를 변경했을 때 실행되는 함수임
	function changeLogin(element) {
		//선택한 radio의 name 속성의 이름에서 user_id 분리 추출함
		var user_id = element.name.substring(8);
		console.log("changeLogin : " + user_id);
		if (element.checked == true && element.value == "false") {
			//로그인 제한을 체크했다면
			console.log("로그인 제한 체크함");
			location.href = "${ pageContext.servletContext.contextPath }/loginok.do?user_id="
					+ user_id + "&login_ok=N";
		} else {
			console.log("로그인 제한 해제함");
			location.href = "${ pageContext.servletContext.contextPath }/loginok.do?user_id="
					+ user_id + "&login_ok=Y";
		}
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/loginSession.jsp" />
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="page-section clearfix"></section>
	<section class="page-section cta">
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
				<h1 align="center">회원 관리 페이지</h1>
						<br>
					<div class="cta-inner bg-faded text-center rounded">
						
						<!-- 조회해 온 리스트 정보 출력 -->
						<table align="center" cellspacing="0" cellpadding="10">
							<tr>
								<th>아이디</th>
								<th>이 름</th>
								<th>생년월일</th>
								<th>전화번호</th>
								<th>주 소</th>
								<th>키워드</th>
							</tr>
							<c:forEach items="${ requestScope.list }" var="m">
								<tr>
									<td>${ m.user_id }</td>
									<td>${ m.user_name }</td>
									<td>${ m.user_birth }</td>
									<td>${ m.phone }</td>
									<td>${ m.address }</td>
									<td>${ m.keyword }</td>
									<td>
										<c:if test="${ m.login_ok eq 'Y' }">
										<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);" value="true" checked> 가능 &nbsp;
           								<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);" value="false"> 제한
       									</c:if> 
       									<c:if test="${ m.login_ok eq 'N' }">
										<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);" value="true"> 가능 &nbsp;
            							<input type="radio" name="loginok_${ m.user_id }" onchange="changeLogin(this);" value="false" checked> 제한
         								</c:if>
       								</td>
								</tr>
							</c:forEach>
						</table>
						<br>
						<c:import url="/WEB-INF/views/common/mpaging.jsp" />
					<center>
							<!-- 항목별 검색기능 -->
							<fieldset id="ss">
								<legend>검색할 항목을 선택하세요.</legend>
								<input  type="radio" name="item" id="user_id">회원 아이디
								&nbsp; <input type="radio" name="item" id="ulogok">로그인제한
								&nbsp;
							</fieldset>
							<!-- 회원 아이디로 검색 폼 -->
							<form
								action="${ pageContext.servletContext.contextPath }/msearch.do"
								method="post" , id="idform" class="sform">
								<input type="hidden" name="action" value="user_id">
								<fieldset>
									<br>
									<legend>검색할 아이디를 입력하세요.</legend>
									<input type="search" name="keyword"> &nbsp; 
									<input style="background-color: white;" class="btn btn-primary btn-block" type="submit" value="검색">
								</fieldset>
							</form>
							
							<!-- 로그인제한으로 검색 폼 -->
							<form action="${ pageContext.servletContext.contextPath }/loginsearch.do" method="post" id="lokform" class="sform">
								<input type="hidden" name="action" value="loginok">
								<fieldset>
									<br>
									<legend>검색할 로그인 제한/가능을 선택하세요.</legend>
									<input type="radio" name="keyword" value="Y"> 로그인 가능 회원 &nbsp; 
									<input type="radio" name="keyword" value="N"> 로그인 제한 회원 &nbsp; 
									<input style="background-color: white;" class="btn btn-primary btn-block" type="submit" value="검색">
								</fieldset>
							</form>
							<br>
							<button style="background-color: white;" class="btn btn-primary btn-block" onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/mlist.do;'">전체
								보기</button>
						</center>
				</div>
			</div>
		</div>
	</section>
	<footer class="footer text-faded text-center py-5">
		<div class="container">
			<p class="m-0 small">Copyright &copy; Your Website 2021</p>
		</div>
	</footer>