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
				var check = document.getElementById("check2").value;
				var message = "";
				
				if(pwdValue !== pwdValue2){
					//alert("비밀번호와 비밀번호 확인의 값이 일치하지 않습니다.\n다시 입력하세요.");
					//document.getElementById("user_pwd").select();
					message += '<h5 style="color:red;" id="result_check">비밀번호가 일치하지 않습니다.</h5>'
					document.getElementById("result_check").innerHTML = message;
					
					return false;  //전송 취소
				}else{
					//중복체크 했는지 물음
					if(check == "ok"){
						return true;  //전송함
					}else{
						message += '<h5 style="color:red;" id="result_check">아이디 중복체크 해주십시오.</h5>'
						document.getElementById("result_check").innerHTML = message;
						return false;  //전송 취소
					}
				}
			}
			
			//아이디 중복 체크 확인을 위한 ajax 실행 처리용 함수
			//ajax(Asynchronous Javascript And Xml) :페이지를 새로고침하지 않고, 현재 페이지에서 서버와 통신함
			//현재 페이지 안에서 일부분으로 서버와 통신하고 결과 출력하는 구조임
			//웹페이지에서 서버로 서비스를 요청하면, 서버는 요청을 받아서 처리하고, 처리결과로 웹페이지를 내보냄
			//클라이언트 브라우저에서는 요청결과에 대해 페이지가 항상 새로고침됨
			function dupCheckId(){
				
				var result = "";
				var message = "";
				
				$.ajax({
					url: "idchk.do",
					type: "post",
					data: { user_id: $("#user_id").val() },
					success: function(data){
						console.log("success : " + data);
						if(data == "ok"){
							//alert("사용 가능한 아이디 입니다.");
							message += '<h5 align="left" style="color:red;" id="idcheck">사용 가능한 아이디 입니다.</h5>'
							result += '<input id="check2" type="hidden" value="ok">'
							
							document.getElementById("idcheck").innerHTML = message;
							document.getElementById("check1").innerHTML = result;
							
							$("#user_pwd").focus();

						}else{
							//alert("이미 사용중인 아이디 입니다.\n다시 입력하세요.");
							
							message += '<h5 align="left" style="color:red;" id="idcheck">이미 사용중인 아이디 입니다.</h5>'
							result += '<input id="check2" type="hidden" value="no">'
							
							document.getElementById("idcheck").innerHTML = message;
							document.getElementById("check1").innerHTML = result;
							$("#user_id").select();
						}
					},
					error: function(jqXHR, textstatus, errorthrown){
						console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown)
					}
				});
				
			}
		</script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		function findAdd(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
		            
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                /* // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                } */

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("postcode").value = data.zonecode;
	                document.getElementById("address1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").focus();
	            }
		        
		    }).open();
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
	                        	<span style="display:inline;" class="section-heading-lower">회원가입</span>
	                        	<h5 align="center">(* 표시는 필수입력 항목입니다.)</h5>
                            </h2>
                            
                            <ul class="list-unstyled list-hours mb-5 text-left mx-auto">
                            	<h5 align="left">*아이디</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                <form action="enroll.do" method="post" onsubmit="return validate();">
		                            <div class="input-group">
		                                <input class="form-control" id="user_id" type="text" placeholder="아이디" name="user_id" required/>
		                                <input style="display:inline" class="btn btn-primary btn-block" type="button" value="중복체크" onclick="return dupCheckId();">
		                            	<!-- <button style="display:inline" class="btn btn-primary btn-block" onclick="return dupCheckId();">중복확인</button> -->                     	
		                            </div>
		                            <h5 align="left" id="idcheck"></h5>
                                </li>
                                
                                <h5 align="left">*비밀번호</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                   <div class="input-group">
                                        <input class="form-control" id="user_pwd" type="password" placeholder="비밀번호 입력" name="user_pwd" required/>
                                   </div>
                                </li>
                                
                                <h5 align="left">*비밀번호 확인</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                   <div class="input-group">
		                                <input class="form-control" id="user_pwd2" type="password" placeholder="비밀번호 확인">
		                           </div>
                                </li>
                                
                                <h5 align="left">*이름</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                  <div class="input-group">
		                                <input class="form-control" id="user_name" placeholder="이름 입력" name="user_name" required>
		                           </div>
                                </li>
                                
                                <h5 align="left">*생년월일</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                  <div class="input-group">
		                                <input type="date" class="form-control" id="user_birth" placeholder="yyyy-mm-dd (반드시 형식에 맞게 입력하세요)" name="user_birth" required>
		                           </div>
                                </li>
                                
                                <h5 align="left">*휴대폰 번호</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                   <div class="input-group">
		                                <input class="form-control" id="phone" placeholder="휴대폰 번호 입력(-제외한 숫자만 입력)" name="phone" required>
		                           </div>
                                </li>
                                
                                <h5 align="left">*주소</h5>
                                <li class="list-unstyled-item list-hours-item">
                                   <div class="input-group">
		                                <input class="form-control" style="display:inline;" id="postcode" name="postcode" placeholder="우편번호" readonly/>
		                                <!-- <input style="display:inline" type="button" onclick="findAdd();" value="주소찾기"> -->
		                                <a style="display:inline" class="btn btn-primary btn-block" onclick="findAdd();">주소 찾기</a>
		                           </div>
		                           <div class="input-group">
		                                <input class="form-control" id="address1" placeholder="주소 입력" name="address1" readonly>
		                           </div>
		                           <div class="input-group">
		                                <input class="form-control" id="address2" placeholder="상세 주소 입력" name="address2">
		                           </div>
                                </li>
                                
                                <h5 align="left">*당신이 좋아하는 고양이의 품종은?</h5>
                                <li class="list-unstyled-item list-hours-item d-flex">
                                   <div class="input-group">
		                                <input class="form-control" id="keyword" placeholder="고양이 품종 입력(비밀번호 찾기 키워드)" name="keyword" required>
		                           </div>
                                </li>
                                
                                <div id="check1">
                                <input id="check2" type="hidden" value="no">
                                </div>
                                
                                <h5 id="result_check"></h5>
                                
                                <div class="form-floating mb-3">
                                	<input class="btn btn-primary btn-block" type="submit" value="가입하기">
                                	<input class="btn btn-primary btn-block" type="reset" value="작성취소">
                                   <!-- <button type="submit" class="btn btn-primary btn-block">회원가입</button>
                                   <button type="reset" class="btn btn-primary btn-block">작성취소</button> -->   
		                        </div>
		                        <div>
		                        	<input class="btn btn-primary btn-block" type="button" onclick="location.href='main.do'" value="홈으로">
		                        </div>

		                        </form>

                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        
    </body>
</html>
