package kr.or.nextit.comm.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class NoticeVo implements Serializable {

	// !!! *테이블 이름 : TB_NOTICE
	// !!!필드
	private String ntcIdx;		// !글 번호 (PK) => 자동증가로 만들 계획
	private String empId;		// !직원 ID (FK) from TB_EMPLOYEE
	
	private String empName;		// 직원명
 	private String empDiv;		// 직책구분
	
	private String ntcTitle;	// !글 제목
	private String ntcContent;	// !글 내용
	private String ntcRegdate;	// !글 등록일
	private String ntcUpdate;	// !글 수정일
	private String ntcCount;	// !글 조회수
	private String ntcDelat;	// !삭제여부; 삭제=T 노삭제=F
	
	private String rnum;		// 글 번호정렬
	
	// !!!부가적 필드
	private String message;
	private boolean result;

	// !!!게터 세터
	public String getNtcIdx() {
		return ntcIdx;
	}

	public void setNtcIdx(String ntcIdx) {
		this.ntcIdx = ntcIdx;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getNtcTitle() {
		return ntcTitle;
	}

	public void setNtcTitle(String ntcTitle) {
		this.ntcTitle = ntcTitle;
	}

	public String getNtcContent() {
		return ntcContent;
	}

	public void setNtcContent(String ntcContent) {
		this.ntcContent = ntcContent;
	}

	public String getNtcRegdate() {
		return ntcRegdate;
	}

	public void setNtcRegdate(String ntcRegdate) {
		this.ntcRegdate = ntcRegdate;
	}

	public String getNtcUpdate() {
		return ntcUpdate;
	}

	public void setNtcUpdate(String ntcUpdate) {
		this.ntcUpdate = ntcUpdate;
	}

	public String getNtcCount() {
		return ntcCount;
	}

	public void setNtcCount(String ntcCount) {
		this.ntcCount = ntcCount;
	}

	public String getNtcDelat() {
		return ntcDelat;
	}

	public void setNtcDelat(String ntcDelat) {
		this.ntcDelat = ntcDelat;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpDiv() {
		return empDiv;
	}

	public void setEmpDiv(String empDiv) {
		this.empDiv = empDiv;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

}
