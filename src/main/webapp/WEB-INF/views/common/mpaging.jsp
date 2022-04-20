<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div style="text-align: center;">
		<!-- 1페이지로 이동처리 -->
		<c:if test="${ currentPage eq 1 }">
		◀◀ &nbsp;
	</c:if>
		<c:if test="${ currentPage > 1 }">
		<!-- 전체회원 -->
			<c:url var="mlf" value="/mlist.do">
				<c:param name="page" value="1" />
			</c:url>
			<!-- 아이디로 검색한 회원 조회 -->
			<c:url var="idserach" value="/msearch.do">
				<c:param name="page" value="1" />
				<c:param name="keyword" value="${ keyword }" />
			</c:url>
			<!-- 로그인 제한/가능 회원 조회 -->
			<c:url var="loginok" value="/loginsearch.do">
				<c:param name="page" value="1" />
				<c:param name="keyword" value="${ keyword }" />
			</c:url>
			<c:if test="${ action eq 'msearch' }">
				<a href="${ idserach }">◀◀</a>
			</c:if>
			<c:if test="${ action eq 'loginsearch' }">
				<a href="${ loginok }">◀◀</a>
			</c:if>
			<c:if test="${ empty action }">
				<a href="${ mlf }">◀◀</a>
			</c:if>
		</c:if>
		<!-- 이전 페이지 그룹으로 이동 처리 -->
		<c:if
			test="${ (currentPage-10) < startPage and (currentPage)-10 > 1 }">
			<c:url var="mlf2" value="/mlist.do">
				<c:param name="page" value="${ startPage - 10 }" />
			</c:url>
			<c:url var="idserach" value="/msearch.do">
				<c:param name="page" value="${ startPage - 10 }" />
				<c:param name="keyword" value="${ keyword }" />
			</c:url>
			<c:url var="loginok" value="/loginsearch.do">
				<c:param name="page" value="${ startPage - 10 }" />
				<c:param name="keyword" value="${ keyword }" />
			</c:url>
			<c:if test="${ action eq 'msearch' }">
				<a href="${ idserach }">이전</a>
			</c:if>
			<c:if test="${ action eq 'loginsearch' }">
				<a href="${ loginok }">이전</a>
			</c:if>
			<c:if test="${ empty action }">
				<a href="${ mlf2 }">이전</a>
			</c:if>
		</c:if>
		<c:if
			test="${ !((currentPage-10) < startPage and (currentPage)-10 > 1) }">
		이전 &nbsp;	
	</c:if>

		<!-- 현재페이지가 속한 페이지 그룹 출력 -->
		<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
			<c:if test="${ p eq currentPage }">
				<font size="4" color="red"><b>[${ p }]</b></font>
			</c:if>
			<c:if test="${ p ne currentPage }">
				<c:url var="mlf5" value="/mlist.do">
					<c:param name="page" value="${ p }" />
				</c:url>
				<c:url var="idserach" value="/msearch.do">
					<c:param name="page" value="${ p }" />
					<c:param name="keyword" value="${ keyword }" />
				</c:url>
				<c:url var="loginok" value="/loginsearch.do">
					<c:param name="page" value="${ p }" />
					<c:param name="keyword" value="${ keyword }" />
				</c:url>
				<c:if test="${ action eq 'msearch' }">
					<a href="${ idserach }">${ p }</a>
				</c:if>
				<c:if test="${ action eq 'loginsearch' }">
					<a href="${ loginok }">${ p }</a>
				</c:if>
				<c:if test="${ empty action }">
					<a href="${ mlf5 }">${ p }</a>
				</c:if>
			</c:if>
		</c:forEach>

		<!-- 다음 페이지 그룹으로 이동 처리 -->
		<c:if
			test="${ (currentPage + 10) < endPage and (currentPage) + 10 > maxPage }">
			<c:url var="mlf3" value="/mlist.do">
				<c:param name="page" value="${ startPage + 10 }" />
			</c:url>
			<c:url var="idserach" value="/msearch.do">
				<c:param name="page" value="${ startPage + 10 }" />
				<c:param name="keyword" value="${ keyword }" />
			</c:url>
			<c:url var="loginok" value="/loginsearch.do">
				<c:param name="page" value="${ startPage + 10 }" />
				<c:param name="keyword" value="${ keyword }" />
			</c:url>
			<c:if test="${ action eq 'msearch' }">
				<a href="${ idserach }">다음</a>
			</c:if>
			<c:if test="${ action eq 'loginsearch' }">
				<a href="${ loginok }">다음</a>
			</c:if>
			<c:if test="${ empty action }">
				<a href="${ mlf3 }">다음</a>
			</c:if>
		</c:if>
		<c:if
			test="${ !((currentPage + 10) < endPage and (currentPage) + 10 > maxPage) }">
		다음 &nbsp;	
	</c:if>

		<!-- 끝페이지로 이동 처리 -->
		<c:if test="${ currentPage eq maxPage }">
		▶▶ &nbsp;
	</c:if>
		<c:if test="${ currentPage < maxPage }">
			<c:url var="mlf4" value="/mlist.do">
				<c:param name="page" value="${ maxPage }" />
			</c:url>
			<c:url var="idserach" value="/msearch.do">
				<c:param name="page" value="${ maxPage }" />
				<c:param name="keyword" value="${ keyword }" />
			</c:url>
			<c:url var="loginok" value="/loginsearch.do">
				<c:param name="page" value="${ maxPage }" />
				<c:param name="keyword" value="${ keyword }" />
			</c:url>
			<c:if test="${ action eq 'msearch' }">
				<a href="${ idserach }">▶▶</a>
			</c:if>
			<c:if test="${ action eq 'loginsearch' }">
				<a href="${ loginok }">▶▶</a>
			</c:if>
			<c:if test="${ empty action }">
				<a href="${ mlf4 }">▶▶</a>
			</c:if>
		</c:if>
	</div>
	</div>
</body>
</html>