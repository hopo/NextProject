package kr.or.nextit.session.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import kr.or.nextit.comm.model.EmployeeVo;

public interface SessionService {
	
	// 로그인 
	public EmployeeVo selectSession(HashMap<String,Object> hmap)throws Exception;
	
	// 접속 정보  
	public EmployeeVo selectLoginInfo(HashMap<String,Object> hmap)throws Exception;
	
	// 로그아웃 
	public void selectLogOut(HttpSession session)throws Exception;
	
	
	
	
	
	
	

}
