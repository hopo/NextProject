package kr.or.nextit.patient.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nextit.comm.model.PatientVo;
import kr.or.nextit.comm.service.impl.CommBuis;
import kr.or.nextit.comm.util.MessageVo;
import kr.or.nextit.comm.util.SearchVo;
import kr.or.nextit.patient.service.PatientService;

@Controller
public class PatientController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "PatientService")
	private PatientService patientService;

	// !비즈니스 로직
	private CommBuis commBuis = CommBuis.getInstance();

	// !메시지Vo 공동 사용
	private MessageVo msgVo = null;

	// !!!환자 등록 화면
	@RequestMapping(value = "/patient/patientCreate")
	public String patientCreate() {
		log.info(">>> /patient/patientCreate");

		return "patient/patientCreate";
	}

	// !!!환자 등록 프로세스
	@RequestMapping(value = "/patient/patientCreateProc")
	public String patientCreateProc(
				PatientVo param,
				Model model
			) {
		log.info(">>> patient/patientCreateProc");
		log.debug(">>> param : {}", param);

		try {

			patientService.insertPatient(param);

			msgVo = new MessageVo();

			msgVo.setMsgTag("info");
			msgVo.setMsgValue(String.format("환자 %s님이 등록되었습니다.", param.getPatName()));

			model.addAttribute("patInsert", param);

			model.addAttribute("msgTag", msgVo.getMsgTag());
			model.addAttribute("msgValue", msgVo.getMsgValue());

			return "patient/patientCreateProc";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// !!!환자 리스트 화면
	@RequestMapping(value = "/patient/patientList")
	public String patientList(
				@RequestParam HashMap<String, Object> param,
				@ModelAttribute PatientVo patientVo,
				@ModelAttribute(name = "searchVo") SearchVo searchVo,
				Model model
			) {
		log.info(">>> /patient/patientList");
		log.debug(">>> param : {}", param);
		log.debug(">>> patientVo : {}", patientVo);
		log.debug(">>> searchVo : {}", searchVo);

		try {

			searchVo.setTotalCount(patientService.selectTotalCount(searchVo));
			searchVo.setPageBlockSize(5);
			searchVo.setScreenSize(10);
			searchVo.pageSetting();

			commBuis.dispSearchVo(searchVo);

			List<PatientVo> items = patientService.selectPatientList(searchVo);
			log.debug(">>> items : {}", items);

			model.addAttribute("patList", items);

			model.addAttribute("msgTag", param.get("msgTag"));
			model.addAttribute("msgValue", param.get("msgValue"));
			
			return "patient/patientList";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";

	}

	// !!!환자 상세보기 화면
	@RequestMapping(value = "/patient/patientView")
	public String patientView(
				@RequestParam HashMap<String, Object> param,
				@ModelAttribute PatientVo patientVo,
				Model model
			) {
		log.info(">>> /patient/patientView");
		log.debug(">>> param : {}", param);
		log.debug(">>> patientVo : {}", patientVo);

		try {

			PatientVo result = patientService.selectPatientView(patientVo);
			log.debug(">>> result : {}", result);

			model.addAttribute("patView", result);

			model.addAttribute("msgTag", param.get("msgTag"));
			model.addAttribute("msgValue", param.get("msgValue"));

			return "patient/patientView";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// !!!환자 수정 화면
	@RequestMapping(value = "/patient/patientEdit")
	public String patientEdit(
				@ModelAttribute PatientVo param,
				Model model
			) {
		log.info(">>> /patient/patientEdit");
		log.debug(">>> param : {}", param);

		try {

			PatientVo result = patientService.selectPatientView(param);
			model.addAttribute("patUpdt", result);

			return "patient/patientEdit";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// !!!환자 수정 프로세스
	@RequestMapping(value = "/patient/patientEditProc")
	public String patientUpdateProc(
				@ModelAttribute PatientVo patientVo,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /patient/patientEditProc");
		log.debug(">>> patientVo : {}", patientVo);

		try {
			
			patientService.updatePatient(patientVo);

			msgVo = new MessageVo();

			msgVo.setMsgTag("info");
			msgVo.setMsgValue(String.format("%s님 정보가 수정되었습니다.", patientVo.getPatName()));

			hmap.put("msgTag", msgVo.getMsgTag());
			hmap.put("msgValue", msgVo.getMsgValue());

			hmap.put("patCode", patientVo.getPatCode());

			return "redirect:/patient/patientView";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

}
