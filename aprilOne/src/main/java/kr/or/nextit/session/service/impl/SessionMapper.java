package kr.or.nextit.session.service.impl;

import java.util.HashMap;

import kr.or.nextit.comm.model.EmployeeVo;

public interface SessionMapper {
	
	// 로그인 
	public EmployeeVo selectSession(HashMap<String, Object> hmap) throws Exception;
	
	// 접속 정보  
	public EmployeeVo selectLoginInfo(HashMap<String,Object> hmap)throws Exception;

}
