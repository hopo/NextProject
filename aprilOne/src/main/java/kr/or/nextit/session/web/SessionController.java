package kr.or.nextit.session.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SessionController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "session/login")
	public String login() {
		log.info(">>> session/login");

		return "session/login";

	}

}
