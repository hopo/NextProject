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
import org.springframework.web.servlet.ModelAndView;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.session.service.SessionService;

@Controller
public class SessionController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "SessionService")
	private SessionService sessionService;

	// !!!로그인 화면
	@RequestMapping(value = "/session/login")
	public String login() {
		log.debug(">>> /session/login");

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
		log.debug(">>> /session/loginProc");

		try {
			employeeVo = sessionService.loginCheck(param);
			log.debug(">>> employeeVo : {}", employeeVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (employeeVo != null) {
			session.setAttribute("loginInfo", employeeVo);
			log.debug(">>> loginInfo : {}", employeeVo);

			return "redirect:/index";
		} else {
			error.reject("error", " : 해당 직원이 존재하지 않습니다.");
			return "session/login";
		}
	}

	// !!!로그인 사용자 정보
	@RequestMapping(value = "/session/loginInfo")
	public String loginInfo(
				HashMap<String, Object> hmap,
				HttpSession session
			) {
		log.debug(">>> /session/loginInfo");
		
		hmap.put("loginInfo", (EmployeeVo)session.getAttribute("loginInfo"));

		return "session/loginInfo";
	}

	// 로그아웃 결과
	@RequestMapping(value = "/session/logout")
	public String logoutProc(
			HttpSession session,
			EmployeeVo employeeVo,
			ModelAndView modelAndView
		) throws Exception {

		log.debug(">>> /session/logout");

		session.invalidate();

		// 정상 로그아웃 결과 다시 로그인 폼으로 이동
		return "redirect:/session/login";

	}

}
