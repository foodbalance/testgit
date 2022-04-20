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
    	
    	<script>
    		function wait(){
    			var wait = '';
    			var message= '';
    			wait += '<img style="display:inline; position:absolute; top:190px; left:10%;" width=300px; height=300px; src="${ pageContext.servletContext.contextPath }/resources/static/img/loading.gif">'
	    		message += '<br>'
	    		message += '<h5>비만도 측정중...</h5>'
	    		document.getElementById('wait').innerHTML = wait;
	    		document.getElementById('message').innerHTML = message;
    		}
    	</script>
    	
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
    </head>

    <body>
    	<c:import url="/WEB-INF/views/common/loginSession.jsp" />
        <c:import url="/WEB-INF/views/common/menubar.jsp" />
        <section class="page-section cta">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                        	<h2 align="center">고양이 비만도 측정 정보 입력</h2>
							<h6 align="center">(* 표시는 필수입력 항목입니다.)</h6>
							<div id="wait">
							<c:set var="catimg" value="${ imgfile }"/>
							<c:if test="${ !empty catimg }">
								<img style="display:inline; position:absolute; top:200px; left:8%;" width=350px; height=350px; src="${ pageContext.servletContext.contextPath }/resources/ai_cat_img/${ imgfile }">
							</c:if>
							<c:if test="${ empty catimg }">
								<img style="display:inline; position:absolute; top:155px; left:15px;" width=400px; height=400px; src="${ pageContext.servletContext.contextPath }/resources/static/img/measure1.png">
							</c:if>
                        	</div>
	                    	<div class="row">
	                    		<div class="col-xl-6">
	                    			<form action="catproImgflieUpload.do" method="post" enctype="multipart/form-data">
		                    			<div id="message">
		                    			<br><br><h5>등록된 이미지</h5>
		                    			</div>
		                    			<!-- <button class="btn btn-primary btn-block" onclick="upload()">미리보기</button> -->
		                    			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		                    		<!--<br><br>
								        <div class="row mb-3">  
									        <div class="col-md-6">
				                            	<img width=400px; height=400px; src="${ pageContext.servletContext.contextPath }/resources/static/img/measure1.png">
				                            </div>
			                            </div>-->
								        <div class="row mb-3">  
									        <c:set var="m" value="${ message }"/>
											<c:if test="${ !empty m }">
												<h2 class="bubble site-heading-upper text-primary mb-3">${ message }</h2>
											</c:if>
			                            </div>
			                            <br><h5 align="left">*고양이 사진 파일 등록</h5>
			                            <div class="input-group">
			                            	<input class="form-control" id="user_id" type="hidden" placeholder="ID" name="user_id" value="${ sessionScope.loginMember.user_id }"/>
			                                <input type="file" name="upfile" value="고양이 사진 파일명" required>
			                            </div>
			                            <div>
			                            	<br>
			                            	<input class="btn btn-primary btn-block" type="submit" value="고양이 사진 등록하기" >
			                            </div>
		                            </form>
                            	</div>  
	                            <div class="col-xl-6">
		                            <form action="catproflieInsert.do" method="post">
		                            	<br>
	                           			<ul style="width: 100%;" class="list-unstyled list-hours mb-5 text-left">
	                           				<!-- 히든 아이디  -->
	                           				<input class="form-control" id="user_id" type="hidden" placeholder="ID" name="user_id" value="${ sessionScope.loginMember.user_id }"/>
				                            
				                            <h5 align="left">*이름</h5>
				                            <li class="list-unstyled-item list-hours-item d-flex">
					                            <div class="input-group">
					                                <input class="form-control" style="display:inline;" id="cat_name" type="text" placeholder="고양이 이름을 입력하세요." name="cat_name" required/>
					                            </div>
					                        </li>
				                            <h5 align="left">*품종</h5>
				                            <li class="list-unstyled-item list-hours-item d-flex">
					                            <div class="input-group">
					                                <input class="form-control" style="display:inline;" id="breed" type="text" placeholder="고양이 품종을 입력하세요." name="breed" required/>
					                            </div>
					                        </li>
					                        <h5 align="left">*나이</h5>
				                            <li class="list-unstyled-item list-hours-item d-flex">
					                            <div class="input-group">
					                                <input class="form-control" style="display:inline;" id="age" type="text" placeholder="고양이 나이(숫자)를 입력하세요." name="age" required/>
					                            </div>
					                        </li>
					                        <h5 align="left">*성장도</h5>
				                            <li class="list-unstyled-item list-hours-item d-flex">
					                            <div class="input-group">
					                                <input class="form-control" style="display:inline;" id="stature" type="text" placeholder="(유아기, 청소년기, 청년기, 중년기, 장년기, 노년기)" name="stature" required/>
					                            </div>
					                        </li>
					                        <h5 align="left">*체중</h5>
				                            <li class="list-unstyled-item list-hours-item d-flex">
					                            <div class="input-group">
					                                <input class="form-control" style="display:inline;" id="weight" type="text" placeholder="고양이 체중(숫자)을 입력하세요." name="weight" required/>
					                            </div>
					                        </li>
					                        <h5 align="left">*중성화 유무</h5>
				                            <li class="list-unstyled-item list-hours-item d-flex">
					                            <div class="input-group">
					                                <input class="form-control" style="display:inline;" id="neutering" type="text" placeholder="고양이 중성화 유무를 입력하세요.(Y/N)" name="neutering" required/>
					                            </div>
					                        </li>
					                        <div class="form-floating mb-3">
				                               	<input class="btn btn-primary btn-block" type="submit" value="측정하기" onclick="wait()">
				                               	<input class="btn btn-primary btn-block" type="reset" value="작성취소">
					                        </div>
					                        
				                    	</ul>
				                    </form>
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
