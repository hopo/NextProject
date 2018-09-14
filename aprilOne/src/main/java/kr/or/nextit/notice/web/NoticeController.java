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
import kr.or.nextit.comm.util.NoticeSearchVo;
import kr.or.nextit.notice.service.NoticeService;

@Controller
public class NoticeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "NoticeService")
	private NoticeService noticeService;

	// 리스트
	@RequestMapping(value = "/notice/noticeList")
	public String noticeList( @ModelAttribute("NoticeSearchVo") NoticeSearchVo vo 
			                 , HashMap<String, Object> hmap) throws Exception {
		log.info(">>> notice/noticeList");
		
		
		vo.setSearchTable("tb_notice");
		vo.setTotalCount(noticeService.selectTotalCount(vo));
		vo.setPageBlockSize(5);
		vo.setScreenSize(10);
		vo.pageSetting();
	
		List<NoticeVo> result = noticeService.selectNoticeList(vo);
		
		hmap.put("result", result);

		return "notice/noticeList";
	}

	// 글작성(화면)
	@RequestMapping(value = "/notice/noticeForm")
	public String noticeForm(HashMap<String, Object> hmap) throws Exception {
		log.info(">>> notice/noticeForm");

		return "notice/noticeForm";
	}

	// 저장(글작성프로세스)
	@RequestMapping(value = "/notice/noticeRegist")
	public String noticeRegist(@RequestParam HashMap<String, Object> param) throws Exception {
		log.info(">>> notice/noticeRegist");
		log.info(">>> param = {}", param);

		// TODO : 로그인이후 수정 필요
		param.put("empId", "cha");

		noticeService.insertNotice(param);

		return "redirect:/notice/noticeList";

	}

	// 상세보기
	@RequestMapping(value = "/notice/noticeView")
	public String noticeView(
				HashMap<String, Object> hmap,
				@RequestParam HashMap<String, Object> param
			) {
		log.info(">>> /notice/noticeView");
		log.debug(">>> param : {}", param);
		
		NoticeVo item = null;
		try {
			item = noticeService.selectNoticeItem(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		log.debug(">>> item : {}", item);
		hmap.put("item", item);
		
		return "notice/noticeView";
	}
	// 수정
		@RequestMapping(value = "/notice/noticeEdit")
		public String noticeEdit(
					HashMap<String, Object> hmap,
					@RequestParam HashMap<String, Object> param
				) {
			log.info(">>> /notice/noticeEdit");
			log.debug(">>> param : {}", param);
			
			NoticeVo item = null;

			try {
				item = noticeService.selectNoticeItem(param);   // 메서드 확인해야함
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			log.debug(">>> item : {}", item);
			hmap.put("item", item);
			
			return "notice/noticeEdit";
		}
		
		// 수정처리
		@RequestMapping(value = "/notice/noticeEditProc")
		public String noticeEditProc(
					@ModelAttribute NoticeVo param
				) {
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
		
		//삭제(화면)
		@RequestMapping(value = "/notice/noticeDelete")
		public String noticeDelete(
					@ModelAttribute NoticeVo param
				) {
			log.info(">>> /notice/noticeDelete");
			log.debug(">>> param : {}", param);
			
			return "notice/noticeDelete";
		}
		
		//삭제처리프로세서
		@RequestMapping(value = "/notice/noticeDeleteProc")
		public String noticeDeleteProc(
					@ModelAttribute NoticeVo param
				) {
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
