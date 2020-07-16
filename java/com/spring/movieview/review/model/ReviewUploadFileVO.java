package com.spring.movieview.review.model;

import java.util.Arrays;

import lombok.Data;

@Data
public class ReviewUploadFileVO {
	
	private int fileId;
	private int reviewNo;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	private byte[] fileData;
	
	
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	@Override
	public String toString() {
		return "ReviewUploadFileVO [fileId=" + fileId + ", reviewNo=" + reviewNo + ", fileName=" + fileName
				+ ", fileSize=" + fileSize + ", fileContentType=" + fileContentType + ", fileData="
				+ Arrays.toString(fileData) + "]";
	}
	

	
	
}
