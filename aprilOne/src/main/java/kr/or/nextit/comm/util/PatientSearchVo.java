package kr.or.nextit.comm.util;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class PatientSearchVo extends PagingVo implements Serializable {

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

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
