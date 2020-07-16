package com.spring.movieview.movieboard.service;

import java.util.List;
import java.util.Map;

import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.movieboard.model.MovieUploadFileVO;
import com.spring.movieview.movieboard.model.MovieVO;

public interface IMovieService{
	public List<MovieVO> getAllList() throws Exception;
	public void insertMovie(MovieVO movie) throws Exception;
	public void deleteMovie(int movieNo) throws Exception;
	public MovieVO getOneList(int movieNo) throws Exception;
	public void updateMovie(MovieVO movie) throws Exception;
	//public List<MovieVO> getListPaging(SearchCriteria cri) throws Exception;
	
	public int countAll(SearchCriteria cri) throws Exception;
	
	////////////////////업로드용
	void insert(MovieVO movie, MovieUploadFileVO file) throws Exception;

	MovieUploadFileVO getFile(int fileId) throws Exception;
	MovieUploadFileVO getFileByMovieNo(int movieNo) throws Exception;;

	//public List<MovieVO> getListPaging(SearchCriteria cri) throws Exception;
	public List<MovieVO> getListPaging(Map<String, Object> datas) throws Exception;
	
}
