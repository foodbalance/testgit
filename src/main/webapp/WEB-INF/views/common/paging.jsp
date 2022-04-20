<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="listCount" value="${ requestScope.listCount }"/>
<c:set var="startPage" value="${ requestScope.startPage }"/>
<c:set var="endPage" value="${ requestScope.endPage }"/>
<c:set var="maxPage" value="${ requestScope.maxPage }"/>
<c:set var="currentPage" value="${ requestScope.currentPage }"/>
<c:set var="menu" value="${ requestScope.menu }"/>      
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div style="text-align:center;">
<!-- =================================게시판 페이징 ========================================= -->	
<c:if test="${ menu eq 'board' }">
	<!-- 1페이지로 이동 처리 -->
	   <c:if test="${ currentPage == 1 }">
	   	◀◀ &nbsp;
	   </c:if>
	   <c:if test="${ currentPage > 1 }">
	   	<c:url var="blf" value="/blist.do">
	   		<c:param name="page" value="1"/>
	   	</c:url>
	   	<a href="${ blf }">◀◀</a>
	   </c:if>
	<!-- 이전 페이지 그룹으로 이동 처리 -->
		<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
			<c:url var="blf2" value="/blist.do">
	   		<c:param name="page" value="${ startPage - 10 }"/>
	   	</c:url>
	   	<a href="${ blf2 }">이전</a>
		</c:if>
		<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
			이전 &nbsp;
		</c:if>
	<!-- 이전 페이지 그룹으로 이동 처리 end-->	
	<!-- 현재 페이지가 속한 페이지 그룹 출력 -->
		<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
			<c:if test="${ p eq currentPage }">
				<font size="4" color="red"><b>[${ p }]</b></font>
			</c:if>
			<c:if test="${ p ne currentPage }">
				<c:url var="blf5" value="/blist.do">
	   				<c:param name="page" value="${ p }"/>
	   			</c:url>
	   			<a href="${ blf5 }">${ p }</a>
			</c:if>		
		</c:forEach>
	<!-- 현재 페이지가 속한 페이지 그룹 출력 end-->
	<!-- 다음 페이지 그룹으로 이동 처리 -->
		<c:if test="${ (currentPage + 10) > endPage and (currentPage + 10) < maxPage }">
			<c:url var="blf3" value="/blist.do">
	   			<c:param name="page" value="${ endPage + 10 }"/>
	   		</c:url>
	   		<a href="${ blf3 }">다음</a>
		</c:if>
		<c:if test="${ !((currentPage + 10) > endPage and (currentPage + 10) < maxPage) }">
			다음 &nbsp;
		</c:if>
	<!-- 다음 페이지 그룹으로 이동 처리end -->
	
	<!-- 끝페이지로 이동 처리 -->
	   <c:if test="${ currentPage == maxPage }">
	   		▶▶ &nbsp;
	   </c:if>
	   <c:if test="${ currentPage < maxPage }">
		   	<c:url var="blf4" value="/blist.do">
		   		<c:param name="page" value="${ maxPage }"/>
		   	</c:url>
		   	<a href="${ blf4 }">▶▶</a>
	   </c:if>
	<!-- 끝페이지로 이동 처리 end-->
</c:if>
<!-- =================================게시판 페이징 ========================================= -->	



<!-- =================================공지 페이징 ========================================= -->	
<c:if test="${ menu eq 'notice' }">
	<!-- 1페이지로 이동 처리 -->
	   <c:if test="${ currentPage == 1 }">
	   	◀◀  &nbsp;
	   </c:if>
	   <c:if test="${ currentPage > 1 }">
	   	<c:url var="nlf" value="/nlist.do">
	   		<c:param name="page" value="1"/>
	   	</c:url>
	   	<a href="${ nlf }">◀◀</a>
	   </c:if>
	<!-- 이전 페이지 그룹으로 이동 처리 -->
		<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
			<c:url var="nlf2" value="/nlist.do">
	   		<c:param name="page" value="${ startPage - 10 }"/>
	   	</c:url>
	   	<a href="${ nlf2 }">이전</a>
		</c:if>
		<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
			이전 &nbsp;
		</c:if>
	<!-- 이전 페이지 그룹으로 이동 처리 end-->	
	<!-- 현재 페이지가 속한 페이지 그룹 출력 -->
		<c:forEach var="p1" begin="${ startPage }" end="${ endPage }" step="1">
			<c:if test="${ p1 eq currentPage }">
				<font size="4" color="red"><b>[${ p1 }]</b></font>
			</c:if>
			<c:if test="${ p1 ne currentPage }">
				<c:url var="nlf5" value="/nlist.do">
	   				<c:param name="page" value="${ p1 }"/>
	   			</c:url>
	   			<a href="${ nlf5 }">${ p1 }</a>
			</c:if>		
		</c:forEach>
	<!-- 현재 페이지가 속한 페이지 그룹 출력 end-->
	<!-- 다음 페이지 그룹으로 이동 처리 -->
		<c:if test="${ (currentPage + 10) > endPage and (currentPage + 10) < maxPage }">
			<c:url var="nlf3" value="/nlist.do">
	   			<c:param name="page" value="${ endPage + 10 }"/>
	   		</c:url>
	   		<a href="${ nlf3 }">다음</a>
		</c:if>
		<c:if test="${ !((currentPage + 10) > endPage and (currentPage + 10) < maxPage) }">
			다음 &nbsp;
		</c:if>
	<!-- 다음 페이지 그룹으로 이동 처리end -->
	
	<!-- 끝페이지로 이동 처리 -->
	   <c:if test="${ currentPage == maxPage }">
	   	▶▶ &nbsp;
	   </c:if>
	   <c:if test="${ currentPage < maxPage }">
		   	<c:url var="nlf4" value="/nlist.do">
		   		<c:param name="page" value="${ maxPage }"/>
		   	</c:url>
		   	<a href="${ nlf4 }">▶▶</a>
	   </c:if>
	<!-- 끝페이지로 이동 처리 end-->
</c:if>
<!-- =================================공지 페이징 ========================================= -->	
	</div>
</body>
</html>