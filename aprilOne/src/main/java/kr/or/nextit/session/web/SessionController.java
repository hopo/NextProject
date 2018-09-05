package kr.or.nextit.session.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.session.service.SessionService;

@Controller
public class SessionController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "SessionService")
	private SessionService sessionService;

	
	// 로그인폼 
	@RequestMapping(value = "session/login")
	public String login() {
		log.info(">>> session/login");

		return "session/login";
	}

	
	
	
	//  로그인 결과 
	@RequestMapping(value = "/loginProc")
	public String loginProc(@RequestParam HashMap<String, Object> hmap
			                ,  @Valid EmployeeVo employeeVo
			                ,  Errors error 
			                ,  HttpSession session ) throws Exception {
		log.info(">>> session/loginProc");
		
		
		// 서비스(매퍼)에서 처리한 결과 가져와 employeeVo 변수에 담음 
		employeeVo = sessionService.selectSession(hmap);
		
		
		if(employeeVo != null) {
			
			// 로그인 정보를 session에 담음 
			session.setAttribute("loginInfo", employeeVo);
			
			// 정상적 로그인시 첫화면으로 이동 
			return "redirect:/";
			
		}else {
			
			error.reject("error","해당 직원이 존재하지 않습니다.");
			return "session/login";
			
		}
	}
	
	
/*	
	
	// 로그아웃 결과 
	public String logoutProc(HashMap<String, Object> hmap
							, HttpSession session
							, EmployeeVo employeeVo 
							
							) throws Exception {
		
		log.info(">>> session/logoutProc");
		
		session.invalidate();
		
		// 정상 로그아웃 결과 다시 로그인 폼으로 이동 
		return "redirect:/session/login";
	}
	*/
	
	
	
	
	
	
	// 로그인 사용자 정보 
	@RequestMapping(value = "session/loginInfo")
	public String loginInfo(HttpSession session
			, 
			
			
			
			
			)throws Exception {
		log.info(">>> session/loginInfo");

		
		
		
		
		
		return "session/loginInfo";
	}

	

}
















