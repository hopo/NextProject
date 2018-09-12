package kr.or.nextit.session.service;

import java.util.HashMap;
import java.util.List;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.comm.model.LoginInfoVo;

public interface SessionService {

	/**
	 * @param hmap
	 * @return
	 * @throws Exception
	 */
	public EmployeeVo loginCheck(HashMap<String, Object> param) throws Exception;

	/**
	 * 로그인 시 로그인 한 시간을 기록
	 * 
	 * @param employeeVo
	 * @throws Exception
	 */
	public void insertLoginDate(EmployeeVo employeeVo) throws Exception;

	/**
	 * 로그아웃 시 시간을 기록
	 * @param employeeVo
	 * @throws Exception
	 */
	public void updateLogoutDate(EmployeeVo employeeVo) throws Exception;

	/**
	 * @param employeeVo
	 * @return
	 * @throws Exception
	 */
	public List<LoginInfoVo> selectLoginInfoList(EmployeeVo employeeVo) throws Exception;

}
