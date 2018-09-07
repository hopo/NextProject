package kr.or.nextit.session.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import kr.or.nextit.comm.model.EmployeeVo;

public interface SessionService {

	/**
	 * @param hmap
	 * @return
	 * @throws Exception
	 */
	public EmployeeVo loginCheck(HashMap<String, Object> param) throws Exception;

	/**
	 * @param hmap
	 * @return
	 * @throws Exception
	 */
	public EmployeeVo getLoginInfo(HashMap<String, Object> hmap) throws Exception;

	/**
	 * @param session
	 * @throws Exception
	 */
	public void selectLogout(HttpSession session) throws Exception;

}
