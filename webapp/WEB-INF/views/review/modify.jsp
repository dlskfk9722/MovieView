<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	width:380px;
	height:650px;
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
<table border="1">
<form id="modifyForm" method="post" action="<c:url value='/review/modify' />">
<input type="hidden" name="movieNo" value="${review.movieNo }">
<input type="hidden" name="reviewNo" value="${review.reviewNo }">
<tr>
	<th>리뷰 번호 </th> 
	<td>${review.reviewNo }</td>
</tr>
<tr>
	<th>제목 </th>
	<td><input id="reviewTitle" name="reviewTitle" value= "${review.reviewTitle}"></td>
</tr>
<tr>
	<th>작성자</th>
	<td>${review.reviewWriter }</td>
</tr>
<tr>
	<th>등록일</th> 
	<td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${review.regDate }"/></td>
</tr>
<tr>
	<th>내용 </th>
	<td><textarea id="reviewContent" name="reviewContent" rows="18" cols="30" >${review.reviewContent}
	</textarea></td>
</tr>
<tr>
<td colspan="2">
	<button type="submit">수정</button>
	<button type="reset">초기화</button>
</td>
</tr>
</form>
</table>
</div>

</body>
</html>