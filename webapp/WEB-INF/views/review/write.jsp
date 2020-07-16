<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    
    
<!DOCTYPE html>
<html>
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
}
td{
	color:#fff;
	padding:7px;
}
th{
	color:#9A8260;
	font-weight:normal;
	padding:7px;
}
.insert-box{
	width:500px;
	height:550px;
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
h3{
	color:#fff;
	margin: 0 10px;
}

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="insert-box">
<h3>영화 번호: ${movie}</h3>
	<form id="writeForm" method="post" action="<c:url value='/review/write' />" enctype="multipart/form-data">
	<input type="hidden" name="movieNo" value="${movie}">
	<table class="insert-table">
	<th colspan = "2">${movie} 리뷰 작성</th> 
	<tr>
		<th>작성자</th>
		<td><input id="reviewWriter" name="reviewWriter" value="${sessionScope.loginId }" readonly></td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td><input id="reviewTitle" name="reviewTitle"></td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td><textarea id="reviewContent" name="reviewContent" rows="20" cols="22" > </textarea></td>
		
	</tr>
	<tr>
		<th>이미지파일</th>
		<td><input type="file" name="file"></td>
		
	</tr>
	
	</table>
	
	<div class="button">
		<button type="reset">초기화</button>
		<button type="submit">등록 </button>
		<button type="button" id="backBtn"><a href="/movieboard/content?movieNo=${movie }">이전페이지</a></button>
	</div>
	
	</form>
</div>

<jsp:include page="include/plugin-js.jsp"/>

</body>

<script type="text/javascript">
$(document).ready(function(){
		//글쓰기 버튼 클릭 이벤트
		$("#backBtn").on("click", function(){
			self.location = "/movieboard/content?=${movie}";
		});
		
});
</script>
		
</html>