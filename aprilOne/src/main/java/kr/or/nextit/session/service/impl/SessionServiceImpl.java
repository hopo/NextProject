package kr.or.nextit.session.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.comm.model.LoginInfoVo;
import kr.or.nextit.session.service.SessionService;

@Service("SessionService")
public class SessionServiceImpl implements SessionService {

	@Autowired
	private SessionMapper sessionMapper;

	@Override
	public EmployeeVo loginCheck(HashMap<String, Object> param) throws Exception {
		return sessionMapper.loginCheck(param);
	}
	
	@Override
	public void insertLoginDate(EmployeeVo employeeVo) throws Exception {
		sessionMapper.insertLoginDate(employeeVo);
	}
	
	@Override
	public void updateLogoutDate(EmployeeVo employeeVo) throws Exception {
		sessionMapper.updateLogoutDate(employeeVo);
	}
	
	@Override
	public List<LoginInfoVo> selectLoginInfoList(EmployeeVo employeeVo) throws Exception {
		return sessionMapper.selectLoginInfoList(employeeVo);
	}
}
