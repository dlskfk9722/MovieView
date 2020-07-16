package com.spring.movieview.review.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.movieview.commons.Criteria;
import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.review.model.ReviewUploadFileVO;
import com.spring.movieview.review.model.ReviewVO;


@Repository
public class ReviewDAO implements IReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "ReviewMapper";
	
	@Override
	public ReviewVO content(int reviewNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".content", reviewNo);
	}

	@Override
	public void insert(ReviewVO review) throws Exception {
		sqlSession.insert(NAMESPACE+".insert", review);
		

	}
	@Override
	public void modify(ReviewVO review) throws Exception {
		System.out.println("수정");
		sqlSession.update(NAMESPACE+".modify", review);
	}


	@Override
	public void delete(int reviewNo) throws Exception {
		sqlSession.delete(NAMESPACE+".delete", reviewNo);

	}

	@Override
	public List<ReviewVO> list(int movieNo) throws Exception {
		return sqlSession.selectList(NAMESPACE+".list", movieNo);
	}

	@Override
	public List<ReviewVO> listPaging(Criteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listPaging", cri);
	}

	@Override
	public int countArticles() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countArticles");
	}

	@Override
	public List<ReviewVO> listSearch(SearchCriteria cri, int movieNo) throws Exception {
		Map<String, Object> datas = new HashMap<>();
		datas.put("movieNo", movieNo);
		datas.put("criteria", cri);
		System.out.println("DAO => movieNo: " + movieNo);
		System.out.println("DAO => keyword: " + cri.getKeyword());
		return sqlSession.selectList(NAMESPACE+".listSearch", datas);
	}

	@Override
	public int countSearchArticles(SearchCriteria cri, int movieNo) throws Exception {
		Map<String, Object> datas = new HashMap<>();
		datas.put("movieNo", movieNo);
		datas.put("criteria", cri);
		return sqlSession.selectOne(NAMESPACE+".countSearchArticles", datas);
	}

	@Override
	public void updateViewCnt(int reviewNo) throws Exception {
		sqlSession.update(NAMESPACE+".updateViewCnt", reviewNo);
		
	}
	@Override
	public void updateStar(ReviewVO review) throws Exception {
		sqlSession.update(NAMESPACE+".updateStar", review);
		
	}
	@Override
	public int selectMaxReviewNo() {
		return sqlSession.selectOne(NAMESPACE+".selectMaxReviewNo");
	}

	@Override
	public ReviewUploadFileVO getFile(int fileId) {
		return sqlSession.selectOne(NAMESPACE+".getFile", fileId);
	}
	@Override
	public void insertFile(ReviewUploadFileVO file) throws Exception {
		sqlSession.insert(NAMESPACE+".insertFile", file);
	}



}
