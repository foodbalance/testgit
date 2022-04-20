<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cat</title>

<!-- ----------------------------------------------------------------------------------------- -->
<style type="text/css">
header {
	margin: 0;
	padding: 0;
}

header h1#logo {
	font-size: 36pt;
	font-style: italic;
	color: navy;
	text-shadow: 2px 2px 2px gray;
}

header ul#menubar {
	list-style: none;
	position: relative;
	left: 150px;
	top: -30px;
}

header ul#menubar li {
	float: left;
	width: 120px;
	height: 30px;
	margin-right: 5px;
	padding: 0;
}

header ul#menubar li a {
	text-decoration: none;
	width: 120px;
	height: 30px;
	display: block;
	background-color: orange;
	text-align: center;
	color: navy;
	font-weight: bold;
	margin: 0;
	text-shadow: 1px1px 2px white;
	padding-top: 5px;
}

header ul#menubar li a:hover {
	text-decoration: none;
	width: 120px;
	height: 30px;
	display: block;
	background-color: navy;
	text-align: center;
	color: white;
	font-weight: bold;
	margin: 0;
	text-shadow: 1px1px 2px navy;
	padding-top: 5px;
}

hr {
	clear: both;
}
</style>
</head>
<body>
	<header>
            <h1 class="site-heading text-center text-faded d-none d-lg-block">
                <span class="site-heading-upper text-primary mb-3">고양이 덕후들의 모임</span>
                <span class="site-heading-lower">냥 덕 쓰</span>
            </h1>
	<!-- 로그인 안 한 경우 -->
	<c:if test="${ empty sessionScope.loginMember }">
		<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
			<div class="container">
				<a class="navbar-brand text-uppercase fw-bold d-lg-none"
					href="index.html">Start Bootstrap</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto">
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="main.do">메인 홈</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="${ pageContext.servletContext.contextPath }/nlist.do?page=1">공지사항</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="famous.do">인기고양이 정보</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="${ pageContext.servletContext.contextPath }/blist.do?page=1">게시판</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="measure.do">고양이 비만도 진단하기</a></li>
					</ul>
				</div>
			</div>
		</nav>
</c:if>

	<!-- 로그인 한 경우 : 관리자인 경우-->
	<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
		<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
			<div class="container">
				<a class="navbar-brand text-uppercase fw-bold d-lg-none"
					href="index.html">Start Bootstrap</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto">
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="main.do">메인 홈</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="famous.do">인기고양이 정보 관리</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="mlist.do">회원 관리</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="${ pageContext.servletContext.contextPath }/nlist.do?page=1">공지사항</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="${ pageContext.servletContext.contextPath }/blist.do?page=1">게시판</a></li>
					</ul>
				</div>
			</div>
		</nav>
</c:if>

	<!-- 로그인 한 경우 : 일반회원인 경우 -->
	<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
		<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
			<div class="container">
				<a class="navbar-brand text-uppercase fw-bold d-lg-none"
					href="index.html">Start Bootstrap</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto">
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="main.do">메인 홈</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="${ pageContext.servletContext.contextPath }/nlist.do?page=1">공지사항</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="famous.do">인기고양이 정보</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="${ pageContext.servletContext.contextPath }/blist.do?page=1">게시판</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="measure.do">고양이 비만도 진단하기</a></li>
						<li class="nav-item px-lg-4"><a
							class="nav-link text-uppercase" href="mycat.do">내 고양이 관리</a></li>
					</ul>
				</div>
			</div>
		</nav>
</c:if>
	</header>
	
	
	<style type="text/css">
<!--
	body {font-size:11pt; padding:0; margin:0;}
	h3 {color: #85144b; font-size: 14pt;}

	#promotionBanner {width: 100%; height: 110px; background-color:white; color: #f1f1f1; overflow: hidden;}
	.popContents {width: 1100px; margin: 0 auto; padding: 0; overflow: hidden; text-align: center;}
	.popClose {width: 1100px; marign: 0 auto; text-align: right; font-size: 9pt; padding: 0;}

	
	#chkday {color: #5a5a5a;}
	label[for=chkday] { cursor: pointer; color: black; padding-right: 10px;}

	.contents {width: 1100px; margin: 0 auto; height: 900px; background-color: #e0e0e0; overflow: hidden; padding: 20px;}
//-->
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<script language="JavaScript">
<!--
	//쿠키저장 함수
	function setCookie( name, value, expiredays ) { 
		var todayDate = new Date(); 
		todayDate.setDate( todayDate.getDate() + expiredays ); 
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
	}

	$(document).ready(function(){
		$("#promotionBanner .btnClose").click(function(){
			//오늘만 보기 체크박스의 체크 여부를 확인 해서 체크되어 있으면 쿠키를 생성한다.
			if($("#chkday").is(':checked')){
				setCookie( "topPop", "done" , 1 ); 
				//alert("쿠키를 생성하였습니다.");
			}
			//팝업창을 위로 애니메이트 시킨다. 혹은 slideUp()
			//$('#promotionBanner').animate({height: 0}, 500);
			$('#promotionBanner').slideUp(500); 
		});
	});

//-->  
</script>

</head>
<body>

<!-- Layer POPUP -->
<div id="promotionBanner">
	<div class="popContents">
		<img class="banner" src="resources/static/img/banner2.jpg" height="80">
		<div class="popClose">
		<input type="checkbox" value="checkbox" name="chkbox" id="chkday"/><label for="chkday">오늘 하루 그만보기 </label> 
        <a href="#none" class="btnClose"><img src="resources/static/img/img1.png" alt="배너 닫기" width="15" />닫기</a></div>
	</div>
</div>  

<script language="Javascript">
	//저장된 해당 쿠키가 있으면 창을 안 띄운다 없으면 뛰운다.
	cookiedata = document.cookie;    
	if ( cookiedata.indexOf("topPop=done") < 0 ){      
		document.all['promotionBanner'].style.display = "block";
		} 
	else {
		document.all['promotionBanner'].style.display = "none"; 
	}
</script>
</body>
</html>