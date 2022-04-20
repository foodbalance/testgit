<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${ requestScope.page }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">${ famous.register_num } 인기고양이 정보 수정 페이지</h2>
<br>
<!-- 원글 수정 폼 -->
<c:if test="${ famous.cat_explain eq 1 }">
<!-- form에서 입력된 값들과 첨부파일을 같이 전송하려면, 반드시 enctype 속성을 추가해야 함
	 enctype="multipart/form-data" 값을 지정해야 함 -->
<form action="fupview.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="register_num" value="${ famous.register_num }">
<input type="hidden" name="page" value="${ currentPage }">

<c:if test="${ !empty famous.famous_cat_original_img }">
	<input type="hidden" name="cat_original_img" value="${ famous.famous_cat_original_img }">
	<input type="hidden" name="cat_rename_img" value="${ famous.famous_cat_rename_img }">
</c:if> 

<table align="center" width="800" border="1" cellspacing="0" cellpadding="5">
	<tr><th>고양이 이름</th><td><input type="text" name="cat_name" value="${ famous.cat_name }"></td></tr>
	<tr><th>첨부파일</th>
		<td>
		<!-- 원래 첨부파일이 있는 경우 -->
		<c:if test="${ !empty famous.famous_cat_original_img }">
			${ famous.famous_cat_original_img } &nbsp;
			<input type="checkbox" name="delFlag" value="yes"> 파일삭제 <br>
		</c:if>
		<br>
		새로 첨부 : <input type="file" name="upfile">
		</td></tr>
	<tr><th>상세 설명</th><td><textarea name="cat_explain" rows="5" cols="50">${ famous.cat_explain }</textarea></td></tr>
	<tr><td colspan="2">
		<input type="submit" value="수정하기"> &nbsp;
		<input type="reset" value="수정취소"> &nbsp;
		<button onclick="javascript:history.go(-1); return false;">이전페이지로 이동</button></td></tr>
</table>
</form>
</c:if>
<hr>
<%-- <c:import url="/WEB-INF/views/common/footer.jsp" /> --%>
</body>
</html>