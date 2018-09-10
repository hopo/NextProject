package kr.or.nextit.comm.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class PatientSearchVo  extends PagingVo implements Serializable{
	
	private String searchType;
	private String searchText;
	
	
	
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	
	

	
	
	

	
	
	
}
