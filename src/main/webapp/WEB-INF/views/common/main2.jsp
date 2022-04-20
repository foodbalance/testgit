<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<style type="text/css">
div.lineA {
	height: 180px;
	border: 1px solid gray;
	float: left;
	position: relative;
	margin: 5px;
	padding: 5px;
	background-color: #b88645;
	border: 1px solid #ced4da;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0.25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

div#banner {
	width: 70%;
	padding: 0;
}

div#banner img {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}

div#loginBox {
	width: 25%;
	font-size: 9pt;
	float: right;
	color: black;
	text-align: left;
	padding-left: 20px;
	background-color: #f6e1c5;
	border: 1px solid #ced4da;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0.25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

div#loginBox button {
	width: 80%;
	height: 25%;
	background-color: #e6a756;
	color: white;
	margin-top: 10px;
	maegin-bottom: 15px;
	font-size: 14pt;
	font-weigth: bold;
	border: 1px solid #ced4da;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0.25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

section {
	position: relative;
	left: 10%;
	
}

section>div {
	width: 30%;
	background: #f6e1c5;
	border-radius: 0.25rem;
	
}

section div table {
	width: 98%;
	background: white;
	margin: 0 0 0 1%;
	border-radius: 0.5rem;
	border: 1px solid #ced4da;
	text-align: center;
}
<!----------------------------------------------------------------------->

</style>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>3차 프로젝트 1조</title>
<!-- --------------웹 스타일 링크----------------------------------- -->
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
<!-- ----------------------------------------------------------------------------------------- -->

<script
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 주기적으로 자동 실행되게 하려면 자바스크립트 내장함수 setInterval(실행시킬함수명, 시간간격밀리초) 사용하면 됨*/
		/* setInterval(function(){
		 console.log("setInterval() 에 의해 자동 실행 확인.");
		 }, 100); */

		//최근 등록한 공지글 3개 출력되게 함
		 $.ajax({
			url: "ntop3.do",
			type: "post",
			dataType: "json",
			success: function(data){
				console.log("success : " + data);  //Object 로 받아짐
				
				//object => string 으로 바꿈
				var jsonStr = JSON.stringify(data);
				//string => json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				var values = "";
				for(var i in json.list){  //i(인덱스) 변수가 자동으로 1씩 증가 처리됨
					values += "<tr><td>" + json.list[i].notice_no 
							+ "</td><td><a href='ndetail.do?notice_no=" + json.list[i].notice_no + "'>"
							+ decodeURIComponent(json.list[i].notice_title).replace(/\+/gi, " ") 
							+ "</a></td><td>" + json.list[i].notice_date + "</td></tr>";
				}  //for in
				
				$("#newnotice").html($("#newnotice").html() + values);
			},
			error: function(jqXHR, textstatus, errorthrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
			}
		});  //ajax

		//조회수 많은 인기 게시 원글 상위 3개 조회 출력처리
		$.ajax({
			url : "btop3.do",
			type : "post",
			dataType : "json",
			success : function(data) {
				console.log("success : " + data); //Object 로 받아짐

				//object => string 으로 바꿈
				var jsonStr = JSON.stringify(data);
				//string => json 객체로 바꿈
				var json = JSON.parse(jsonStr);

				var values = "";
				for ( var i in json.list) { //i(인덱스) 변수가 자동으로 1씩 증가 처리됨
					values += "<tr><td>"
							+ json.list[i].board_no
							+ "</td><td><a href='bdetail.do?board_no="
							+ json.list[i].board_no
							+ "'>"
							+ decodeURIComponent(json.list[i].board_title)
									.replace(/\+/gi, " ") + "</a></td><td>"
							+ json.list[i].board_readcount + "</td></tr>";
				} //for in

				$("#toplist").html($("#toplist").html() + values);
			},
			error : function(jqXHR, textstatus, errorthrown) {
				console.log("error : " + jqXHR + ", " + textstatus + ", "
						+ errorthrown);
			}
		}); //ajax

	}); //document.ready

	function movePage() {
		location.href = "loginPage.do";
	}
	function moveRegister() {
		location.href = "registerPage.do";
	}
</script>
</head>
<body>

	<c:import url="/WEB-INF/views/common/loginSession.jsp" />
	<c:import url="/WEB-INF/views/common/menubar.jsp" />

<section class="page-section cta">
	<div class="container">
	    <div class="row">
	        <div class="col-xl-9 mx-auto">
	            <div class="cta-inner bg-faded text-center rounded">
					<center>
						<!-- 배너이미지 표시 -->
						<div id="banner" class="lineA">
							<img
								src="${ pageContext.servletContext.contextPath }/resources/static/img/banner3.jpg">
						</div>
				
						<c:if test="${ empty loginMember }">
							<!-- 로그인 안했을 때 -->
							<form action="login.do" method="post">
								<div id="loginBox" class="lineA" align="right">
									<img  style="display:inline" width="25px" height="25px" src="${ pageContext.servletContext.contextPath }/resources/static/img/cimg6.png">
									<h7 style="display:inline">냥덕쓰의 방문을 환영합니다.</h7>
									<input class="form-tac1" type="text" id="inputID" name="inputID" value="${ reid }" placeholder="아이디 입력"> 
									<input class="btn btn-primary btn-block" type="submit" 
									style="float: right; height: 51%; width: 25%; background-color: #e6a756; text-align: center; margin: 5px 0;"
										value="로그인"><br> 
									<input id="inputPassword" class="form-tac2" type="password" 
									name="inputPassword" value="${ repwd }" placeholder="비밀번호 입력"> <br> 
									<input class="form-check-input" id="inputRemember" type="checkbox"
										value="Remember" name="inputRemember" checked /> 
										<label style="text-align: left" class="form-check-label"
										for="inputRemember">아이디, 비밀번호 저장</label>
				
									<div align="right" class="form-check mb-3">
										<button class="btn btn-primary btn-block"
											style="float: center; height: 10%; width: 48%; background-color: #e6a756; color:black; text-align: center; font-size: 6pt; font-weigth: bold;"
											onclick="">아이디/비밀번호 조회</button>
										&nbsp; &nbsp;
										<button class="btn btn-primary btn-block"
											style="float: center; height: 10%; width: 25%; background-color: #e6a756; color:black; text-align: center; font-size: 6pt; font-weigth: bold;"
											onclick="moveRegister()">회원가입</button>
				
									</div>
							</form>
						</c:if>
						<!-- 로그인한 경우 : 일반회원인 경우-->
						<c:if test="${ !empty loginMember and loginMember.admin_ok ne 'Y'}">
							<div id="loginBox" class="lineA" align="right">
								&nbsp; &nbsp;&nbsp; &nbsp;<img  style="display:inline" width="25px" height="25px" src="${ pageContext.servletContext.contextPath }/resources/static/img/cimg6.png">
								<h5 style="display:inline;">${ sessionScope.loginMember.user_name } 님 환영한다냥</h5>&nbsp;<img  style="display:inline" width="25px" height="25px" src="${ pageContext.servletContext.contextPath }/resources/static/img/cimg5.png"><br><br>
								<button class="btn btn-primary btn-block" style="margin: 0 0 0 9%; float: center; height: 30%; width: 80%; background-color: #e6a756; text-align: center; font-size: 18pt;"
								onclick="javascript:location.href='logout.do';">로그아웃</button>
								<div align="right" class="form-check mb-3">
									<button class="btn btn-primary btn-block"
										style="margin: 4% 0 0 0; float: left; height: 10%; width: 46%; background-color: #b9a187; text-align: center; font-size: 10pt;"
										onclick="">내 고양이 관리</button>
									&nbsp; &nbsp;
									<c:url var="callMyInfo2" value="myinfo.do">
										<c:param name="userid" value="${ loginMember.user_id }" />
									</c:url>
									<button class="btn btn-primary btn-block"
										style="margin: 4% 3% 0 0; float: center; height: 10%; width: 46%; background-color: #b9a187; text-align: center; font-size: 10pt;"
										href="${ callMyInfo2 }">회원정보수정</button>
								</div>
							</div>
						</c:if>
						<!-- 로그인한 경우 : 관리자인 경우-->
						<c:if test="${ !empty loginMember  and loginMember.admin_ok eq 'Y'}">
							<div id="loginBox" class="lineA" align="right">
								&nbsp; &nbsp;&nbsp; &nbsp;<img  style="display:inline" width="25px" height="25px" src="${ pageContext.servletContext.contextPath }/resources/static/img/cimg6.png">
								<h5 style="display:inline;">${ sessionScope.loginMember.user_name } 님 환영한다냥</h5>&nbsp;<img  style="display:inline" width="25px" height="25px" src="${ pageContext.servletContext.contextPath }/resources/static/img/cimg5.png"><br><br>
								<button class="btn btn-primary btn-block" style="margin: 0 0 0 9%; float: center; height: 30%; width: 80%; background-color: #e6a756; text-align: center; font-size: 18pt;"
								onclick="javascript:location.href='logout.do';">로그아웃</button>
								<div align="right" class="form-check mb-3">
									<c:url var="callMyInfo" value="myinfo.do">
										<c:param name="userid" value="${ loginMember.user_id }" />
									</c:url>
									<button class="btn btn-primary btn-block"
										style="margin: 4% 3% 0 0; float: center; height: 10%; width: 46%; background-color: #b9a187; text-align: center; font-size: 10pt;"
										href="${ callMyInfo }">회원정보수정</button>
								</div>
							</div>
						</c:if>
					</center>
				<hr>
			
				<hr style="clear: both;">
			
				<!-- 최근 등록 공지글 3개 조회 출력 -->
				<div style="float: left; border: 1px solid navy; padding: 5px; margin: 5px;">
					<h4 align="center">최근 공지글</h4>
					<table id="newnotice" border="1" cellspacing="0">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
						</tr>
					</table>
				</div>
				<!-- 조회수 많은 게시글 3개 조회 출력 -->
				<div style="float: left; border: 1px solid navy; padding: 5px; margin: 5px;">
					<h4 align="center">인기 게시글</h4>
					<table id="toplist" border="1" cellspacing="0">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>조회수</th>
						</tr>
					</table>
				</div>
				<div style="float: right; border: 1px solid navy; padding: 5px; margin: 5px; height: 80%; width: 25%; margin: 0 10.3% 0 0;">
					<div >
						<img class="banner" src="resources/static/img/banner2.jpg" width= "98%">
						<h5>광고 공간</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
	
	


	<hr style="clear: both;">
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
