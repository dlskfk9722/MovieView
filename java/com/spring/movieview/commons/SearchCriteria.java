package com.spring.movieview.commons;

public class SearchCriteria extends Criteria{
	private String condition;
	private String keyword;
	private String searchGenre;
	
	public SearchCriteria() {
		this.condition="basic";
		this.keyword="";
		this.searchGenre="basic";
	}
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchGenre() {
		return searchGenre;
	}

	public void setSearchGenre(String searchGenre) {
		this.searchGenre = searchGenre;
	}

	@Override
	public String toString() {
		return "SearchCriteria [condition=" + condition + ", keyword=" + keyword + "]";
	}
	
	
}
