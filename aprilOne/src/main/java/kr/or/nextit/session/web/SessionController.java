package kr.or.nextit.session.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.comm.model.LoginInfoVo;
import kr.or.nextit.comm.service.impl.CommBuis;
import kr.or.nextit.comm.util.MessageVo;
import kr.or.nextit.session.service.SessionService;

@Controller
public class SessionController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "SessionService")
	private SessionService sessionService;

	// !비즈니스 로직
	private CommBuis commBuis = CommBuis.getInstance();

	// !메시지Vo 공동 사용
	private MessageVo msgVo = null;


	// !!!로그인 화면
	@RequestMapping(value = "/session/login")
	public String login(
				@RequestParam HashMap<String, Object> param,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /session/login");
		log.debug(">>> param {}", param);
		
		hmap.put("msgTag", param.get("msgTag"));
		hmap.put("msgValue", param.get("msgValue"));

		return "session/login";
	}

	// !!!로그인 프로세스 
	// - 로그인 성공시 : 인덱스 화면
	// - 로그인 실패시 : (메시지 던지고)
	@RequestMapping(value = "/session/loginProc")
	public String loginProc(
				@RequestParam HashMap<String, Object> param,
				@Valid EmployeeVo employeeVo,
				Errors error,
				HttpSession session
			) {
		log.info(">>> /session/loginProc");

		try {

			employeeVo = sessionService.loginCheck(param); // ;해당 계정이 있는 지 비밀번호가 맞는지
			log.debug(">>> employeeVo : {}", employeeVo);

			if (employeeVo != null) {
				// ;로그인이 가능합니다
				log.debug(">>> loginInfo : {}", employeeVo);
				
				// ;로그인 정보를 세션에 저장
				session.setAttribute("loginInfo", employeeVo);

				// ;로그인 접속날짜를 TB_LOGIN_INFO에 저장
				sessionService.insertLoginDate(employeeVo);
	
				return "redirect:/index";

			} else {
				// ;로그인이 NOT 가능합니다
				error.reject("error", "Error : 아이디와 비밀번호 확인해라");

				return "session/login";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";
		
	}

	// !!!로그인 사용자 정보
	@RequestMapping(value = "/session/loginInfo")
	public String loginInfo(
				HashMap<String, Object> hmap,
				HttpSession session
			) {
		log.info(">>> /session/loginInfo");

		EmployeeVo employeeVo = (EmployeeVo)session.getAttribute("loginInfo");

		hmap.put("loginInfo", employeeVo);

		return "session/loginInfo";
	}

	// !!!로그아웃 프로세스
	@RequestMapping(value = "/session/logout")
	public String logoutProc(HttpSession session) {
		log.info(">>> /session/logout");

		EmployeeVo employeeVo = (EmployeeVo) session.getAttribute("loginInfo");

		try {
			// ;로그아웃 날짜를 TB_LOGIN_INFO에 저장
			sessionService.updateLogoutDate(employeeVo);

			// ;저장되어있는 세션을 삭제합니다
			session.invalidate(); 

			return "redirect:/session/login";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";
	}

	// !!!이전접속정보 보여주기 (AJAX)
	@RequestMapping(value = "/session/showDateInfoProc")
	@ResponseBody
	public HashMap<String, Object> showDateInfoProc( 
				@RequestParam HashMap<String, Object> param
			) {
		log.info("/session/showDateInfoProc");
		log.debug("param : {}",param);

		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setEmpId((String)param.get("empId"));
		
		HashMap<String, Object> hmap = new HashMap<>();;

		try {

			List<LoginInfoVo> result = sessionService.selectLoginInfoList(employeeVo); // ;TB_LOGIN_INFO로 부터 조회
			log.debug("result : {}", result);
			
			hmap.put("result", result);

			return hmap;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		hmap.put("message", ">>> showDateInfoProc() is something wrong!");
		
		return hmap;
	}

}
