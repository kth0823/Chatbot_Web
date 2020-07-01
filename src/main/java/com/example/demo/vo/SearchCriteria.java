package com.example.demo.vo;

public class SearchCriteria extends Criteria{

	private String searchType = "";
	private String keyword = "";
	private String searchType1 = "";
	private String searchType2 = "";
	private String keyword1 = "";
	private String keyword2 = "";
	 
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType1() {
		return searchType1;
	}
	public void setSearchType1(String searchType1) {
		this.searchType1 = searchType1;
	}
	public String getSearchType2() {
		return searchType2;
	}
	public void setSearchType2(String searchType2) {
		this.searchType2 = searchType2;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}	
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}	
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	public String toString2() {
		return "SearchCriteria [searchType1=" + searchType1 + ", searchType2=" + searchType2 + ", keyword1=" + keyword1 + ", keyword2=" + keyword2 + "]";
	}
}