package kr.or.nextit.comm.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class LoginInfoVo implements Serializable {

	// !!! *테이블이름 : TB_LOGIN_INFO

	private String logIdx;
	private String empId;
	private String logLogindate;
	private String logLogoutdate;

	public String getLogIdx() {
		return logIdx;
	}

	public void setLogIdx(String logIdx) {
		this.logIdx = logIdx;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getLogLogindate() {
		return logLogindate;
	}

	public void setLogLogindate(String logLogindate) {
		this.logLogindate = logLogindate;
	}

	public String getLogLogoutdate() {
		return logLogoutdate;
	}

	public void setLogLogoutdate(String logLogoutdate) {
		this.logLogoutdate = logLogoutdate;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
