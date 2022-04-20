<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="listCount" value="${ requestScope.listCount }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title></title>
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

<script type="text/javascript">
function showWriteForm() {
	location.href = "${ pageContext.servletContext.contextPath }/fwform.do";
}
</script>
</head>
<body>

<c:import url="/WEB-INF/views/common/loginSession.jsp" />
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<!-- jstl에서 절대경로로 표기 : /WEB-INF/views/common/menubar.jsp -->
<hr>
<h1 align="center">인기고양이 정보 관리자</h1>
<!-- 로그인 한 회원이 관리자인 경우는 공지사항 등록 버튼이 보이게 함 -->
<%-- <center>
<c:if test="${ loginMember.admin_ok eq 'Y' }">
	<!-- jsp에서 jsp로의 이동은 반드시 컨트롤러로 페이지 이동 요청을 해서 페이지가 바뀌게 함 
		  스프링에서는 뷰리졸버를 거쳐서 뷰페이지가 바뀌게 처리하도록 되어있음-->
	<button onclick="javascript:location.href=
	'${ pageContext.servletContext.contextPath }/WEB-INF/views/notice/noticeWriteForm.jsp';">공지글 등록</button>
	<button onclick="javascript:location.href='movewrite.do';">새 인기고양이글 등록</button>
</c:if>

</center> --%>

<!-- 목록 출력 -->
<br>
<table align="center" width="800" border="2" cellspacing="0" cellpadding="2">
	<tr><th>번호</th><th>제목</th><th>작성자</th><th>첨부파일</th></tr>
	<c:forEach items="${ requestScope.list }" var="f">
		<tr align="center">
			<td>${ f.register_num }</td>
			<!-- 공지 제목 클릭시 상세보기로 넘어가게 처리 -->
			<c:url var="fdt" value="/fdetail.do">
				<c:param name="register_num" value="${ f.register_num }" />
			</c:url>
			<td><a href="${ fdt }">${ f.cat_name }</a></td>
			<td>${ f.user_id }</td>
			<td>
				<c:if test="${ !empty f.cat_original_img }">◎</c:if>
				<c:if test="${ empty f.cat_rename_img }">&nbsp;</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
<br>
<!-- 페이징 처리 -->
<div style="text-align:center;">
<!-- 1페이지로 이동 처리 -->
<c:if test="${ currentPage eq 1 }">
	[맨처음] &nbsp;
</c:if>
<c:if test="${ currentPage gt 1 }">
	<c:url var="flf" value="/flist.do">
		<c:param name="page" value="1" />
	</c:url>
	<a href="${ flf }">[맨처음]</a>
</c:if>

<!-- 이전페이지 그룹으로 이동처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
	<c:url var="flf2" value="/flist.do">
		<c:param name="page" value="${ startPage - 10 }" />
	</c:url>
	<a href="${ flf2 }">[이전그룹]</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
	[이전그룹] &nbsp;
</c:if>

<!-- 현재 페이지가 속한 페이지 그룹 출력 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
	<c:if test="${ p eq currentPage }">
	 <font size="4" color="red"><b>[${ p }]</b></font>
	</c:if>
	<c:if test="${ p ne currentPage }">
		<c:url var="flf5" value="/flist.do">
		<c:param name="page" value="${ p }" />
	</c:url>
	<a href="${ flf5 }">${ p }</a>
	</c:if>
</c:forEach>

<!-- 다음페이지 그룹으로 이동처리 -->
<c:if test="${ (currentPage - 10) < endPage and (currentPage - 10) < maxPage }">
	<c:url var="flf3" value="/flist.do">
		<c:param name="page" value="${ endPage + 10 }" />
	</c:url>
	<a href="${ flf3 }">[다음그룹]</a>
</c:if>
<c:if test="${ !((currentPage - 10) < endPage and (currentPage - 10) < maxPage) }">
	[다음그룹] &nbsp;
</c:if>

<!-- 끝페이지로 이동 처리 -->
<c:if test="${ currentPage eq maxPage }">
	[맨끝] &nbsp;
</c:if>
<c:if test="${ currentPage < maxPage }">
	<c:url var="flf4" value="/flist.do">
		<c:param name="page" value="${ maxPage }" />
	</c:url>
	<a href="${ flf4 }">[맨끝]</a>
</c:if>
</div>
<hr style="clear: both;">
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>