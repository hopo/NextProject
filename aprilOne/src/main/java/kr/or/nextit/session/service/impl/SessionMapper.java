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
	
//	public EmployeeVo getLoginInfo(HashMap<String,Object> hmap)throws Exception;

//	public void selectLogOut(HttpSession session)throws Exception;
		
	
	
}
