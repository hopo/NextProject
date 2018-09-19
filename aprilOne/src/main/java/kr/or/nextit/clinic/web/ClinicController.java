package kr.or.nextit.clinic.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nextit.clinic.service.ClinicService;
import kr.or.nextit.comm.model.ClinicVo;
import kr.or.nextit.comm.service.impl.CommBuis;
import kr.or.nextit.comm.util.MessageVo;
import kr.or.nextit.comm.util.SearchVo;

@Controller
public class ClinicController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "ClinicService")
	private ClinicService clinicService;

//	@Resource(name = "PaginationService")
//	private PaginationService paginationService;

	// !비즈니스 로직
	private CommBuis commBuis = new CommBuis();

	// !메시지Vo 공동 사용
	MessageVo msgVo = new MessageVo();

	// !!!진료리스트 화면
	@RequestMapping(value = "/clinic/clinicList")
	public String clinicList(
				HashMap<String, Object> hmap,
				@ModelAttribute(name = "searchVo") SearchVo searchVo
			) {
		log.info(">>> /clinic/clinicList");
		log.debug(">>> searchVo : {}", searchVo);

		List<ClinicVo> result = null;

		try {

			// ;PaginationService를 공통으로 사용해보려 했지만 조인을 구현하다보니 아마도 dead code, searchVo.setSearchTable()도 물론
			//searchVo.setSearchTable("tb_clinic");
			searchVo.setTotalCount(clinicService.selectTotalCount(searchVo));
			searchVo.setPageBlockSize(5);
			searchVo.setScreenSize(10);
			searchVo.pageSetting();

			commBuis.dispSearchVo(searchVo);

			result = clinicService.selectClinicList(searchVo);
			log.debug(">>> result : {}", result);

			hmap.put("result", result);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "clinic/clinicList";

	}

	// !!!진료 상세보기 화면
	@RequestMapping(value = "/clinic/clinicView")
	public String clinicView(
			@RequestParam HashMap<String, Object> param,
			HashMap<String, Object> hmap
		) {
		log.info(">>> /clinic/clinicView");
		log.debug("######param : {}", param);

		hmap.put("clnCode", param.get("clnCode")); // null 이라서 create에서 넘어 올 경우 뷰가 보이지 않는다
		hmap.put("patName", param.get("patName"));
		hmap.put("empName", param.get("empName"));

		ClinicVo item = null;

		try {
			item = clinicService.selectClinicItem(param);
			log.debug(">>> item : {}", item);

			hmap.put("item", item);
			log.debug("$$$$hmap : {}", hmap);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "clinic/clinicView";

	}
 
	// !!!진료 기록 화면
	@RequestMapping(value = "/clinic/clinicCreate")
	public String clinicCreate(
			) {
		log.info(">>> /clinic/clinicCreate");


		return "clinic/clinicCreate";
	}

	// !!!진료 기록 프로세스
	@RequestMapping(value = "/clinic/clinicCreateProc")
	public String clinicCreateProc(
				@RequestParam HashMap<String, Object> param,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /clinic/clinicCreateProc");
		log.debug("param : {}", param);
		
		try {

			clinicService.insertClinic(param);

			hmap.put("patCode", param.get("patCode"));
			hmap.put("empId", param.get("empId"));

			log.debug("@@@@@@hmap : {}", hmap);

			return "redirect:/clinic/clinicView";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}
}

