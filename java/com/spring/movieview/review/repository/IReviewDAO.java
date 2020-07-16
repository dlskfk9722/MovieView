package com.spring.movieview.review.repository;

import java.util.List;

import com.spring.movieview.commons.Criteria;
import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.review.model.ReviewUploadFileVO;
import com.spring.movieview.review.model.ReviewVO;



public interface IReviewDAO {

	
	//리뷰 내용 보여주기
	 ReviewVO content(int reviewNo) throws Exception;
	 
	 //리뷰 작성
	 void insert(ReviewVO review) throws Exception;
	 
	 //리뷰 수정
	 void modify(ReviewVO review) throws Exception;
	 
	 //리뷰 삭제
	 void delete(int reviewNo) throws Exception;
	 
	 //목록보기
	 List<ReviewVO> list(int movieNo) throws Exception; 
	
	 
	 //게시글 페이지별로 불러오기
	 List<ReviewVO> listPaging(Criteria cri) throws Exception;
	 //총 게시물 수를 불러오기
	 int countArticles() throws Exception;
	 
	 
	//검색 동적 SQL처리
	List<ReviewVO> listSearch(SearchCriteria cri, int movieNo) throws Exception;
	//검색후 총 리뷰 수 
	int countSearchArticles(SearchCriteria cri, int movieNo) throws Exception;
			 
	//조회수 상승
	void updateViewCnt(int reviewNo) throws Exception;
	//별점
	void updateStar(ReviewVO review) throws Exception;
	
	//파일 인서트
	void insertFile(ReviewUploadFileVO file) throws Exception;
	//최대 게시글 번호 조회
	int selectMaxReviewNo();
	//파일을 db에서 불러옴
	ReviewUploadFileVO getFile(int fileId);
		
}
