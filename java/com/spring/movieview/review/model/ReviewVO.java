package com.spring.movieview.review.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {

	private int reviewNo;
	private int movieNo;
	private String reviewTitle;
	private String reviewWriter;
	private String reviewContent;
	private Date regDate;
	
	private int viewCnt;
	private int replyCnt;
	
	private int starCnt;
	private int starSum;
	
	//0728, 파일업로드용
	private MultipartFile file;
	
	private int fileId;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	
	
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	private boolean newMark;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	public int getStarCnt() {
		return starCnt;
	}
	public void setStarCnt(int starCnt) {
		this.starCnt = starCnt;
	}
	public int getStarSum() {
		return starSum;
	}
	public void setStarSum(int starSum) {
		this.starSum = starSum;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public boolean isNewMark() {
		return newMark;
	}
	public void setNewMark(boolean newMark) {
		this.newMark = newMark;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", movieNo=" + movieNo + ", reviewTitle=" + reviewTitle
				+ ", reviewWriter=" + reviewWriter + ", reviewContent=" + reviewContent + ", regDate=" + regDate
				+ ", viewCnt=" + viewCnt + ", replyCnt=" + replyCnt + ", starCnt=" + starCnt + ", starSum=" + starSum
				+ ", file=" + file + ", fileId=" + fileId + ", fileName=" + fileName + ", fileSize=" + fileSize
				+ ", fileContentType=" + fileContentType + ", newMark=" + newMark + "]";
	}
	
	
	
	/*
	private String userId;
	private String userPw;
	private String userName;
	private Date userRegDate;
	private String sessionId;
	private Date sessionLimit;
	*/
}
