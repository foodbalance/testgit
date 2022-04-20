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
<!-- bubble - https://www.ilikepixels.co.uk/bubbler/ -->
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
    	<c:import url="/WEB-INF/views/common/loginSession.jsp" />
        <c:import url="/WEB-INF/views/common/menubar.jsp" />
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
			                                <input class="form-control" id="inputID" type="text" placeholder="ID" name="inputID" value="${ reid }" required/>
			                                <label for="inputID">아이디</label>
			                            </div>
			                            <div class="form-floating mb-3">
			                                <input class="form-control" id="inputPassword" type="password" placeholder="Password" name="inputPassword" value="${ repwd }" required/>
			                                <label for="inputPassword">비밀번호</label>
			                            </div>
			                            <div align="left" class="form-check mb-3">
			                                <input class="form-check-input" id="inputRemember" type="checkbox" value="Remember" name="inputRemember" checked/>
			                                <label style="text-align:left" class="form-check-label" for="inputRemember">아이디, 비밀번호 저장</label>
			                            </div>
			                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
			                                <a class="small" href="findPwdPage.do">비밀번호 찾기</a>
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
        <c:import url="/WEB-INF/views/common/footer.jsp" />
    </body>
</html>
