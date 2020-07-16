<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 댓글 영역 --%>
                <!-- Main content -->
                <div class="wrapper">
        <section class="content container-fluid">
        <c:if test="${not empty sessionScope.loginId }">
            <div class="col-lg-12" style="color:white">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">댓글 작성</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="newReplyText">댓글 내용</label>
                            <input class="form-control" id="newReplyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
                        </div>
                        <div class="form-group">
                            <label for="newReplyWriter">댓글 작성자</label>
                            <input class="form-control" id="newReplyWriter" name="replyWriter" placeholder="댓글 작성자를 입력해주세요" value="${sessionScope.loginId}" readonly="readonly" >
                        </div>
                        <div class="pull-right">
                            <button type="button" id="replyAddBtn" class="btn btn-primary"><i class="fa fa-save"></i> 댓글 저장</button>
                        </div>
                    </div>
                 
                    
                    <!-- 댓글 목록이 배치될 박스 -->
                    <div class="box-footer">
                        <ul id="replies">
							
                        </ul>
                    </div>
                    
                    <!-- 댓글 페이지 화면이 들어올 박스 -->
                    <div class="box-footer">
                        <div class="text-center">
                            <ul class="pagination pagination-sm no-margin">

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            </c:if>
			
			<!-- 댓글 수정 모달 화면 창 -->
			
            <div class="modal fade" id="modifyModal" role="dialog" style="color:white">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">댓글 수정창</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="replyNo">댓글 번호</label>
                                <input class="form-control" id="replyNo" name="replyNo" readonly>
                            </div>
                            <div class="form-group">
                                <label for="replyText">댓글 내용</label>
                                <input class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
                            </div>
                            <div class="form-group">
                                <label for="replyWriter">댓글 작성자</label>
                                <input class="form-control" id="replyWriter" name="replyWriter"  readonly>
                            </div>
                        </div>
                        
                  
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-success modalModBtn">수정</button>
                            <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
                        </div>
                        
                        
                   
                    </div>
                </div>
            </div>
        </section>
    <jsp:include page="../include/main-footer.jsp" />
	<jsp:include page="../include/plugin-js.jsp" />
	</div>

<script>
$(document).ready(function () {
	
	let reviewNo = "${review.reviewNo}"; //현재 게시글 번호
	let pageNum = 1;
	
	
	getRepliesPaging(pageNum);
	
	
	
	//페이징처리된 댓글 목록 불러오기 함수 정의
	function getRepliesPaging(page) {		
		
		$.getJSON("/replies/"+reviewNo+"/"+page, function(data) {
			let str = "";
			
			$(data.replies).each(function() {
				str += "<li data-replyNo='" + this.replyNo + "' class='replyLi'>"
                +   "<p class='replyText'>" + this.replyText + "</p>"
                +   "<p class='replyWriter'>" + this.replyWriter + "</p>"
                +   "<button type='button' class='btn btn-xs btn-success modifyModal' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
                + "</li>"
                + "<hr>";
			});
			
			$("#replies").html(str);
						
			printPageElement(data.pageCreator);
			
		});//end getJSON		
		
	}//end function define: getRepliesPaging()
	
	//페이지 목록 태그를 만드는 함수 정의
	function printPageElement(pageCreator) {
		
		let element = "";
		
		const begin = pageCreator.beginPage;
		const end = pageCreator.endPage;
		
		//이전버튼 태그 만들기
		if(pageCreator.prev) {
			element += "<li><a href='"+(begin-1)+"'>이전</a></li>";
		}
		
		//페이지 번호 리스트 만들기
		for(let i=begin; i <= end; i++) {
			const active = (pageCreator.criteria.page === i) ? 'class=active' : '';
			element += "<li "+active+"><a href='"+i+"'>" + i + "</a></li>"
		}
		
		//다음버튼 태그 만들기
		if(pageCreator.next) {
			element += "<li><a href='"+(end+1)+"'>다음</a></li>";
		}
		
		$(".pagination").html(element);
		
	}//end printPageElement 
	
	//페이지 클릭 이벤트
	/*
		# 클래스이름이 pagination인 ul태그는 실존하는 요소이지만
		 ul태그의 자식요소들인 li요소와 a요소는 자바스크립트 구문으로 만든
		 가상요소입니다. 따라서 직접적인 클릭이벤트처리를 할 수 없습니다.
	 	# 그래서 실존요소인 ul태그에 이벤트 처리를 걸고 on함수의 2번째 매개값으로
	 	실제로 이벤트 처리할 가상 요소를 적습니다.
	*/
	$(".pagination").on("click", "li a", function(e) {
		e.preventDefault(); //a태그의 본래의 기능을 막음.
		//console.log("페이지 클릭됨!!");
		//console.log($(this).attr("href"));	
		pageNum = $(this).attr("href");
		getRepliesPaging(pageNum);
		
	}); //end page click event function
	
	
	//댓글 저장버튼 클릭 이벤트 처리
	$("#replyAddBtn").on("click", function() {

	     const replyText = $("#newReplyText");
	     const replyWriter = $("#newReplyWriter");
	     console.log("전달되고잇슴");
	     let replyTextVal = replyText.val();
	     let replyWriterVal = replyWriter.val();

	     $.ajax({
	         type : "POST",
	         url : "/replies",
	         headers : {
	             "Content-type" : "application/json",
	             "X-HTTP-Method-Override" : "POST"
	         },
	            
	         dataType : "text",
	         data : JSON.stringify({ //자바스크립트 데이터를 JSON데이터로 변경해준다.
	             reviewNo : reviewNo,
	             replyText : replyTextVal,
	             replyWriter : replyWriterVal
	         }),
	         success : function (result) {
	             if (result === "regSuccess") {
	                 alert("댓글 등록 완료!");
	             }
	             //getReplies();
	             getRepliesPaging(1);
	             replyText.val("");
	             replyWriter.val(replyWriterVal);
	         }
	     });
	 });//end 댓글 작성 클릭이벤트
	 
	 //댓글 수정 창 클릭 이벤트
	 $("#replies").on("click", "li button", function() {
		//console.log("수정창 열기 클릭!!"); 
		
		console.log("댓글번호: "+$(this).parent().attr("data-replyNo"));
		console.log("작성자 이름: " + $(this).parent().find(".replyWriter").text());
		console.log("댓글 내용: " + $(this).parent().find(".replyText").text());
		
		
		const replyNo = $(this).parent().attr("data-replyNo");
		const writer = $(this).parent().find(".replyWriter").text();
		const text = $(this).parent().find(".replyText").text();
		
		$("#replyNo").val(replyNo);
		$("#replyWriter").val(writer);
		$("#replyText").val(text);
		
	 });
	 
	 //댓글 수정 비동기 통신 요청 클릭 이벤트
	 $(".modalModBtn").on("click", function() {
		
		 const replyNo = $(this).parent().parent().find("#replyNo").val();
		 const text = $(this).parent().parent().find("#replyText").val();
		 //console.log(replyNo);
		 const writer = $(this).parent().parent().find("#replyWriter").val();
		 
		 console.log("댓글내용맞냐??: "+text);
		 console.log("작성자맞냐??:" + writer);
		 if(writer == "${sessionScope.loginId}"){
		 $.ajax(
			{
				type: "PUT",
				url: "/replies/" + replyNo,
				headers: {
					"Content-type" : "application/json",
	                "X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify(
					{
						replyText: text
					}
				),
				dataType: "text",
				success: function(result) {
					if(result === "modSuccess") {
						alert("댓글 수정 완료!");
						$("#modifyModal").modal("hide");//수정창을 감추는 함수
						getRepliesPaging(pageNum);
					}
				}
			}				 
		 );		} 
		 else{
			 alert("다른 작성자의 글을 수정 및 삭제할 수 없습니다.");
		 }
		 
	 });
	 

	
	 // modal 창의 댓글 삭제버튼 클릭 이벤트
    $(".modalDelBtn").on("click", function () {
    	
    	const replyNo = $(this).parent().parent().find("#replyNo").val();
        //const replyNo = $(".replyNo").val();
        const writer = $(this).parent().parent().find("#replyWriter").val();
        if(writer == "${sessionScope.loginId}"){
        $.ajax({
            type: "delete",
            url: "/replies/" + replyNo,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "DELETE"
            },
            data: JSON.stringify({
               replyNo: replyNo,
               reviewNo: reviewNo
            }),
            dataType: "text",
            success: function (result) {
                console.log("result : " + result);
                if (result === "delSuccess") {
                    alert("댓글이 삭제되었습니다.");
                    $("#modifyModal").modal("hide");
                    getRepliesPaging(pageNum);
                }
            }
        });    }
        else{
        	alert("다른 작성자의 글을 수정 및 삭제할 수 없습니다.");
        }
    });
});//JQuery의 끝

</script>
</body>
</html>