package kr.or.nextit.notice.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nextit.comm.model.NoticeVo;
import kr.or.nextit.notice.service.NoticeService;

@Controller
public class NoticeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value = "notice/noticeList")
	public String noticeList() throws Exception {
		log.info(">>> notice/noticeList");
		
		List<NoticeVo> result = noticeService.selectNoticeList();
		
		// result 화면에 보여주기 위해 뭔가의 작업 
		
		return "notice/noticeList";
	}

	@RequestMapping(value = "notice/noticeView")
	public String noticeView() throws Exception {
		log.info(">>> notice/noticeView");

		return "notice/noticeView";
	}

}
