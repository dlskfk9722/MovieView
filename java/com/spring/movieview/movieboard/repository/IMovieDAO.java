package com.spring.movieview.movieboard.repository;

import java.util.List;
import java.util.Map;

import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.movieboard.model.MovieUploadFileVO;
import com.spring.movieview.movieboard.model.MovieVO;

public interface IMovieDAO {
	public List<MovieVO> getAllList() throws Exception;
	public MovieVO getOneList(int movieNo) throws Exception;
	public void insertMovie(MovieVO movie) throws Exception;
	public void deleteMovie(int movieNo) throws Exception;
	public void updateMovie(MovieVO movie) throws Exception;
	//public List<MovieVO> getListPaging(SearchCriteria cri) throws Exception;
	
	public int countAll(SearchCriteria cri) throws Exception;
	
	// 파일업로드
	public void insertFile(MovieUploadFileVO file) throws Exception;

	int selectMaxMovieNo();

	MovieUploadFileVO getFile(int fileId);
	
	MovieUploadFileVO getFileByMovieNo(int movieNo);
		

	// 검색 동적 SQL처리
	// public List<MovieVO> getListPaging(SearchCriteria cri) throws Exception;
	public List<MovieVO> getListPaging(Map<String, Object> datas) throws Exception;
	
	
}
