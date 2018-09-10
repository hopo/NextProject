package kr.or.nextit.comm.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class ClinicVo implements Serializable {

	// !!! *테이블이름 : TB_CLINIC

	// !!!필드
	private String clnCode;		// cln_code
	private String patCode; 	// pat_code
	private String empId; 		// emp_id
	private String clnDate; 	// cln_date
	private String clnDescr; 	// cln_descr

	// !!!부가적 필드
	private String message;
	private boolean result;
	
	// !!!게터 세터
	public String getClnCode() {
		return clnCode;
	}

	public void setClnCode(String clnCode) {
		this.clnCode = clnCode;
	}

	public String getPatCode() {
		return patCode;
	}

	public void setPatCode(String patCode) {
		this.patCode = patCode;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getClnDate() {
		return clnDate;
	}

	public void setClnDate(String clnDate) {
		this.clnDate = clnDate;
	}

	public String getClnDescr() {
		return clnDescr;
	}

	public void setClnDescr(String clnDescr) {
		this.clnDescr = clnDescr;
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

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this); 
	}
}
