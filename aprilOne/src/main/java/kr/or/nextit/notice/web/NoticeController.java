package kr.or.nextit.notice.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nextit.comm.model.NoticeVo;
import kr.or.nextit.comm.service.impl.CommBuis;
import kr.or.nextit.comm.util.MessageVo;
import kr.or.nextit.comm.util.MessageVo;
import kr.or.nextit.comm.util.SearchVo;
import kr.or.nextit.notice.service.NoticeService;

@Controller
public class NoticeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "NoticeService")
	private NoticeService noticeService;

	// !비즈니스 로직
	private CommBuis commBuis = CommBuis.getInstance();

	// !메시지Vo 공동 사용
	MessageVo msgVo = null;


	// !!!게시판리스트 화면 
	@RequestMapping(value = "/notice/noticeList")
	public String noticeList(
				@RequestParam HashMap<String, Object> param,
				@ModelAttribute(name = "searchVo") SearchVo searchVo,
				HashMap<String, Object> hmap
			) {
		log.info(">>> notice/noticeList");
		log.debug(">>> param : {}", param);
		log.debug(">>> searchVo : {}", searchVo);
		
		try {

			searchVo.setTotalCount(noticeService.selectTotalCount(searchVo));
			searchVo.setPageBlockSize(5);
			searchVo.setScreenSize(10);
			searchVo.pageSetting();

			commBuis.dispSearchVo(searchVo);

			List<NoticeVo> result = noticeService.selectNoticeList(searchVo); 
			log.debug(">>> result : {}", result);

			hmap.put("result", result);
			hmap.put("msgTag", param.get("msgTag"));
			hmap.put("msgValue", param.get("msgValue"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "notice/noticeList";
	}

	// !!!글작성 화면 
	@RequestMapping(value = "/notice/noticeCreate")
	public String noticeCreate(
				HashMap<String, Object> hmap
			) {
		log.info(">>> notice/noticeCreate");

		return "notice/noticeCreate";
	}

	// !!!글작성 프로세스
	@RequestMapping(value = "/notice/noticeCreateProc")
	public String noticeRegist(
				@RequestParam HashMap<String, Object> param,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /notice/noticeCreateProc");
		log.debug(">>> param : {}", param);

		try {

			noticeService.insertNotice(param);

			msgVo = new MessageVo();
			msgVo.setMsgTag("info");
			msgVo.setMsgValue(String.format("%s님의 새로운 글이 등록 되었습니다.", param.get("empId")));

			hmap.put("msgTag", msgVo.getMsgTag());
			hmap.put("msgValue", msgVo.getMsgValue());

			return "redirect:/notice/noticeList";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";
	}

	// !!!글 상세보기 화면
	@RequestMapping(value = "/notice/noticeView")
	public String noticeView(
				@RequestParam HashMap<String, Object> param,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /notice/noticeView");
		log.debug(">>> param : {}", param);

		try {

			noticeService.updateViewCount((String)param.get("ntcIdx")); // ;;조회수를 올려요
			NoticeVo item = noticeService.selectNoticeItem(param);
			log.debug(">>> item : {}", item);

			hmap.put("item", item);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "notice/noticeView";
	}

	// 수정
	@RequestMapping(value = "/notice/noticeEdit")
	public String noticeEdit(HashMap<String, Object> hmap, @RequestParam HashMap<String, Object> param) {
		log.info(">>> /notice/noticeEdit");
		log.debug(">>> param : {}", param);

		NoticeVo item = null;

		try {
			item = noticeService.selectNoticeItem(param); // 메서드 확인해야함
		} catch (Exception e) {
			e.printStackTrace();
		}

		log.debug(">>> item : {}", item);
		hmap.put("item", item);

		return "notice/noticeEdit";
	}

	// 수정처리
	@RequestMapping(value = "/notice/noticeEditProc")
	public String noticeEditProc(@ModelAttribute NoticeVo param) {
		log.info(">>> /notice/noticeEditProc");
		log.debug(">>> param : {}", param);

		try {
			noticeService.updateNotice(param);
			String resultViewUrl = String.format("redirect:/notice/noticeView?ntcIdx=%s", param.getNtcIdx());

			return resultViewUrl;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// 삭제(화면)
	@RequestMapping(value = "/notice/noticeDelete")
	public String noticeDelete(@ModelAttribute NoticeVo param) {
		log.info(">>> /notice/noticeDelete");
		log.debug(">>> param : {}", param);

		return "notice/noticeDelete";
	}

	// 삭제처리프로세서
	@RequestMapping(value = "/notice/noticeDeleteProc")
	public String noticeDeleteProc(@ModelAttribute NoticeVo param) {
		log.info(">>> /notice/noticeDeleteProc");
		log.debug(">>> param : {}", param);

		try {
			noticeService.updateDelNotice(param);

			return "redirect:/notice/noticeList";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

}
