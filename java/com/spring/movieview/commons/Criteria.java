package com.spring.movieview.commons;

public class Criteria {
	private int page;
	private int countPerPage;
	
	public Criteria() {
		this.countPerPage=20;
		this.page=1;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page<1) {
			this.page = page;
			return;
		}
		this.page = page;
	}
	
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	
	public int getPageStart() {
		return (this.page-1)*this.countPerPage;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", countPerPage=" + countPerPage + "]";
	}
	
	
}
