package kr.or.nextit.comm.model;

import java.io.Serializable;

import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class EmployeeVo implements Serializable {

	// !!! *테이블이름 : TB_EMPLOYEE

	// !!!필드
	@Size(min=3, max=12, message="size error : 직원ID는 3글자이상 12글자 이하입니다.")
	private String empId;			// !직원ID (PK)
	@Size(min=4, max=12, message="size error  : 직원PWD 4 ~ 12")
	private String empPwd; 			// !비밀번호
	private String empName; 		// !직원 이름
	private String empPhone; 		// !직원 전화번호
	private String empRrnum; 		// !직원 주민번호
	private String empAddress;		// !직원 주소
	private String empDiv; 			// !직원 구분 (D/N)
	private String empSalary; 		// !연봉
	private String empHiredate; 	// !입사일 (계정만든일)
	private String empRetiredate; 	// !퇴사일

	// !!! join시 필드
	private String empDivname; 	// from TB_EMP_DIVNAME

	// !!!부가적 필드
	private String message;
	private boolean result;
	
	// !!!게터 세터
	
	public String getEmpDivname() {
		return empDivname;
	}

	public void setEmpDivname(String empDivname) {
		this.empDivname = empDivname;
	}

	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpRrnum() {
		return empRrnum;
	}

	public void setEmpRrnum(String empRrnum) {
		this.empRrnum = empRrnum;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public String getEmpDiv() {
		return empDiv;
	}

	public void setEmpDiv(String empDiv) {
		this.empDiv = empDiv;
	}

	public String getEmpSalary() {
		return empSalary;
	}

	public void setEmpSalary(String empSalary) {
		this.empSalary = empSalary;
	}

	public String getEmpHiredate() {
		return empHiredate;
	}

	public void setEmpHiredate(String empHiredate) {
		this.empHiredate = empHiredate;
	}

	public String getEmpRetiredate() {
		return empRetiredate;
	}

	public void setEmpRetiredate(String empRetiredate) {
		this.empRetiredate = empRetiredate;
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
