<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>3차 프로젝트 1조</title>
<link rel="icon" type="image/x-icon" href="${ pageContext.servletContext.contextPath }/resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${ pageContext.servletContext.contextPath }/resources/css/styles.css" rel="stylesheet" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${ pageContext.servletContext.contextPath }/resources/js/scripts.js"></script>
<script type="text/javascript">
	function showWriteForm(){
	   location.href = "${ pageContext.servletContext.contextPath }/bwform.do";
	}
</script>   

<!-- 공지사항 -->
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		showDiv();
		
		$("input[name=item]").on("change", function(){
			showDiv();
		});
	});
	
	function showDiv(){
		$("#titleDiv").css("display", "block");
		$("#writerDiv").css("display", "none");
		$("#dateDiv").css("display", "none");
		if($("input[name=item]").eq(0).is(":checked")){
			$("#titleDiv").css("display", "block");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "none");
		}
		if($("input[name=item]").eq(1).is(":checked")){
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "block");
			$("#dateDiv").css("display", "none");
		}
		if($("input[name=item]").eq(2).is(":checked")){
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "block");
		}
	}
</script>
<style type="text/css">

h6{
	margin-left:60%;
	margin-top:10px;
	color : white;
}
.search{
	padding-top : 10px;
	color : white;
}
.searchList{ color : white; }
.return{
	display:inline-block;
	margin-left:50%;
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
                    <h1 align="center">공지 게시판</h1>
                    <br>
                        <div class="cta-inner bg-faded text-center rounded">
<!-- =============================================================================== -->

<% int num = 1; %>
<table align="center" width="100%" cellspacing="0" cellpadding="10">
	<tr align="center"><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th></tr>
	<c:forEach items="${ requestScope.list }" var="n">
		<tr align="center">
			<td><%= num++%></td>
			<!-- 공지 제목 클릭시 상세보기로 넘어가게 처리 -->
			<c:url var="ndt" value="/ndetail.do">
				<c:param name="notice_no" value="${ n.notice_no }" />
			</c:url>
			<td><a href="${ ndt }">${ n.notice_title }</a></td>
			<td>${ n.user_id }</td>
			<td><fmt:formatDate value="${ n.notice_date }" pattern="yyyy-MM-dd" /></td>
		</tr>
	</c:forEach>
</table>

	<br>
<c:import url="/WEB-INF/views/common/paging.jsp" />
<!-- =============================================================================== -->
</div>
<br>
	<!-- 로그인한 회원이 관리자인 경우는 공지사항 등록 버튼이 보이게 함 -->
<center>
	<c:if test="${ loginMember.admin_ok eq 'Y' }"><button style="background-color: white;" class="btn btn-primary btn-block" onclick="javascript:location.href='noticewrite.do';">공지 등록</button></c:if>
</center>	
	
	<!-- 검색 항목 -->
	<center>
		<div>
			<p class="search">검색할 항목을 선택하세요.</p>
			<input type="radio" name="item" value="title"><span class="searchList">제목</span> &nbsp; &nbsp;
			<input type="radio" name="item" value="writer"><span class="searchList">작성자</span> &nbsp; &nbsp;
			<input type="radio" name="item" value="date"><span class="searchList">날짜 </span>
		</div>
		<div id="titleDiv">
			<form action="nsearchTitle.do" method="post">
				<label class="searchList">검색할 제목<input type="search" name="keyword"></label>
				<input style="background-color: white;" class="btn btn-primary btn-block" type="submit" value="검색">
			</form>
		</div>
		<div id="writerDiv">
			<form action="nsearchWriter.do" method="post">
				<label class="searchList">검색할 작성자<input type="search" name="keyword"></label>
				<input style="background-color: white;" class="btn btn-primary btn-block" type="submit" value="검색">
			</form>
		</div>
		<div id="dateDiv">
			<form action="nsearchDate.do" method="post">
				<label class="searchList">검색할 날짜<input type="date" name="begin"> ~ <input type="date" name="end"></label>
				<input style="background-color: white;" class="btn btn-primary btn-block" type="submit" value="검색">
			</form>
		</div>
	</center>

</div>
</div>
</div>
</section>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
