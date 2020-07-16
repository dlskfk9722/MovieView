package com.spring.movieview.reply.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int replyNo;
	private int reviewNo;
	private String replyText;
	private String replyWriter;
	private Date regDate;
	private Date updateDate;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", reviewNo=" + reviewNo + ", replyText=" + replyText + ", replyWriter="
				+ replyWriter + ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}
	
	
	
}



