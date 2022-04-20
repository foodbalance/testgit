<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${ pageContext.servletContext.contextPath }/resources/css/styles.css"
	rel="stylesheet" />
<script type="text/javascript">
	//아이디 또는 비밀번호 미입력시 경고창
	function checkValue(){
		
		if(!document.delform.user_id.value){
			alert("아이디가 입력되지 않았습니다.")
			return false;
		}
		
		if(!document.delform.user_pwd.value){
			alert("비밀번호가 입력되지 않았습니다.")
			return false;
		}
		
	}
	
	
</script>
<script>
	var result = '${result}';
	
	if(result === "delOk"){
		alert("회원 탈퇴 성공");
		window.close();
		opener.location.href="main.do";
	}else if(result === "idError"){
		alert("아이디를 다시 확인해주세요.")
	}else if(result === "pwdError"){
		alert("비밀번호를 다시 확인해주세요.");
	}else if(result === "keyError"){
		alert("키워드를 다시 확인해주세요.");
	}
</script>
</head>
<body>

	<br>
	<br>
	<section class="page-section cta">
		<form action="mdelete.do" method="post" name="delform" onsubmit="return checkValue()" autocomplete="off">
			<h3 align="center">회원 탈퇴 페이지</h3>
			<div align="center">
				<input class="form-control" type="text" id="user_id" name="user_id" placeholder="아이디 확인" >
			</div>
			<div align="center">
				<input class="form-control" id="user_pwd" type="password"
					placeholder="비밀번호 확인" name="user_pwd">
			</div>
			<div align="center">
				<input class="form-control" id="keyword" type="text"
					placeholder="키워드 확인" name="keyword">
			</div>
			<br>
			<div align="center">
				<input type="submit" class="btn btn-primary btn-block" value="탈퇴하기">
			</div>
</body>
</html>