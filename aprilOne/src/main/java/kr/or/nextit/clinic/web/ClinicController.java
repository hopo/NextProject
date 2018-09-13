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
import kr.or.nextit.comm.service.PaginationService;
import kr.or.nextit.comm.util.SearchVo;

@Controller
public class ClinicController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "ClinicService")
	private ClinicService clinicService;
	
	@Resource(name = "PaginationService")
	private PaginationService paginationService;

	// !!!진료리스트 화면
	@RequestMapping(value = "/clinic/clinicList")
	public String clinicList(
				HashMap<String, Object> hmap,
				@ModelAttribute(name = "searchVo") SearchVo searchVo // ; name='*' 과 jsp 쪽 form commandName='*' 같음
			) {
		log.info(">>> /clinic/clinicList");
		log.debug(">>> searchVo : {}", searchVo);

		List<ClinicVo> result = null;

		try {

			searchVo.setTotalCount(paginationService.selectTotalCount(searchVo));
			searchVo.setPageBlockSize(5);
			searchVo.setScreenSize(10);
			searchVo.pageSetting();
			
			log.debug(">>> ====== customerSearchVo ======");
			log.debug(">>> TotalCount: {}", searchVo.getTotalCount());
			log.debug(">>> ScreenSize: {}", searchVo.getScreenSize());
			log.debug(">>> TotalPageCount: {}", searchVo.getTotalPageCount());
			log.debug(">>> CurPage: {}", searchVo.getCurPage());
			log.debug(">>> EndPage: {}", searchVo.getEndPage());
			log.debug(">>> StartRow: {}", searchVo.getStartRow());
			log.debug(">>> EndRow: {}", searchVo.getEndRow());
			log.debug(">>> ===============================");

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
			HashMap<String, Object> hmap,
			@RequestParam HashMap<String, Object> param
		) {
		log.info(">>> /clinic/clinicView");

		ClinicVo item = null;

		try {

			item = clinicService.selectClinicItem(param);

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		log.debug(">>> item : {}", item);
		hmap.put("item", item);

		return "clinic/clinicView";

	}
 
	// !!!진료 기록 화면
	@RequestMapping(value = "/clinic/clinicCreate")
	public String clinicCreate() {
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
			hmap.put("param", param);

			return "clinic/clinicCreateProc";

		} catch (Exception e) {

			e.printStackTrace();

		}

		return "wrong";
	}
}







