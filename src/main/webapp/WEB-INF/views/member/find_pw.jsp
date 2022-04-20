<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
         <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
			//전송(submit)버튼이 눌러졌을 때, 입력값들에 대한 유효성 검사함
			function validate(){
				
				//validation 체크 검사 코드 구현함
				//서버 컨트롤러로 전송할 값들이 유효한 값인지 검사하는 것
				//암호와 암호확인이 같은 값인지 확인
				var pwdValue = document.getElementById("user_pwd").value;
				var pwdValue2 = document.getElementById("user_pwd2").value;
				var message = "";
				
				if(pwdValue !== pwdValue2){
					//alert("비밀번호와 비밀번호 확인의 값이 일치하지 않습니다.\n다시 입력하세요.");
					//document.getElementById("user_pwd").select();
					message += '<h5 style="color:red;" id="result_check">비밀번호가 일치하지 않습니다.</h5>'
					document.getElementById("result_check").innerHTML = message;
					
					return false;  //전송 취소
				}else{
					return true;
				}
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
                        	
                        	<!-- 태그 원하는 위치 삽입 참조 position(top,left,right,bottom)이용 ,이미지 사지즈는 반응형 웹 구조 때문에 px보다는 %선호-->
                        	<img style="display:inline; position:absolute; top:30px; left:30px;" src="${ pageContext.servletContext.contextPath }/resources/static/img/img2.png" width=20%; height=16%;>
                            
                            <br><br>
                            <h2 class="section-heading mb-5">
	                        	<span style="display:inline;" class="section-heading-lower">비밀번호 찾기</span>
                            </h2>
                            <h5 align="center">(* 표시는 필수입력 항목입니다.)</h5>
                            <ul class="list-unstyled list-hours mb-5 text-left mx-auto">
                            	<h5 align="left">*아이디</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                <form action="findPwd.do" method="post" onsubmit="return validate();">
		                            <div class="input-group">
		                                <input class="form-control" style="display:inline;" id="user_id" type="text" placeholder="아이디" name="user_id" required>
		                            </div>   
                                </li>                                                
                                <h5 align="left">*새 비밀번호</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                   <div class="input-group">
                                        <input class="form-control" id="user_pwd" type="password" placeholder="비밀번호 입력" name="user_pwd" required>
                                   </div>
                                </li>                                
                                <h5 align="left">*새 비밀번호 확인</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                   <div class="input-group">
		                                <input class="form-control" id="user_pwd2" type="password" placeholder="비밀번호 확인" required>
		                           </div>
                                </li>                                
                                <h5 align="left">*이름</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                  <div class="input-group">
		                                <input class="form-control" id="user_name" name="user_name" placeholder="이름 입력" required>
		                           </div>
                                </li>                                
                                <h5 align="left">*생년월일</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                  <div class="input-group">
		                                <input class="form-control" id="user_birth" type="date" placeholder="yyyy-mm-dd (반드시 형식에 맞게 입력하세요)" name="user_birth" required>
		                           </div>
                                </li>
                                <h5 align="left">*당신이 좋아하는 고양이의 품종은?</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                   <div class="input-group">
		                                <input class="form-control" id="keyword" placeholder="고양이 품종 입력(비밀번호 찾기 키워드)" name="keyword" required>
		                           </div>
                                </li>                  
                                <h5 id="result_check"></h5>              
                                <div class="form-floating mb-3">
                                	<input class="btn btn-primary btn-block" type="submit" value="비밀번호 변경">
                                	<input class="btn btn-primary btn-block" type="button" onclick="javascript:history.go(-1); return false;" value="이전 페이지로">
                                   <!-- <button type="submit" class="btn btn-primary btn-block">회원가입</button>
                                   <button type="reset" class="btn btn-primary btn-block">작성취소</button> -->
                                   
		                        </div>
                               
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        
    </body>
</html>
