<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/static-head.jsp" />
<jsp:include page="../include/plugin-js.jsp"/>
<title>movieboard_content</title>
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

.bar{padding-left:28px;margin:0 auto;margin-top:160px;color:#fff;font-family:'Raleway Medium' font-size:20px;line-height:35px; width:1260px; height:35px;background-color:#a78f6f;}

.content{
	width: 100%;
	margin: 0 auto;

}
.standard{width:1260px;height:600px;margin:0 auto;}
.standard .img{width:500px;height:270px;margin:37px 0 0 100px;position:relative;float:left;background-color:red;}
.standard .writing{ width:500px;height:270px; margin: 37px 0 0 0;position:relative; float:right;}
.standard p.subtitle{color:#fff; font-size:16px;font-family:'Cormorant Garamond Regular'; line-height:10px;}
.standard p.title{color:#fff; font-size:23px;font-family:'Cormorant Garamond SemiBold'; line-height:18px;}
.standard .content{color:#fff; font-size:10px; line-height:22px; font-family:'NotoSansCJKkr Bold';}
.standard .link{font-size:11px; font-family:'Raleway Medium'; text-decoration:underline;}
.standard .link a{color:#2051ac; }


.standard a{
	color:#fff;
}
.standard a:hover{
	color:black;
}
button{
	background-color:#9A8260;
}
.review{
	margin: 0 auto;
}
.write_review{
	position:relative;float:right;
	margin: 0 auto;
	margin:20px 0;
	width:200px;
}
.find{
	margin:0 auto;
	margin-top:50px;
	width:310px;
}
table{width:1000px;margin: 0 auto;}
td {
	color: white;
	text-align: center;
}
td a{
	color: #9A8260;
	text-align: center;
}
td a:hover{
	color: #fff;
}

tr th {
	color: #9A8260;
	text-align: center;
}
.reply-num{
	width:800px;
	margin:50px auto;
}
.reply-num li a{
	color:#fff !important;
}
.reply-num li a:hover{
	color:#fff;
}

</style>
</head>
<body>

<jsp:include page="../include/main-navi.jsp" />

<div class="container">
<div class="content">
	<div class="bar">${movie.title }</div>

		<div class="standard clearfix">
			<div class="img">			
				<c:set var="len" value="${fn:length(image.fileName)}" />
				<c:set var="filetype"
						value="${fn:toUpperCase(fn:substring(image.fileName, len-4, len))}" />
					<!--<c:out value="len : ${len}, <br> filetype : ${filetype}"/> -->
					<c:choose>
							<c:when
								test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.GIF') or (filetype eq '.PNG') or (filetype eq '.jpg')}">
								<img src="<c:url value='/movieboard/file/${image.fileId}'/>"
								alt="" style="width: 600px; height: 500px;">
							</c:when>

					<c:otherwise>
							<img src="<c:url value='/resources/img/NoIMG.jpg'/>"
								style="width: 600px; height: 500px;">
							</c:otherwise>

							</c:choose>
									
				</div>
			<div class="writing">
			<p class="subtitle">${movie.genre }</p>
			<p class="title">${movie.title }</p>
			<p class="content"></br>국가: ${movie.nation }</br>개봉일: ${movie.openDate }</br>감독: ${movie.director }</br>배우: ${movie.actor }</p>
			<p class="link"><br><span style="color:white;">줄거리</span><br><br><textarea id="synoposis" name="synoposis" rows="15" cols="40" readonly style="background-color:#090B08; color:white;">${movie.synoposis }</textarea></p>
			<c:if test="${sessionScope.loginLevel == 1 }">
		<a href="/movieboard/update?movieNo=${movie.movieNo }">수정</a>
		<a href="/movieboard/delete?movieNo=${movie.movieNo }">삭제</a>
		</c:if>
		<a href="/movieboard/list">목록으로</a>
			</div>
	</div>

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<b style="color: white;">리뷰</b><span style="color:white;">&nbsp;게시판</span>
	</div>
	<div class="col-md-2 write_review">
		<c:if test="${sessionScope.loginId != null }">
		<input type="button" id="writeBtn" onclick="writeBtn_click();" value="리뷰 작성"></c:if>
	</div>
</div>


<div class="row">
<div class="review">
	<table border = "1">
	<tr>
		<th>IMG_TEST</th>
		<th>TITLE</th>
		<th>WRITER</th>
		<th>REGDATE</th>
		<th>VIEW_CNT</th>
		<th>리뷰점수</th>
	</tr>
	
	<c:if test="${reviews.size() <= 0 }">
		<tr>
			<td> 검색 결과가 없습니다</td>
		</tr>
		
	</c:if>
	
	<c:forEach var="review" items="${reviews }">
	<tr>
	<!-- 이미지파일 불러오기 -->
		<td>
		<c:set var="len" value="${fn:length(review.fileName)}"/>
		<c:set var="filetype" value="${fn:toUpperCase(fn:substring(review.fileName, len-4, len))}" />
			<c:choose>
				<c:when test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.GIF') or (filetype eq '.PNG') or (filetype eq '.jpg')}">
					<img src="<c:url value='/review/file/${review.fileId}'/>" alt="" style="width:100px; height:100px;">
				</c:when>
				
				<c:otherwise>
					<img src="<c:url value='/resources/img/NoIMG.jpg'/>" style="width:100px; height:100px;">
				</c:otherwise>
			
			</c:choose>
		</td>
		<td>
		<a href="<c:url value='/review/content${pageCreator.makeSearchURI(pageCreator.criteria.page)}&reviewNo=${review.reviewNo}'/>">
		${review.reviewTitle }
		</a>
		</td>
		<td>${review.reviewWriter }</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${review.regDate }"/></td>
		<td align="center">${review.viewCnt }</td>
		<td align="center">
		<c:set var="starTotal" value="${review.starSum == 0 ? 0 : review.starSum/review.starCnt}"/>
		<fmt:formatNumber type="number" pattern="0.0" value="${starTotal}"/>
		</td>
		
	</tr>
	</c:forEach>
	</table>
</div>

</div> <!-- ./end content row -->

<br><br>


<div class="row">
<ul class="pagination justify-content-center">
		<c:if test="${pageCreator.prev}">                                
			<li class="page-item"><a class="page-link" href="<c:url value='/movieboard/content${pageCreator.makeSearchURI(pageCreator.beginPage - 1)}&movieNo=${movie.movieNo }' />">이전</a></li> 
		</c:if>                               
					              
		<c:forEach var="idx" begin="${pageCreator.beginPage}" end="${pageCreator.endPage}">  
		<li class="page-item">            
			<a class="page-link" href="<c:url value='/movieboard/content${pageCreator.makeSearchURI(idx)}&movieNo=${movie.movieNo }'/>">${idx}
		</a> </li>                                
		</c:forEach>    
					              
		<c:if test="${pageCreator.next}">               
			<li class="page-item"><a class="page-link" href="<c:url value='/movieboard/content${pageCreator.makeSearchURI(pageCreator.endPage + 1)}&movieNo=${movie.movieNo }' />">다음</a></li>
		</c:if>
</ul>	
				         	

</div>

<!-- 검색 -->
<div class="row">
	<div class="find">
		<select id="condition" name="condition">
			<option value="title" <c:out value="${param.condition == 'title' ? 'selected' : ''}"/>>제목</option>
			<option value="content" <c:out value="${param.condition == 'content' ? 'selected' : ''}"/>>내용</option>
			<option value="writer" <c:out value="${param.condition == 'writer' ? 'selected' : ''}"/>>작성자</option>
		</select>
		<input type="text" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="검색어">
		<button type="button" id="searchBtn">
			검색
		</button>
	</div>
	</div>
</div>
</div> <!-- ./end container -->




<script type="text/javascript">
const result = "${message}";

if(result == "regSuccess"){
	alert("게시물 등록이 완료되었습니다.");
}
else if(result =="modSuccess"){
	alert("게시물 수정이 완료되었습니다.");
}
else if(result =="delSuccess"){
	alert("게시물 삭제가 완료되었습니다.")
}
else if(result == "starSuccess"){
	alert("별점 등록이 완료되었습니다.")
}


function writeBtn_click(){
	//alert("버튼을 누르셨습니다.");
	window.location.href='/review/write?movieNo=${movie.movieNo}';
}


//JQUERY
$(document).ready(function(){
	//글쓰기 버튼 클릭 이벤트
	$("#testBtn").on("click", function(){
		console.log("write test");
		self.location = "/review/write?movieNo=${review.movieNo}";
	});
	
	//검색버튼 클릭이벤트
	$("#searchBtn").on("click", function(){
		console.log("search event");
		self.location = "/movieboard/content${pageCreator.makePageURI(1)}"
						+ "&condition=" + $("select option:selected").val()
						+ "&keyword=" + $("#keywordInput").val()+"&movieNo=${movie.movieNo}";
	});
	
	
});
</script>
</body>
</html>