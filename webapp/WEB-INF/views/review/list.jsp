<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>

<style> 
ul{
	list-style: none;
}
</style>


<meta charset="UTF-8">
<title>목록보기</title>
</head>
<body>
<table border = "1">
<tr>
	<th>ReviewNO</th>
	<th>TITLE</th>
	<th>WRITER</th>
	<th>CONTENT</th>
	<th>REGDATE</th>
	<th>VIEW_CNT</th>
</tr>

<c:if test="${reviews.size() <= 0 }">
	<tr>
		<td> 검색 결과가 없습니다</td>
	</tr>
	
</c:if>

<c:forEach var="review" items="${reviews }">
<tr>
	<td align="center">${review.reviewNo }</td>
	<td>
	<a href="<c:url value='/review/content${pageCreator.makeSearchURI(pageCreator.criteria.page)}&reviewNo=${review.reviewNo}'/>">
	${review.reviewTitle }
	</a>
	</td>
	<td>${review.reviewWriter }</td>
	<td>${review.reviewContent }</td>
	<td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${review.regDate }"/></td>
	<td align="center">${review.viewCnt }</td>
</tr>
</c:forEach>
</table>

<input type="button" id="writeBtn" onclick="writeBtn_click();" value="리뷰 작성">
 
<div>
<ul>
		<c:if test="${pageCreator.prev}">                                
			<li><a href="<c:url value='/review/list${pageCreator.makeSearchURI(pageCreator.beginPage - 1)}' />">이전</a></li> 
		</c:if>                               
					              
		<c:forEach var="idx" begin="${pageCreator.beginPage}" end="${pageCreator.endPage}">              
			<!--<c:out value="${pageCreator.criteria.page == idx ? 'class=active' : ''}"/> -->
			<a href="<c:url value='/review/list${pageCreator.makeSearchURI(idx)}'/>">${idx}  </a>                                
		</c:forEach>    
					              
		<c:if test="${pageCreator.next}">               
			<li><a href="<c:url value='/review/list${pageCreator.makeSearchURI(pageCreator.endPage + 1)}' />">다음</a></li>
		</c:if>
</ul>					         	
</div>

<!-- 검색 -->
<div>
	<select id="condition" name="condition">
		<option value="title" <c:out value="${param.condition == 'title' ? 'selected' : ''}"/>>제목</option>
		<option value="content" <c:out value="${param.condition == 'content' ? 'selected' : ''}"/>>내용</option>
		<option value="writer" <c:out value="${param.condition == 'writer' ? 'selected' : ''}"/>>작성자</option>
	</select>
</div>

<div>
	<input type="text" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="검색어">
	<button type="button" id="searchBtn">
		검색
	</button>
</div>
<jsp:include page="include/plugin-js.jsp"/>

</body>



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
	

	function writeBtn_click(){
		//alert("버튼을 누르셨습니다.");
		window.location.href='http://localhost:8181/review/write';
	}
	
	//맵핑문제, 학원가서체크
	//JQUERY
	$(document).ready(function(){
		//글쓰기 버튼 클릭 이벤트
		$("#testBtn").on("click", function(){
			console.log("write test");
			self.location = "/review/write";
		});
		
		//검색버튼 클릭이벤트
		$("#searchBtn").on("click", function(){
			console.log("search event");
			self.location = "/review/list${pageCreator.makePageURI(1)}"
							+ "&condition=" + $("select option:selected").val()
							+ "&keyword=" + $("#keywordInput").val();
		});
		
		
	});
	
	
	
</script>
</html>