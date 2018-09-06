package kr.or.nextit.session.service;

import java.util.HashMap;

import kr.or.nextit.comm.model.EmployeeVo;

public interface SessionService {
	
	public EmployeeVo selectSession(HashMap<String, Object> param) throws Exception;

}
