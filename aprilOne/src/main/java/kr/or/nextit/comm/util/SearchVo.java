package kr.or.nextit.comm.util;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class SearchVo extends PagingVo implements Serializable {

	private String searchType;
	private String searchText;
	private String searchTable; // ;PaginationService로 만들지 않는다면 쓰지 않는 쪽으로

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

	public String getSearchTable() {
		return searchTable;
	}

	public void setSearchTable(String searchTable) {
		this.searchTable = searchTable;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
