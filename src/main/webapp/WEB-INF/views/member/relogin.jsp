<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>3차 프로젝트 1조</title>
        <link rel="icon" type="image/x-icon" href="${ pageContext.servletContext.contextPath }/resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${ pageContext.servletContext.contextPath }/resources/css/styles.css" rel="stylesheet" />
    </head>
    
<style>
.bubble
{
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
.bubble:after
{
content: '';
position: absolute;
border-style: solid;
border-width: 0 24px 44px;
border-color: #FFFF transparent;
display: block;
width: 0;
z-index: 1;
top: -44px;
left: 8%;
}
.bubble:before
{
content: '';
position: absolute;
border-style: solid;
border-width: 0 28px 48px;
border-color: #E19600 transparent;
display: block;
width: 0;
z-index: 0;
top: -53px;
left: 7%;
}
</style>
    
    <body>
    	<div align="right">
	    	<a style="padding:10px;" class="btn btn-primary btn-block" href="loginPage.do">로그인</a>
	    	<a style="padding:10px; margin:10px;" class="btn btn-primary btn-block" href="registerPage.do">회원가입</a>
	    </div>
        <header>
            <h1 class="site-heading text-center text-faded d-none d-lg-block">
                <span class="site-heading-upper text-primary mb-3">고양이 덕후들의 모임</span>
                <span class="site-heading-lower">냥 덕 쓰</span>
            </h1>
        </header>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
            <div class="container">
                <a class="navbar-brand text-uppercase fw-bold d-lg-none" href="index.html">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="main.do">메인 홈</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="famous.do">인기고양이 정보</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="products.html">게시판</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="store.html">고양이 비만 진단하기</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="page-section cta">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                        
                            <div class="row">
	                            <div class="col-xl-6">
		                            <h2 class="section-heading mb-5">
	                                	<span class="section-heading-lower">로그인</span>
	                           		</h2>
	                           		
	                           		<form action="login.do" method="post">
			                            <div class="form-floating mb-3">
			                                <input class="form-control" id="inputID" type="text" placeholder="ID" name="inputID" value="${ reid }"/>
			                                <label for="inputID">아이디</label>
			                            </div>
			                            <div class="form-floating mb-3">
			                                <input class="form-control" id="inputPassword" type="password" placeholder="Password" name="inputPassword" value="${ repwd }"/>
			                                <label for="inputPassword">비밀번호</label>
			                            </div>
			                            <div align="left" class="form-check mb-3">
			                                <input class="form-check-input" id="inputRemember" type="checkbox" value="Remember" name="inputRemember" checked/>
			                                <label style="text-align:left" class="form-check-label" for="inputRemember">아이디, 비밀번호 저장</label>
			                            </div>
			                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
			                                <a class="small" href="password">비밀번호 찾기</a>
			                                <input class="btn btn-primary btn-block" type="submit" value="로그인">
			                            </div>
			                        </form>
	                                
	                            </div>
						        <div class="col-xl-6">
							        <div class="row mb-3">  
								        <div class="col-md-6">
			                            	<img src="${ pageContext.servletContext.contextPath }/resources/static/img/img1.png">
			                            </div>
			                            <c:set var="m" value="${ message }"/>
										<c:if test="${ !empty m }">
											<h2 class="bubble site-heading-upper text-primary mb-3">${ message }</h2>
										</c:if>
										<c:set var="m2" value="${ message2 }"/>
										<c:if test="${ !empty m2 }">
											<h2 class="bubble site-heading-upper text-primary mb-3">${ message2 }<br>${ message3 }</h2>
										</c:if>
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
