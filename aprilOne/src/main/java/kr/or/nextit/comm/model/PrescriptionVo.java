package kr.or.nextit.comm.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class PrescriptionVo implements Serializable {

	// !!! *테이블이름 : TB_PRESCRIPTION
	// !!!필드

	private String prsCode; // !처방 코드 : PK
	private String clnCode; // !진료 코드 : FK
	private String prsDescr; // !처방 내용
	private String medCode; // !의약품 코드 : FK
	private String medCode2; // !의약품 코드2 : FK
	private String medCode3; // !의약품 코드3 : FK
	
	private String medCodename; // !의약품 코드명 
	private String medCodename2; // !의약품 코드명2 
	private String medCodename3; // !의약품 코드명3

	private String patCode; // ! 환자코드 
	private String patName; // ! 환자명  
	

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this); 
	}
	
	// !!!게터 세터
	public String getPrsCode() {
		return prsCode;
	}

	public void setPrsCode(String prsCode) {
		this.prsCode = prsCode;
	}

	public String getClnCode() {
		return clnCode;
	}

	public void setClnCode(String clnCode) {
		this.clnCode = clnCode;
	}

	public String getPrsDescr() {
		return prsDescr;
	}

	public void setPrsDescr(String prsDescr) {
		this.prsDescr = prsDescr;
	}

	public String getMedCode() {
		return medCode;
	}

	public void setMedCode(String medCode) {
		this.medCode = medCode;
	}

	public String getMedCode2() {
		return medCode2;
	}

	public void setMedCode2(String medCode2) {
		this.medCode2 = medCode2;
	}

	public String getMedCode3() {
		return medCode3;
	}

	public void setMedCode3(String medCode3) {
		this.medCode3 = medCode3;
	}

	public String getMedCodename() {
		return medCodename;
	}

	public void setMedCodename(String medCodename) {
		this.medCodename = medCodename;
	}

	public String getMedCodename2() {
		return medCodename2;
	}

	public void setMedCodename2(String medCodename2) {
		this.medCodename2 = medCodename2;
	}

	public String getMedCodename3() {
		return medCodename3;
	}

	public void setMedCodename3(String medCodename3) {
		this.medCodename3 = medCodename3;
	}

	public String getPatCode() {
		return patCode;
	}

	public void setPatCode(String patCode) {
		this.patCode = patCode;
	}

	public String getPatName() {
		return patName;
	}

	public void setPatName(String patName) {
		this.patName = patName;
	}
}
