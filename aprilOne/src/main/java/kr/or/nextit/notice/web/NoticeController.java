package kr.or.nextit.notice.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.nextit.comm.model.NoticeVo;
import kr.or.nextit.notice.service.NoticeService;

@Controller
public class NoticeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "NoticeService")
	private NoticeService noticeService;

	// 리스트
	@RequestMapping(value = "/notice/noticeList")
	public String noticeList(HashMap<String, Object> hmap) throws Exception {
		log.info(">>> notice/noticeList");

		List<NoticeVo> result = noticeService.selectNoticeList();

		hmap.put("result", result);

		return "notice/noticeList";
	}

	// 글작성
	@RequestMapping(value = "/notice/noticeForm")
	public String noticeForm(HashMap<String, Object> hmap) throws Exception {
		log.info(">>> notice/noticeForm");

		return "notice/noticeForm";
	}

	// 저장
	@RequestMapping(value = "/notice/noticeRegist")
	public String noticeRegist(@RequestParam HashMap<String, Object> param) throws Exception {
		log.info(">>> notice/noticeRegist");
		log.info(">>> param = {}", param);

		// TODO : 로그인이후 수정 필요
		param.put("empId", "cha");

		noticeService.insertNitice(param);

		return "redirect:/notice/noticeList";

	}

	// 상세보기
	@RequestMapping(value = "/notice/noticeView")
	public String noticeView(Model model, ModelMap modelMap,

			@RequestParam HashMap<String, Object> param

	) throws Exception {

		log.info(">>> notice/noticeView");

		log.debug(">>> param : {}", param);

		HashMap<String, Object> result = noticeService.noticeView(param);

		log.debug("가져온값 result {}", result);

		// model.addAttribute("result", result);
		modelMap.addAttribute("result", result);

		return "notice/noticeView";
	}

	// 수정
	@RequestMapping(value = "/notice/noticeUpdate")
	public String noticeUpdate(@RequestParam HashMap<String, Object> param) throws Exception {
		log.info(">>> notice/noticeUpdate");
		
		
		noticeService.noticeUpdate(param);

		return "redirect:/notice/noticeUpdate";

	}

}
