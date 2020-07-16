package com.spring.movieview.review.service;

import java.util.List;

import com.spring.movieview.commons.Criteria;
import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.review.model.ReviewUploadFileVO;
import com.spring.movieview.review.model.ReviewVO;



public interface IReviewService {

	void insert(ReviewVO review) throws Exception;
	List<ReviewVO> list() throws Exception; 
	 ReviewVO content(int reviewNo) throws Exception;
	 void modify(ReviewVO review) throws Exception;
	 void delete(int reviewNo) throws Exception;
	 
	 //페이징처리
	List<ReviewVO> listPaging(Criteria cri) throws Exception;
	//총 리뷰 수
	int countArticles() throws Exception;
	
	//검색 동적 SQL처리
	List<ReviewVO> listSearch(SearchCriteria cri, int movieNo) throws Exception;
	//검색후 총 리뷰 수 
	int countSearchArticles(SearchCriteria cri, int movieNo) throws Exception;
	
	void updateStar(ReviewVO review) throws Exception;
	
	//파일업로드
	void insert(ReviewVO review, ReviewUploadFileVO file) throws Exception;
	ReviewUploadFileVO getFile(int fileId) throws Exception; 
	
	
	 
}
