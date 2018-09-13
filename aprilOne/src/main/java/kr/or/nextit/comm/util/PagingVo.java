package kr.or.nextit.comm.util;

public class PagingVo {

	private int totalCount; 	// 전체 레코드 갯수 100
	private int curPage; 		// 현제페이지 1
	private int screenSize; 	// 화면에 보이는 레코드수 10개씩 100개 100/10
	private int totalPageCount; // 총 페이지 수 10개씩 10페이지
	private int startRow; 		// 시작 행번호 레코드 첫번째번호
	private int endRow; 		// 끝 행번호 레코드 끝번호

	private int pageBlockSize; 	// 화면에 보여지는 페이지 3페이지씩 4블록
	private int startPage; 		// 시작 페이지 번호 1페이지
	private int endPage; 		// 끝 페이지 번호 10페이지

	public void pageSetting() {

		if (curPage < 1) {
			curPage = 1;
		}

		if (screenSize < 1) {
			screenSize = 10;
		}

		if (pageBlockSize < 1) {
			pageBlockSize = 5;
		}

		totalPageCount = (totalCount - 1) / screenSize + 1;
		startRow = (curPage - 1) * screenSize + 1;
		endRow = curPage * screenSize;

		startPage = ((curPage - 1) / pageBlockSize) * pageBlockSize + 1;
		endPage = startPage + pageBlockSize - 1;

		if (totalPageCount < endPage)
			endPage = totalPageCount;

	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getScreenSize() {
		return screenSize;
	}

	public void setScreenSize(int screenSize) {
		this.screenSize = screenSize;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getPageBlockSize() {
		return pageBlockSize;
	}

	public void setPageBlockSize(int pageBlockSize) {
		this.pageBlockSize = pageBlockSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

}
