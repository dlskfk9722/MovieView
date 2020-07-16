<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/static-head.jsp" />
<style type="text/css">
a{color:#373737;}
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

.row {
	margin-bottom: 4px;
	margin-top: 100px;
}

td {
	color: white;
	text-align: center;
}

tr th {
	color: #64a19d;
	text-align: center;
}

.input-group {
	width: 800px;
	margin: 0 auto;
}
.title{
	width: 800px;
	margin: 0 auto;
}
.input-group-prepend {
	margin-right: 10px;
	width: 90px;
	background-color: #e9ecef;
	height: 40px;
	text-align: center;
	display: inline;
	padding-top: 6px;
}

.btn-primary {
	margin-left: 10px;
	height: 40px;
	width: 90px;
}

.pagination {
	width: 35%;
	margin: 0 auto;
}
.list {
	width: 100%;
	margin: 0 auto;
}
div.photomenu {
	width: 1260px;
	margin-top: 160px;
}

.photomenu>ul.menu {
	height: 63px;
	width: 1260px;
	margin: 0 auto;
	background-color: #9A8260;
	margin: 63px 0;
}

.photomenu>ul.menu>li {
	color: #868686;
	cursor: pointer;
	font-family: 'Raleway Medium';
	letter-spacing: 0.95px;
	font-size: 13px;
	float: left;
	line-height: 13px;
	margin: 26px 136px;
}

.photomenu>ul.menu>li a {
	color: #fff;
}

.photomenu>ul.menu>li a:hover {
	color: #363838;
}

.photomenu>ul.menu>li:hover {
	color: #363838;
}
.title a:hover{
	color:#9A8260;
}
.title a{
	color:#fff;
}
.photoWrap {
	width: 1170px;
	margin: 0 auto;
}

.photoWrap .what li {
	position: relative;
	top: 0px;
	background-color: #1d1e1e;
	width: 288px;
	height: 382px;
	float: left;
	margin: 0 4px 12px 0;
}

.photoWrap .photos li:nth-child(4) {
	margin-right: 0;
}

.photoWrap .photos .img {
	width: 288px;
	height: 220px;
}

.photoWrap .photos li  .title {
	position: absolute;
	top: 220px;
	left: 60px;
	width: 160px;
	font-family: 'Raleway Medium';
	letter-spacing: 0.75px;
	color: #9a8260;
	font-size: 15px;
	padding: 15px 0;
}

.photoWrap .photos li  p {
	position: absolute;
	width:160px;
	top: 260px;
	left: 60px;
	text-align: center;
	padding: 0 30px 34px 30px;
	font-family: 'Raleway Medium';
	letter-spacing: 0.75px;
	line-height: 10px;
	color: #fff;
	font-size: 9px;
}

.photoWrap .photos li .button {
	border: 2px solid #c5a579;
	background-color: #1d1e1e;
	border-radius: 3px;
	width: 131px;
	height: 33px;
	position: absolute;
	top: 300px;
	left: 75px;
	font-size: 12px;
	font-family: 'Raleway Medium';
	letter-spacing: 0.2px;
	line-height: 33px;
	text-align: center;
}

.photoWrap .photos li .button a {
	color: #fff;
}

.photoWrap .photos li .button:hover {
	background-color: #c5a579;
}

.what li {
	display: block;
}
.write{
	background-color:#9A8260;
	margin: 0 10px;
}
.write a{
	color:white;
}
.write a:hover{
	color:#363838;
}
.btn-primary{
	background-color:#9A8260;
}
.btn-primary:hover{
	background-color:#9A8260;
}
</style>
</head>
<body>
	<jsp:include page="../include/main-navi.jsp" />
	<div class="list">
			<div class="photomenu">
				<ul class="menu clearfix">
					<li class="menu1"><a href="/movieboard/list?searchGenre=액션">액션</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/movieboard/list?searchGenre=사극">사극</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/movieboard/list?searchGenre=판타지">판타지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/movieboard/list?searchGenre=코미디">코미디</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/movieboard/list?searchGenre=SF">SF</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/movieboard/list?searchGenre=감동">감동</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/movieboard/list?searchGenre=로맨스">로맨스</a>
					</li>
				</ul>
				<table class="table" border="1">

					<div class="photoWrap clearfix">

						<c:forEach var="list" items="${movielist }">
							<ul class="photos what">
								<li>
										<div class="img" align="center">

										
											<c:set var="len" value="${fn:length(list.fileName)}" />
											<c:set var="filetype"
												value="${fn:toUpperCase(fn:substring(list.fileName, len-4, len))}" />
												<c:out value="len : ${len}, <br> filetype : ${filetype}"/> 
											<c:choose>
												<c:when
													test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.GIF') or (filetype eq '.PNG') or (filetype eq '.jpg')}">
													<img src="<c:url value='/movieboard/file/${list.fileId}'/>"
														alt="" style="width: 200px; height: 200px;">
												</c:when>

												<c:otherwise>
													<img src="<c:url value='/resources/img/NoIMG.jpg'/>"
														style="width: 200px; height: 200px;">
												</c:otherwise>

											</c:choose>
									
									</div>

									<p class="title">${list.movieNo }
										<a href="/movieboard/content?movieNo=${list.movieNo }">${list.title }</a>
									</p>
									<p class="subtitle">${list.genre }</br>개봉일: ${list.openDate }</br>${list.score }</p>
									<div class="button">
										<a href="/movieboard/content?movieNo=${list.movieNo }">LEARN
											MORE</a>
									</div>
								</li>

							</ul>
						</c:forEach>
					</div>



					<tr>
						<td class ="write" colspan ="8" style ="text-align: left">
							<a href="/movieboard/list">&nbsp;&nbsp;목록 초기화</a>
						</td>
						<c:if test="${sessionScope.loginLevel == 1 }">
							<td class="write" colspan="8" style="text-align: right">
								<a href="/movieboard/insert">게시물 작성&nbsp;&nbsp;</a>
							</td>
						</c:if>
					</tr>
				</table>


			</div>
</div>

		<div class="footer">
			<ul class="pagination">
				<li class="page-item"><c:if test="${pageCri.prev }">
						<a class="page-link"
							href="/movieboard/list?page=${pageCri.beginPage-1}&condition=${cri.condition}&keyword=${cri.keyword}&searchGenre=${cri.searchGenre}">이전</a>
					</c:if></li>
				<c:forEach var="number" begin="${pageCri.beginPage }"
					end="${pageCri.endPage }" step="1">
					<li class="page-item"><a class="page-link"
						href="/movieboard/list?page=${number }&condition=${cri.condition}&keyword=${cri.keyword}&searchGenre=${cri.searchGenre}">${number }</a></li>
				</c:forEach>
				<li class="page-item"><c:if test="${pageCri.next }">
						<a class="page-link"
							href="/movieboard/list?page=${pageCri.endPage+1}&condition=${cri.condition}&keyword=${cri.keyword}&searchGenre=${cri.searchGenre}">다음</a>
					</c:if></li>
			</ul>
			<br>
			<form
				action="/movieboard/list?condition=${cri.condition }&keyword=${cri.keyword}&searchGenre=${cri.searchGenre}"
				method="GET">
				<div class="input-group">
					<div class="input-group-prepend">제목</div>
					<input type="text" name="keyword" class="form-control"
						placeholder="입력바람"> <input type="hidden"
						name="searchGenre" value="${cri.searchGenre }"> <input
						type="hidden" name="condition" value="title">
					<button type="submit" class="btn-primary">검색</button>
				</div>
			</form>
		</div>


		<script type="text/javascript">
			const result = "${message}";
			if (result === "insertSuccess") {
				alert("게시글 작성이 완료되었습니다.");
			} else if (result === "delSuccess") {
				alert("게시글 삭제가 완료되었습니다.")
			} else if (result === "updateSuccess") {
				alert("게시글 수정이 완료되었습니다.")
			}
		</script>
</body>
</html>