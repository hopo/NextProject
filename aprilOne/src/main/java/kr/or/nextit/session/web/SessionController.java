package kr.or.nextit.session.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nextit.session.service.SessionService;

@Controller
public class SessionController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "SessionService")
	private SessionService sessionService;

	@RequestMapping(value = "session/login")
	public String login() {
		log.info(">>> session/login");

		return "session/login";
	}

	@RequestMapping(value = "session/loginInfo")
	public String loginInfo() {
		log.info(">>> session/loginInfo");

		return "session/loginInfo";
	}

	@RequestMapping(value = "session/logoutProc")
	public String logoutProc() {
		log.info(">>> session/logoutProc");

		return "redirect:/index";
	}

}
