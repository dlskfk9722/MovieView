<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/static-head.jsp"/>
<style type="text/css">
.clearfix::after{content:''; display:block; clear:both;}
* {
	margin: 0;
	padding: 0;
	list-style: none;
	text-decoration: none;
}

a:link {
	text-decoration: none;
}
body {
	background-color: #090B08;
	width:100%; height: 100%;
}
td{
	color:#fff;
	padding:7px;
}
th{
	color:#9A8260;
	font-weight:normal;
	padding:7px;
	width:100px;
}
.title{
	color:#fff;
}
.insert-box{
	width:800px;
	height:850px;
	margin: 0 auto;
	border: 1px #fff solid;
	margin-top:30px;
}
.insert-table{
	margin: 0 auto;
	decoration:none;
}
.button{
	position:relative;
	float:right;
	padding:0 20px 20px 20px;
}
.button a{
	color:#fff;
}
.button a:hover{
	color:#9A8260;
}
h3{
	color:#fff;
	margin: 0 10px;
}
.star{
	width:230px;
	margin:0 auto;
	margin-top:20px;
}
.star p{color:#fff;}
</style>
<meta charset="UTF-8">
<title>content page</title>

</head>
<body>

<div class="insert-box">
<table class="insert-table" border="1">
<th class="title" colspan="4">리뷰 게시물 내용</th>

<tr>
	<th width="300">리뷰 번호 </th>
	<td width="300"> ${review.reviewNo }</td>
	
	<th width="200">등록일 </th>
	<td width="200"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${review.regDate }"/></td>
</tr>

<tr>
	<th width="300">작성자 </th>
	<td width="300"> ${review.reviewWriter}</td>
	
	<th width="200">조회수 </th>
	<td width="200"> ${review.viewCnt }</td>
</tr>

<tr>
	<th width="300"> 제목 </th>
	<td width="300"> ${review.reviewTitle }</td>
	<th width="200">별점</th>
	<td width="200"><c:set var="starTotal" value="${review.starSum == 0 ? 0 : review.starSum/review.starCnt}"/>
		<fmt:formatNumber type="number" pattern="0.0" value="${starTotal}"/></td>
</tr>

<tr>
	<th height="600">내용  </th>
	 <td colspan="3" style="background-color:#090B08;"><div class="box-body" style="color:white; width:650px; height:600px;"><c:set var="len" value="${fn:length(review.fileName)}"/>
		<c:set var="filetype" value="${fn:toUpperCase(fn:substring(review.fileName, len-4, len))}" />
			<c:choose>
				<c:when test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.GIF') or (filetype eq '.PNG') or (filetype eq '.jpg')}">
					<div style="text-align:center"><br><img src="<c:url value='/review/file/${review.fileId}'/>" alt="" style="width:200px; height:200px;"></div>
				</c:when>
			</c:choose><br>
	 ${review.reviewContent}</div> </td>
</tr>
</table>

	<div class="button">
		<c:if test="${sessionScope.loginId == review.reviewWriter || sessionScope.loginLevel == 1 }">
			<a href="<c:url value='/review/modify?reviewNo=${review.reviewNo}&movieNo=${review.movieNo }'/>">
			수정</a>
			<a href="<c:url value='/review/delete?reviewNo=${review.reviewNo}&movieNo=${review.movieNo }'/>">
			삭제</a>
		</c:if>
			<a href="<c:url value='/movieboard/content?movieNo=${review.movieNo }'/>">
			목록</a>
	</div>
</div>

<div class="star">
	<form id="starForm" method="post" action="<c:url value='/movieboard/star' />">
		<input type="hidden" name="movieNo" value="${review.movieNo}">
		<input type="hidden" name="reviewNo" value="${review.reviewNo }">
		<p>이 리뷰의 점수는? 
		<select id="starSum" name="starSum">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
		</select>
		<button type="submit" id="starReg"> 등록 </button>
		</p>
	</form>
</div>

<%@ include file="../reply/write.jsp" %>
<jsp:include page="../include/plugin-js.jsp" />
</body>
</html>