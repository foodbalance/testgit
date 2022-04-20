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
	
	function moveLogout() {
		location.href = "logout.do";
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
                        
                        
                        	<div class="row">
                        	
	                            <div style="width: 73%; height: 10%;" class="col-xl-6">
		                            
		                            	<img style="width: 100%; height: 180px; border: 1px solid #ced4da;-webkit-appearance: none;-moz-appearance: none;appearance: none;border-radius: 0.25rem;transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;" src="${ pageContext.servletContext.contextPath }/resources/static/img/banner3.jpg">
		                            
	                            </div>
								<!-- 로그인 안했을 때 -->
 								<c:if test="${ empty loginMember }">
	 								<div style="font-size: 9pt;color: black;text-align: left;padding-left: 20px;background-color: #f6e1c5;border: 1px solid #ced4da;-webkit-appearance: none;-moz-appearance: none;appearance: none;border-radius: 0.25rem;transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; width: 27%; height: 10%;" class="col-xl-6">
	 									<br>
								        <div align="center" class="row mb-3">  
									        <form action="login.do" method="post">
									        	<img  style="display:inline" width="25px" height="25px" src="${ pageContext.servletContext.contextPath }/resources/static/img/cimg6.png">
												<h7 style="display:inline">냥덕쓰의 방문을 환영합니다.</h7><br>
				                                <input style="margin-top:1.5%; margin-bottom:0.7%; " class="form-control" id="inputID" type="text" placeholder="ID" name="inputID" value="${ reid }" required/>
				                                <input class="form-control" id="inputPassword" type="password" placeholder="Password" name="inputPassword" value="${ repwd }" required/>
				                                <input class="form-check-input" id="inputRemember" type="checkbox" value="Remember" name="inputRemember" checked/>
				                                <label style="text-align:left" class="form-check-label" for="inputRemember">아이디, 비밀번호 저장</label><br>
				                                <input class="btn btn-primary btn-block" type="submit" value="로그인">
	    										<a class="btn btn-primary btn-block" href="registerPage.do">회원가입</a>
					                        </form>
			                            </div>
	                            	</div>
                            	</c:if>
                            	<!-- 로그인한 경우 : 일반회원인 경우-->
                            	<c:if test="${ !empty loginMember and loginMember.admin_ok ne 'Y'}">
	 								<div style="font-size: 9pt;color: black;text-align: left;padding-left: 20px;background-color: #f6e1c5;border: 1px solid #ced4da;-webkit-appearance: none;-moz-appearance: none;appearance: none;border-radius: 0.25rem;transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; width: 27%; height: 10%;" class="col-xl-6">
	 									<br>
								        <div align="center" class="row mb-3"> 
								        	<form>
									        	<img style="display:inline;"  width="25px" height="25px" src="${ pageContext.servletContext.contextPath }/resources/static/img/cimg6.png">
												<h6 style="display:inline;">${ sessionScope.loginMember.user_name } 님 환영한다냥</h6>
												&nbsp;<img style="display:inline;" width="25px" height="25px" src="${ pageContext.servletContext.contextPath }/resources/static/img/cimg5.png"><br>
				                                <a class="btn btn-primary btn-block" style="float: center;  width: 78%; height: 40%; background-color: #b9a187; text-align: center; font-size: 18pt; margin-bottom: 4%; padding: 0.375rem 0.75rem; border: 1px solid #ced4da;-webkit-appearance: none;-moz-appearance: none;appearance: none;border-radius: 0.25rem;transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;"
													onclick="javascript:location.href='logout.do';">로그아웃</a>
												
												<%-- <c:url var="callMyInfo2" value="myinfo.do">
													<c:param name="user_id" value="${ loginMember.user_id }" />
												</c:url> --%>
				                                <a class="btn btn-primary btn-block" style="width: 47%; height: 25%; text-align: center; font-size: 6pt; background-color: #b9a187; border: 1px solid #ced4da;" href="" >내 고양이 관리</a>
				                                <c:url var="callMyInfo2" value="myinfo.do">
													<c:param name="user_id" value="${ loginMember.user_id }" />
												</c:url>
	    										<a class="btn btn-primary btn-block" style="width: 45%; height: 25%; text-align: center; font-size: 6pt; background-color: #b9a187; border: 1px solid #ced4da;" href="${ callMyInfo2 }">회원정보수정</a>
					                      	</form> 
			                            </div>
	                            	</div>
                            	</c:if>
                            	<!-- 로그인한 경우 : 관리자인 경우-->
                            	<c:if test="${ !empty loginMember  and loginMember.admin_ok eq 'Y'}">
	 								<div style="font-size: 9pt;color: black;text-align: left;padding-left: 20px;background-color: #f6e1c5;border: 1px solid #ced4da;-webkit-appearance: none;-moz-appearance: none;appearance: none;border-radius: 0.25rem;transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; width: 27%; height: 10%;" class="col-xl-6">
	 									<br>
								        <div align="center" class="row mb-3">  
									        <form>
									        	<img style="display:inline;"  width="25px" height="25px" src="${ pageContext.servletContext.contextPath }/resources/static/img/cimg6.png">
												<h6 style="display:inline;">${ sessionScope.loginMember.user_name } 님 환영한다냥</h6>
												&nbsp;<img style="display:inline;" width="25px" height="25px" src="${ pageContext.servletContext.contextPath }/resources/static/img/cimg5.png"><br>
				                                <a class="btn btn-primary btn-block" style="float: center;  width: 78%; height: 40%; background-color: #b9a187; text-align: center; font-size: 18pt; margin-bottom: 4%; padding: 0.375rem 0.75rem; border: 1px solid #ced4da;-webkit-appearance: none;-moz-appearance: none;appearance: none;border-radius: 0.25rem;transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;"
													onclick="javascript:location.href='logout.do';">로그아웃</a>
				                                
				                                <c:url var="callMyInfo2" value="myinfo.do">
													<c:param name="user_id" value="${ loginMember.user_id }" />
												</c:url>
	    										<a class="btn btn-primary btn-block" style="width: 45%; height: 25%; text-align: center; font-size: 6pt; background-color: #b9a187; border: 1px solid #ced4da;" href="${ callMyInfo2 }">회원정보수정</a>
					                        </form>
			                            </div>
	                            	</div>
                            	</c:if>
                            	
                            </div>
                            
                        <!------------------------------ 두번째 칸 -------------------------->
                        	<br>
                        	<div class="row">
	                            <div style="width: 50%; height: 50%;" class="col-xl-6">
	                            	<div class="row mb-3"> 
		                           		<div style="background: #f6e1c5; border-radius: 0.25rem; border-radius: 0.5rem;border: 1px solid #e6a756; padding: 5px; margin: 5px;" align="center">
				                            <h4 align="center">최근 공지글</h4>
											<table style="margin-bottom:3%; width: 98%;background: white;border-radius: 0.5rem;border: 1px solid #ced4da;text-align: center;" align="center" id="newnotice" border="1" cellspacing="0">
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>날짜</th>
												</tr>
											</table>
										</div>
									</div>
	                            </div>
						        <div style="width: 50%; height: 50%; 
						        			" class="col-xl-6">
						        	<div class="row mb-3"> 
								        <div style="background: #f6e1c5; border-radius: 0.25rem; border-radius: 0.5rem;border: 1px solid #e6a756; padding: 5px; margin: 5px;"align="center">  
			                            	<h4 align="center">인기 게시글</h4>
											<table style="margin-bottom:3%; width: 98%;background: white;border-radius: 0.5rem;border: 1px solid #ced4da;text-align: center;"align="center" id="toplist" border="1" cellspacing="0">
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>조회수</th>
												</tr>
											</table>
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
