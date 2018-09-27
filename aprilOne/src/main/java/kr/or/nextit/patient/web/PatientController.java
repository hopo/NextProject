package kr.or.nextit.patient.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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

		try {

			patientService.insertPatient(param);
			model.addAttribute("patInsert", param);

			return "patient/patientCreateProc";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// !!!환자 리스트 화면
	@RequestMapping(value = "/patient/patientList")
	public String patientList(
				@ModelAttribute PatientVo patientVo,
				@ModelAttribute(name = "SearchVo") SearchVo searchVo,
				Model model
			) throws Exception {
		log.info(">>> /patient/patientList");
		log.debug(">>> SearchVo : {}", searchVo);

		try {

			searchVo.setTotalCount(patientService.selectTotalCount(searchVo));
			searchVo.setPageBlockSize(5);
			searchVo.setScreenSize(10);
			searchVo.pageSetting();

			commBuis.dispSearchVo(searchVo);

			List<PatientVo> items = patientService.patientSelectList(searchVo);
			log.debug(">>> items : {}", items);

			model.addAttribute("patList", items);

			return "patient/patientList";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";

	}

	// !!!환자 상세보기 화면
	@RequestMapping(value = "/patient/patientView")
	public String patientView(
				@ModelAttribute PatientVo patientVo,
				Model model
			) throws Exception {
		log.info(">>> /patient/patientView");

		PatientVo result = patientService.patientSelectView(patientVo);
		log.debug(">>> result : {}", result);

		model.addAttribute("patView", result);

		return "patient/patientView";

	}

	// !!!환자 수정 화면
	@RequestMapping(value = "/patient/patientUpdate")
	public String patientUpdate(
				@ModelAttribute PatientVo patientVo,
				Model model
			) throws Exception {
		log.info(">>> /patient/patientUpdate");

		PatientVo result = patientService.patientSelectView(patientVo);
		model.addAttribute("patUpdt", result);

		return "patient/patientUpdate";

	}

	// !!!환자 수정 프로세서
	@RequestMapping(value = "/patient/patientUpdateProc")
	public String patientUpdateProc(@ModelAttribute PatientVo patientVo) throws Exception {
		log.info(">>> /patient/patientUpdateProc");

		patientService.patientUpdate(patientVo);

		// 수정 후 리스트페이지로
		return "redirect:/patient/patientView?patCode=" + patientVo.getPatCode();

	}

}
