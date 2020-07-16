package com.spring.movieview.commons;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.spring.movieview.commons.Criteria;

public class PageCriteria {
	private Criteria criteria;	//페이지 번호와 한 페이지당 들어갈 게시물 수
	private int articleTotalCount;	//DB에 저장된 총 게시물 수
	private int beginPage;	//시작 페이지 번호를 계산
	private int endPage;	//끝 페이지 번호를 계산
	private boolean prev;	//이전 버튼 활성화 여부
	private boolean next;	//다음 버튼 활성화 여부
	
	//한 화면에 한번에 보여줄 페이지 수
	private final int displayPageNum = 10;
	
	//URI와 요청파라미터를 쉽게 작성하기 위한 기능
		public String makePageURI(int page) {
			UriComponents ucp = UriComponentsBuilder.newInstance()
								.queryParam("page", page)
								.queryParam("countPerPage", criteria.getCountPerPage())
								.build();
			return ucp.toUriString();
		}
		
		
		public String makeSearchURI(int page) {
			UriComponents ucp = UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("countPerPage", criteria.getCountPerPage())
					.queryParam("condition", ((SearchCriteria)criteria).getCondition())
					.queryParam("keyword", ((SearchCriteria)criteria).getKeyword())
					.build();
			return ucp.toUriString();
		}

	
	public void calcData() {
		//끝페이지
		endPage = (int) (Math.ceil(criteria.getPage()/(double)displayPageNum)*displayPageNum);
		//시작페이지
		beginPage = (endPage-displayPageNum)+1;
		//끝페이지 재보장
		int endPageResult = (int) (Math.ceil(articleTotalCount/(double)criteria.getCountPerPage()));
		if(endPage > endPageResult) {
			endPage = endPageResult;
		}
		//현재 시작페이지가 1일경우 이전버튼을 false로 만들어 버튼 비활성
		if(beginPage == 1) {
			prev = false;
		}else {
			prev = true;
		}
		//마지막 페이지 확인 후 다음버튼 비활성
		if(articleTotalCount <= (endPage * criteria.getCountPerPage())) {
			next = false;
		}else {
			next = true;
		}
				
	}
	

	public Criteria getCriteria() {
		return criteria;
	}


	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}


	public int getArticleTotalCount() {
		return articleTotalCount;
	}


	public void setArticleTotalCount(int articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calcData();
	}


	public int getBeginPage() {
		return beginPage;
	}


	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getDisplayPageNum() {
		return displayPageNum;
	}


	@Override
	public String toString() {
		return "PageCriteria [criteria=" + criteria + ", articleTotalCount=" + articleTotalCount + ", beginPage="
				+ beginPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum="
				+ displayPageNum + "]";
	}
	

}
