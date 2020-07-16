package com.spring.movieview.movieboard.model;

import java.util.Arrays;

import lombok.Data;

@Data
public class MovieUploadFileVO {

	private int fileId;
	private int movieNo;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	private byte[] fileData;
	
	
	
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
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
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	@Override
	public String toString() {
		return "MovieUploadFileVO [fileId=" + fileId + ", movieNo=" + movieNo + ", fileName=" + fileName + ", fileSize="
				+ fileSize + ", fileContentType=" + fileContentType + ", fileData=" + Arrays.toString(fileData) + "]";
	}
	
	
	
	
}
