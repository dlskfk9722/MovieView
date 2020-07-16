package com.spring.movieview.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.movieview.commons.Criteria;
import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.review.model.ReviewUploadFileVO;
import com.spring.movieview.review.model.ReviewVO;
import com.spring.movieview.review.repository.IReviewDAO;


@Service
public class ReviewService implements IReviewService{

	@Autowired
	private IReviewDAO reviewDao;
	
	
	@Override
	public void insert(ReviewVO review) throws Exception {
		reviewDao.insert(review);
	}
	@Transactional
	@Override
	public void insert(ReviewVO review, ReviewUploadFileVO file) throws Exception {
		System.out.println("test insert(review,file): review_title - " + review.getReviewTitle());
		
		reviewDao.insert(review);
		
		if(file != null && file.getFileName() != null && !file.getFileName().equals("")) {
			file.setReviewNo(reviewDao.selectMaxReviewNo());
			
			System.out.println("maxReviewNo : " + file.getReviewNo());
			reviewDao.insertFile(file);
		}
	}


	@Override
	public List<ReviewVO> list() throws Exception {
		return reviewDao.list(0);
	}


	@Override
	public ReviewVO content(int reviewNo) throws Exception {
		ReviewVO review = reviewDao.content(reviewNo);
		String temp = review.getReviewContent();
		temp = temp.replace("\n", "<br>");
		review.setReviewContent(temp);
		//게시물조회 추가할것
		reviewDao.updateViewCnt(reviewNo);
		
		
		return review;
	}


	@Override
	public void modify(ReviewVO review) throws Exception {
		reviewDao.modify(review);
	}


	@Override
	public void delete(int reviewNo) throws Exception {
		reviewDao.delete(reviewNo);
		
	}


	@Override
	public List<ReviewVO> listPaging(Criteria cri) throws Exception {
		return reviewDao.listPaging(cri);
	}


	@Override
	public int countArticles() throws Exception {
		return reviewDao.countArticles();
	}


	@Override
	public List<ReviewVO> listSearch(SearchCriteria cri, int movieNo) throws Exception {
		List<ReviewVO> list = reviewDao.listSearch(cri, movieNo);
		return list;
	}


	@Override
	public int countSearchArticles(SearchCriteria cri, int movieNo) throws Exception {
		return reviewDao.countSearchArticles(cri, movieNo);
	}
	
	@Override
	public void updateStar(ReviewVO review) throws Exception {
		reviewDao.updateStar(review);
	}

	@Override
	public ReviewUploadFileVO getFile(int fileId) throws Exception {
		return reviewDao.getFile(fileId);
	}
}
