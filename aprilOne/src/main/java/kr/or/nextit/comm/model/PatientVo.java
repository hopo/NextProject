package kr.or.nextit.comm.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class PatientVo implements Serializable {

	// !!! *테이블이름 : TB_PATIENT
	// !!!필드

	private String patCode; // !환자코드 (PK) nn
	private String patInscode; // !보험코드 (FK)
	private String patName; // !환자 이름 nn
	private String patPhone; // !환자 전화번호 : UQ nn
	private String patRrnum; // !환자 주민번호 : UQ nn
	private String patGender; // !환자 성별 nn
	private String patAddress; // !환자 주소 nn
	private String patDisease; // !환자 질환유무
	private String patFirstdate; // !초진일
	private String patRedate; // !재진일
	private String patMemo; // !환자 특이사항
	private String empId; // !직원 ID(담당의) : FK

	// !!!부가적 필드
	private String message;
	private boolean result;

	// !!!게터 세터
	public String getPatCode() {
		return patCode;
	}

	public void setPatCode(String patCode) {
		this.patCode = patCode;
	}

	public String getPatInscode() {
		return patInscode;
	}

	public void setPatInscode(String patInscode) {
		this.patInscode = patInscode;
	}

	public String getPatName() {
		return patName;
	}

	public void setPatName(String patName) {
		this.patName = patName;
	}

	public String getPatPhone() {
		return patPhone;
	}

	public void setPatPhone(String patPhone) {
		this.patPhone = patPhone;
	}

	public String getPatRrnum() {
		return patRrnum;
	}

	public void setPatRrnum(String patRrnum) {
		this.patRrnum = patRrnum;
	}

	public String getPatGender() {
		return patGender;
	}

	public void setPatGender(String patGender) {
		this.patGender = patGender;
	}

	public String getPatAddress() {
		return patAddress;
	}

	public void setPatAddress(String patAddress) {
		this.patAddress = patAddress;
	}

	public String getPatDisease() {
		return patDisease;
	}

	public void setPatDisease(String patDisease) {
		this.patDisease = patDisease;
	}

	public String getPatFirstdate() {
		return patFirstdate;
	}

	public void setPatFirstdate(String patFirstdate) {
		this.patFirstdate = patFirstdate;
	}

	public String getPatRedate() {
		return patRedate;
	}

	public void setPatRedate(String patRedate) {
		this.patRedate = patRedate;
	}

	public String getPatMemo() {
		return patMemo;
	}

	public void setPatMemo(String patMemo) {
		this.patMemo = patMemo;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
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
