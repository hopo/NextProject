package kr.or.nextit.session.service.impl;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.session.service.SessionService;

@Service("SessionService")
public class SessionServiceImpl implements SessionService {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SessionMapper sessionMapper;

	@Override
	public EmployeeVo selectSession(HashMap<String, Object> param) throws Exception {

		
		
		return sessionMapper.selectSession(param);
		
		
	}
	
	
	
	

}
