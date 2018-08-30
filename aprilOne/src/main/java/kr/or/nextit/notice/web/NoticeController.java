package kr.or.nextit.notice.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "notice/noticeList")
	public String noticeList() {
		log.info(">>> notice/noticeList");

		return "notice/noticeList";
	}

	@RequestMapping(value = "notice/noticeView")
	public String noticeView() {
		log.info(">>> notice/noticeView");

		return "notice/noticeView";
	}

}
