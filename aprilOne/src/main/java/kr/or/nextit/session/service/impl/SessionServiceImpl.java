package kr.or.nextit.session.service.impl;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	public EmployeeVo loginCheck(HashMap<String, Object> param) throws Exception {
		return sessionMapper.loginCheck(param);

	}

//	@Override
//	public EmployeeVo getLoginInfo(HashMap<String, Object> hmap) throws Exception {
//		return null;
//	}

//	@Override
//	public void selectLogout(HttpSession session) throws Exception { }

}
