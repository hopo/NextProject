package kr.or.nextit.session.service.impl;

import java.util.HashMap;

import kr.or.nextit.comm.model.EmployeeVo;

public interface SessionMapper {
	
	public EmployeeVo selectSession(HashMap<String, Object> param) throws Exception;
	
	

}
