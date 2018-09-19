package kr.or.nextit.comm.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class ClinicVo implements Serializable {

	// !!! *테이블이름 : TB_CLINIC

	// !!!필드
	private String clnCode;		// cln_code (6)
	private String patCode; 	// pat_code (6)
	private String empId; 		// emp_id (50)
	private String clnDate; 	// cln_date
	private String clnDescr; 	// cln_descr (4000)
	
	// !!!조인시 TB_PATIENT, TB_EMPLOYEE
	private String patName; 	// pat_name
	private String empName; 	// emp_name

	// !!!부가적 필드
	private String message;
	private boolean result;
	

	// !!!게터 세터
	public String getClnCode() {
		return clnCode;
	}

	public String getPatName() {
		return patName;
	}

	public void setPatName(String patName) {
		this.patName = patName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
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
