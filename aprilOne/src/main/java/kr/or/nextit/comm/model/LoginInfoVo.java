package kr.or.nextit.comm.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class LoginInfoVo implements Serializable {

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
	
}
