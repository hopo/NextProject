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

	// !비즈니스 로직
	private CommBuis commBuis = CommBuis.getInstance();

	// !메시지Vo 공동 사용
	private MessageVo msgVo = null;


	// !!!진료 기록 화면
	@RequestMapping(value = "/clinic/clinicCreate")
	public String clinicCreate(HashMap<String, Object> hmap) {
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

			return "redirect:/clinic/clinicView";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// !!!진료리스트 화면
	@RequestMapping(value = "/clinic/clinicList")
	public String clinicList(
				@ModelAttribute(name = "searchVo") SearchVo searchVo,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /clinic/clinicList");
		log.debug(">>> searchVo : {}", searchVo);

		try {

			searchVo.setTotalCount(clinicService.selectTotalCount(searchVo));
			searchVo.setPageBlockSize(5);
			searchVo.setScreenSize(10);
			searchVo.pageSetting();

			commBuis.dispSearchVo(searchVo);

			List<ClinicVo> result = clinicService.selectClinicList(searchVo);
			log.debug(">>> result : {}", result);
			
			hmap.put("result", result);

			return "clinic/clinicList";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";

	}

	// !!!진료 상세보기 화면
	@RequestMapping(value = "/clinic/clinicView")
	public String clinicView(
			@RequestParam HashMap<String, Object> param,
			HashMap<String, Object> hmap
		) {
		log.info(">>> /clinic/clinicView");
		log.debug("param : {}", param);
		
		try {

			if (param.get("clnCode") == null) {
				String lastItemCode = clinicService.selectClinicLastItemCode();
				log.debug("lastItemCode : {}", lastItemCode);

				param.put("clnCode", lastItemCode);
				hmap.put("clnCode", lastItemCode);
			} else {
				// ;;진료 리스트로부터 넘어올 때
				hmap.put("clnCode", param.get("clnCode"));
				hmap.put("patName", param.get("patName"));
				hmap.put("empName", param.get("empName"));
			}
			
			ClinicVo item = clinicService.selectClinicItem(param);
			log.debug(">>> item : {}", item);

			hmap.put("item", item);

			return "clinic/clinicView";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}
 
}
