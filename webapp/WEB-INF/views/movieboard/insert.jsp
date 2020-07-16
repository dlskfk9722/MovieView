<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	height:680px;
	margin: 0 auto;
	border: 1px #fff solid;
	margin-top:30px;
}
.insert-table{
	margin: 0 auto;
	margin-top:20px;
}

</style>

<head>
<meta charset="UTF-8">
<jsp:include page="../include/static-head.jsp"/>
</head>
<body style="background-color:#090B08;">

<div class="insert-box">
	<table class="insert-table">
	<form action="/movieboard/insert" method="POST" enctype="multipart/form-data">
	<tr>
		<th>제목</th>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<th>장르</th>
		<td>
		<select id="condition" class="form-control" name="genre">
			<option value="액션" >액션</option>
			<option value="판타지" >판타지</option>
			<option value="SF" >SF</option>
			<option value="로맨스" >로맨스</option>
			<option value="코미디">코미디</option>
			<option value="사극">사극</option>
			<option value="감동">감동</option>
	    </select></td>
	</tr>
	<tr>
		<th>국가</th>
		<td><input type="text" name="nation"></td>
	</tr>
	<tr>
		<th>개봉일</th>
		<td><input type="date" name="openDate"></td>
	</tr>
	<tr>
		<th>감독</th>
		<td><input type="text" name="director"></td>
	</tr>
	<tr>
		<th>배우</th>
		<td><input type="text" name="actor"></td>
	</tr>
	<tr>
		<th>줄거리</th>
		<td><textarea id="synoposis" name="synoposis" rows="12" cols="40"
	             placeholder="내용을 입력해주세요" style="resize: none;"></textarea></td>
	</tr>
	<tr>
	<td>이미지파일</td>
	<td><input type="file" name="file"></td>
	</tr>
	<tr>
		<th></th>
		<td><input type="submit" value="작성"></td>
	</tr>
	</form>
	</table>
</div>
</body>
</html>