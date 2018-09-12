package kr.or.nextit.session.service.impl;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import kr.or.nextit.comm.model.EmployeeVo;

public interface SessionMapper {
	
	/**
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public EmployeeVo loginCheck(HashMap<String, Object> param) throws Exception;

	/**
	 * @param loginEmpId
	 * @throws Exception
	 */
	public void insertLoginDate(EmployeeVo employeeVo) throws Exception;
	

	/**
	 * @param employeeVo
	 * @throws Exception
	 */
	public void updateLogoutDate(EmployeeVo employeeVo) throws Exception;
	
}
