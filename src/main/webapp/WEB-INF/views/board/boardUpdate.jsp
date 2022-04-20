<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:set var="currentPage" value="${ requestScope.page }"/>

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
	function showWrite(){
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



 
</head>
<body>
	<c:import url="/WEB-INF/views/common/loginSession.jsp" />
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<section class="page-section cta">
	    <div class="container">
	        <div class="row">
		        <form action="boardupdate.do" method="post" enctype="multipart/form-data">
		            <div class="col-xl-9 mx-auto">
		            <h2 align="center">${board.board_no}번 게시글 수정 페이지</h2><br>
                		<div class="cta-inner bg-faded text-center rounded">
	
<!-- =============================================================================== -->
	<!-- 원글 수정 -->
							<input type="hidden" name="board_no" value="${board.board_no }">
							<input type="hidden" name="page" value="${currentPage}">
							<c:if test="${!empty board.board_original_img }">
								<input type="hidden" name="board_original_img" value="${board.board_original_img}">
								<input type="hidden" name="board_rename_img" value="${board.board_rename_img}">
							</c:if>
							<table align="center" width="100%" cellspacing="0" cellpadding="10">
								<tr><th>제     목</th><td><input class="form-control" type="text" name="board_title" value="${board.board_title }" required></td></tr>
								<tr><th>작 성 자</th><td><input class="form-control" type="text" value="${board.user_id}" readonly></td></tr>
								<tr><th>날     짜</th><td><input class="form-control" type="text" value="${board.board_date}" readonly></td></tr>
								<tr><th>첨부파일</th>
									<td align="left">
									<!-- 기존 첨부파일 있는 경우 -->
									<c:if test="${!empty board.board_original_img }">
										${board.board_original_img } &nbsp;
										<input class="form-check-label" type="checkbox" name="delFlag" value="yes">파일 삭제<br>
									</c:if>
										<input class="btn btn-primary btn-block" type="file" name="upfile">
									</td>
								</tr>
								<tr><th>내     용</th><td><textarea class="form-control" name="board_content" rows="5" cols="50" required>${board.board_content }</textarea></td></tr>
							</table>
<!-- =============================================================================== -->
						</div>
						<br>
						<div align="right">
							<input style="background-color: white;" class="btn btn-primary btn-block" type="submit" value="수정하기"> &nbsp;
							<input style="background-color: white;" class="btn btn-primary btn-block" type="reset" value="수정취소"> &nbsp;
							<button style="background-color: white;" class="btn btn-primary btn-block" onclick="javascript:history.go(-1);return false;">이전페이지로 이동</button>
							<!-- return false로 이벤트 전달 막음 -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
