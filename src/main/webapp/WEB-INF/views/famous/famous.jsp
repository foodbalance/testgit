<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


</head>
<body>
	<c:import url="/WEB-INF/views/common/loginSession.jsp" />
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="page-section about-heading">
		<div class="container">
			<img class="img-fluid rounded about-heading-img mb-3 mb-lg-0"
				src="${ pageContext.servletContext.contextPath }/resources/static/img/American_Shorthair.png"
				alt="..." />
			<div class="about-heading-content">
				<div class="row">
					<div class="col-xl-9 col-lg-10 mx-auto">
						<div class="bg-faded rounded p-5">
							<h2 class="section-heading mb-4">
								<span class="section-heading-upper"></span> <span
									class="section-heading-lower">집사들에게 사랑 받는 고양이들</span>
							</h2>
							<p>성격 착하고 순한 반려하기 딱 좋은 고양이 10종</p>
							<p class="mb-0">아래 고양이들은 처음 집사가 되는 당신이 고려해 볼만한 반려하기 좋은 각 10순위의
								고양이 들이다.
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section class="page-section clearfix">
		<div class="container">
			<div class="intro" >
				<img style="float: left; height: 550px;" class="intro-img mb-3 mb-lg-0 rounded" 
					src="${ pageContext.servletContext.contextPath }/resources/static/img/AmericanShorthair.png"
					alt="..." />
				<div style="float: right; margin-left: 60%;" class="intro-text left-0 text-center bg-faded p-5 rounded">
					<h2 class="section-heading mb-4">
						<span class="section-heading-upper"></span> <span
							class="section-heading-lower">아메리칸 숏헤어</span>
					</h2>
					<p class="mb-3">아메리칸 숏헤어는 미국이 원산지인 단모 고양이로 분류됩니다. 하지만 이 품종은 아마도
						유럽을 기원으로 하는 고양이에서 개량되었습니다. 아메리칸 숏헤어에 대한 설명과 일치하는 고양이는 아마도 콜럼버스가 이
						대륙을 발견하기 전까지는 미국에 없던 것으로 추측됩니다.</p>
					<p>주요정보</p>

					<p>눈동자 색상: 블루, 구리색, 그린, 골드, 노란연두, 오드아이</p>

					<p>피모길이: 단모</p>

					<p>특징: 직모</p>

					<p>색상: 흰색, 블루, 블랙, 크림, 레드, 실버, 골드, 갈색, 카메오, 블루크림</p>

					<p>체중: 3.6-5.4kg</p>
					
						<!-- 로그인 안 한 경우 -->
						<c:if test="${ empty sessionScope.loginMember }">
						<div class="intro-button mx-auto">
							<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
						</div>
						</c:if>
						<!-- 로그인 한 경우 -->
						<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
						<div class="intro-button mx-auto">
							<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
						</div>
						</c:if>
						<!-- 관리자 로그인 한 경우 -->
						<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
						<div class="intro-button mx-auto">
							<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/famousListView.do">상세 정보</a>
						</div>
						</c:if>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section class="page-section clearfix">
		<div class="container">
			<div class="intro">
				<img style="height: 550px;" class="intro-img mb-3 mb-lg-0 rounded" 
					src="${ pageContext.servletContext.contextPath }/resources/static/img/ExoticShorthair.jpg"
					alt="..." />
				<div class="intro-text left-0 text-center bg-faded p-5 rounded">
					<h2 class="section-heading mb-4">
						<span class="section-heading-upper"></span> <span
							class="section-heading-lower">엑조틱 숏헤어</span>
					</h2>
					<p class="mb-3">엑조틱은 극단적 외모의 품종입니다. 
					몸통은 짧지만 매우 두껍고 두꺼운 다리 그리고 두껍고 짧은 목을 가지고 있습니다. 
					골격은 무겁지만 꼬리가 짧고 귀도 작습니다. 전체적으로 보면 코와 안면은 평평합니다.</p>
					
					<P>체중: 3.6-5.4kg</P>
					<P>눈동자 색상: 블루, 구리색, 노란연두, 오드아이 </P>
					<P>수명: 8-10년</P>
					<P>피모길이: 중모, 장모</P>
					<P>특징: 직모</P>
					<P>색상: 흰색, 레드, 크림, 블랙, 블루, 초콜릿, 라일락, 실버, 골드, 카메오</P>
					

					<!-- 로그인 안 한 경우 -->
					<c:if test="${ empty sessionScope.loginMember }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 관리자 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/famousListView.do">상세 정보</a>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section class="page-section clearfix">
		<div class="container">
			<div class="intro">
				<img style="float: left; height: 550px;" class="intro-img img-fluid mb-3 mb-lg-0 rounded"
					src="${ pageContext.servletContext.contextPath }/resources/static/img/Norwayforest2.png"
					alt="..." />
				<div style="float: right; margin-left: 60%;" class="intro-text left-0 text-center bg-faded p-5 rounded">
					<h2 class="section-heading mb-4">
						<span class="section-heading-upper"></span> <span
							class="section-heading-lower">노르웨이 숲</span>
					</h2>
					<p class="mb-3">노르웨이 숲 고양이는 삼각형 모양의 머리에 두껍고 근육이 잘 발달된 목을 가지고
						있습니다. 귀는 중간 정도 크기이며 턱은 강하지만 약간 둥근편입니다. 다리는 탄탄한 근육질이며 뒷다리가 앞다리보다 약간
						더 깁니다. 발은 매우 크고 둥근 형태이며 발가락 사이에 털이 나있습니다.</p>
					<p>주요 정보</p>
					<p>체중: 5.4kg</p>
					<p>눈동자 색상: 블루, 그린, 골드, 오드아이</p>
					<p>수명: 8~14년</p>
					<p>피모길이: 장모</p>
					<p>특징: 직모</p>
					<p>색상: 흰색, 흑색, 블루, 레드, 크림, 실버, 골드, 레드, 카메오</p>
					<!-- 로그인 안 한 경우 -->
					<c:if test="${ empty sessionScope.loginMember }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 관리자 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/famousListView.do">상세 정보</a>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section class="page-section clearfix">
		<div class="container">
			<div class="intro">
				<img style="height: 550px;" class="intro-img img-fluid mb-3 mb-lg-0 rounded"
					src="${ pageContext.servletContext.contextPath }/resources/static/img/Ragdoll.jpg"
					alt="..." />
				<div style="margin-upper:" class="intro-text left-0 text-center bg-faded p-5 rounded">
					<h2 class="section-heading mb-4">
						<span class="section-heading-upper"></span> <span
							class="section-heading-lower">랙돌</span>
					</h2>
					<p class="mb-3">헝겊 인형같은 얼굴과 손발 등의 특징적인 얼룩이 들어간 머리 색깔, 중간 긴 피모를
						가진 고양이입니다. 체형은 긴 그리고 서브 스탄 샤 타입으로 큰 머리에 약간 치켜 올라가 파란 눈, 둥근 뺨을 하고
						있습니다. 꼬리는 몸길이만큼의 길이로 근육질로 중량감이 있는 체격입니다.</p>
					<p>주요정보</p>
					<p>눈동자 색상: 블루</p>
					<p>피모길이: 장모</p>
					<p>특징: 매끄러움</p>
					<p>색상 : 프로스트, 블루, 초콜릿, 암갈색, 레드, 라일락, 블루크림, 크림</p>
					<p>체중: 5.4kg</p>
					<p>수명: 7-12년</p>
					<!-- 로그인 안 한 경우 -->
					<c:if test="${ empty sessionScope.loginMember }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 관리자 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/famousListView.do">상세 정보</a>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section class="page-section clearfix">
		<div class="container">
			<div class="intro">
				<img style="float: left; height: 550px;" class="intro-img img-fluid mb-3 mb-lg-0 rounded"
					src="${ pageContext.servletContext.contextPath }/resources/static/img/Russianblue.jpg"
					alt="..." />
				<div style="float: right; margin-left: 60%;" class="intro-text left-0 text-center bg-faded p-5 rounded">
					<h2 class="section-heading mb-4">
						<span class="section-heading-upper"></span> <span
							class="section-heading-lower">러시안블루</span>
					</h2>
					<p class="mb-3">우리는 러시안 블루가 북부 러시아의 아르한겔스크에서 유래된 고양이라는 것을 알고
						있지만 자세한 것은 완전히 명확하지 않다. 전문가들과 연구원들은 러시안 블루를 우리가 알고 있는 가장 오래된 천연
						고양이 품종 중 하나로 간주한다. 증거와 기록이 없어 길들여진 이 고양이의 대부분의 기원 설화는 상상력에 속한다.</p>
					<p>주요정보</p>
					<p>체중 : 2.5~4kg</p>
					<p>눈동자 생상: 녹색(에메랄드 빛)</p>
					<p>피모길이: 단모</p>
					<p>색상: 푸른빛이 도는 회색 털</p>
					<!-- 로그인 안 한 경우 -->
					<c:if test="${ empty sessionScope.loginMember }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 관리자 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/famousListView.do">상세 정보</a>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section class="page-section clearfix">
		<div class="container">
			<div class="intro">
				<img style="height: 550px;" class="intro-img img-fluid mb-3 mb-lg-0 rounded"
					src="${ pageContext.servletContext.contextPath }/resources/static/img/Munchiken2.png"
					alt="..." />
				<div class="intro-text left-0 text-center bg-faded p-5 rounded">
					<h2 class="section-heading mb-4">
						<span class="section-heading-upper"></span> <span
							class="section-heading-lower">먼치킨</span>
					</h2>
					<p class="mb-3">먼치킨 고양이는 대표적인 동장단족(몸통이 길고 다리가 짧은 체형) 품종이다. 짧은
						다리로 아장아장 걷는 귀여운 모습이 특징인 먼치킨 고양이는 1983년 미국에서 처음 발견된 것으로 기록되어 있다.</p>
					<p>주요 정보</p>
					<p>체중: 3~4kg</p>
					<p>눈동자 색상: 블루. 호박색</p>
					<p>수명: 13~15년</p>
					<p>털빠짐: 보통</p>
					<p>피모길이: 중모</p>
					<p>특색: 푹신한 털</p>
					<p>색상: 모든 색</p>
					<!-- 로그인 안 한 경우 -->
					<c:if test="${ empty sessionScope.loginMember }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 관리자 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/famousListView.do">상세 정보</a>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section class="page-section clearfix">
		<div class="container">
			<div class="intro">
				<img style="float: left; height: 550px;" class="intro-img img-fluid mb-3 mb-lg-0 rounded"
					src="${ pageContext.servletContext.contextPath }/resources/static/img/bengal.jpg"
					alt="..." />
				<div style="float: right; margin-left: 60%;" class="intro-text left-0 text-center bg-faded p-5 rounded">
					<h2 class="section-heading mb-4">
						<span class="section-heading-upper"></span> <span
							class="section-heading-lower">벵갈</span>
					</h2>
					<p class="mb-3">벵골은 약간 폭이 넓은 쐐기 모양의 머리에 폭이 넓은 코줄기, 약간 치켜세운 아몬드
						모양의 눈을 마스카라라고 불리는 아이라인이 휘감고 있습니다.</p>
					<p>주요 정보</p>
					<p>눈동자 색상: 골드</p>
					<p>피모길이: 단모</p>
					<p>특징: 매끄러움</p>
					<p>색상: 크림 브라운, 초콜릿, 그레이</p>
					<p>무늬: 태비</p>
					<p>숫컷: 5-8kg</p>
					<p>암컷: 4-5kg</p>
					<p>수명: 9-15 세</p>
					<!-- 로그인 안 한 경우 -->
					<c:if test="${ empty sessionScope.loginMember }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 관리자 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/famousListView.do">상세 정보</a>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section class="page-section clearfix">
		<div class="container">
			<div class="intro">
				<img style="height: 550px;" class="intro-img img-fluid mb-3 mb-lg-0 rounded"
					src="${ pageContext.servletContext.contextPath }/resources/static/img/birtishshotrhair.png"
					alt="..." />
				<div class="intro-text left-0 text-center bg-faded p-5 rounded">
					<h2 class="section-heading mb-4">
						<span class="section-heading-upper"></span> <span
							class="section-heading-lower">브리티쉬 쇼트헤어</span>
					</h2>
					<p class="mb-3">체형은 세미코비타입에 가깝고, 크고 둥그런 머리를 가지고 있으며, 귀는 머리에 비해
						크지 않고, 눈은 크고 둥글며 볼살이 있어서 심술맞아 보이는 인상을 가지고 있지만, '이상한 나라의 앨리스'에 나오는
						체셔 고양이처럼 부드러운 미소를 가지고 있다. 몸은 단단하며 뼈가 굵다. 짧고 굵은 목을 가지고 있다. 다리도 역시
						굵고 짧은 편이며, 꼬리는 끝이 둥글고 몸체의 3분의 2정도의 길이이다. 털은 짧고 조밀하게 나 있고 뻣뻣한 편이다.
						한편 색은 아주 다양한데, 가장 많은 색은 블루이다. 눈색은 털색과 관련이 있다.</p>
					<p>주요 정보</p>
					<p>눈동자 색상: 블루, 구리색, 골드, 오드아이</p>
					<p>피모길이: 단모, 중모</p>
					<p>특징: 직모</p>
					<p>색상: 흰색, 블루, 블랙, 크림, 레드, 브라운, 실버, 카메오, 등등</p>
					<p>체중: 5.4kg</p>
					<p>수명: 7-12년</p>
					<!-- 로그인 안 한 경우 -->
					<c:if test="${ empty sessionScope.loginMember }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 관리자 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/famousListView.do">상세 정보</a>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<section class="page-section clearfix">
		<div class="container">
			<div class="intro">
				<img style="float: left; height: 550px;" class="intro-img img-fluid mb-3 mb-lg-0 rounded"
					src="${ pageContext.servletContext.contextPath }/resources/static/img/Turkishangora.jpg"
					alt="..." />
				<div style="float: right; margin-left: 60%;" class="intro-text left-0 text-center bg-faded p-5 rounded">
					<h2 class="section-heading mb-4">
						<span class="section-heading-upper"></span> <span
							class="section-heading-lower">터키시 앙고라</span>
					</h2>
					<p class="mb-3">털이 긴 장모종이며 체형은 늘씬한 편이다. 얼굴은 뾰족하고 귀는 크고 밑이 넓으며,
						서로 붙어있다. 눈은 호두모양인데 위쪽으로 약간 기울었고, 오드아이를 가지고 태어날 수 있는데 이 중 일부는 귀가
						들리지 않는 경우도 있다. 눈의 색깔은 노랑에서 초록, 파랑까지 매우 다양하다.</p>
					<p>주요 정보</p>
					<p>체중: 3.6-5.4kg</p>
					<p>눈동자 색상: 블루, 구리색, 그린, 골드, 오드아이</p>
					<p>수명: 9-14년</p>
					<p>피모길이: 중모, 장모</p>
					<p>특징: 부드러움</p>
					<p>색상: 흰색, 레드, 크림, 흑색, 블루, 실버, 톨토이즈쉘, 칼리코, 딜루트칼리코, 크림블루</p>
					<!-- 로그인 안 한 경우 -->
					<c:if test="${ empty sessionScope.loginMember }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 관리자 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/famousListView.do">상세 정보</a>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section class="page-section clearfix">
		<div class="container">
			<div class="intro">
				<img class="intro-img img-fluid mb-3 mb-lg-0 rounded"
					src="${ pageContext.servletContext.contextPath }/resources/static/img/Persiancat2.jpg"
					alt="..." />
				<div class="intro-text left-0 text-center bg-faded p-5 rounded">
					<h2 class="section-heading mb-4">
						<span class="section-heading-upper"></span> <span
							class="section-heading-lower">페르시안 고양이</span>
					</h2>
					<p class="mb-3">페르시안은 고대 고양이 품종이며, 그 역사는 별로 잘 알려져 있지 않습니다.
						17세기에 피에트로 델라 발레가 페르시아에서 이탈리아로 고양이 한 마리를 데려오면서 시작 되었습니다. 이 고양이는
						페르시아에서는 사막에서 사는 모래 고양이로 알려져 왔습니다. 풍성한 털이 마치 솜사탕과 같은 페르시안 고양이는 장모종의
						대표주자입니다. 얼굴은 옆으로 긴 차원형 모양이며 입과 코가 평면으로 눌려있고 많이 눌린경우에는 코가 들창코처럼
						보이기도 합니다.</p>
					<p>주요 정보</p>
					<p>눈동자 색상: 호박색, 구리색, 그린, 골드, 노란연두, 주황, 노랑</p>
					<p>피모길이: 장모</p>
					<p>특징: 직모</p>
					<p>색상: 흰색, 블루,흑색, 레드, 크림, 실버, 블루크림, 갈색</p>
					<p>체중: 5.4kg</p>
					<p>수명: 9-13년</p>
					<!-- 로그인 안 한 경우 -->
					<c:if test="${ empty sessionScope.loginMember }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'N'}">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/detailMove.do">상세 정보</a>
					</div>
					</c:if>
					<!-- 관리자 로그인 한 경우 -->
					<c:if test="${ !empty sessionScope.loginMember and sessionScope.loginMember.admin_ok eq 'Y' }">
					<div class="intro-button mx-auto">
						<a class="btn btn-primary btn-xl" href="${ pageContext.servletContext.contextPath }/famousListView.do">상세 정보</a>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
