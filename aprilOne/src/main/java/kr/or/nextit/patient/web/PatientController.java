package kr.or.nextit.patient.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nextit.comm.model.PatientVo;
import kr.or.nextit.comm.util.SearchVo;
import kr.or.nextit.patient.service.PatientService;

@Controller
public class PatientController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	PatientService patientService;

	// 환자등록 폼
	@RequestMapping(value = "/patient/patientCreate")
	public String patientCreate() {
		log.info(">>> patient/patientCreate");

		return "patient/patientCreate";

	}

	// 환자 등록 후 결과까지 입니당 *^^*
	@RequestMapping(value = "/patient/patientCreateProc")
	public String patientCreateProc(PatientVo patientvo, Model model) throws Exception {
		log.info(">>> patient/patientCreateProc");

		patientService.patientInsert(patientvo);
		model.addAttribute("patInsert", patientvo);

		return "patient/patientCreateProc";

	}

	// 환자 리스트
	@RequestMapping(value = "/patient/patientList")
	public String patientList(@ModelAttribute PatientVo patientVo, Model model,
			@ModelAttribute(name = "SearchVo") SearchVo SearchVo

	) throws Exception {
		log.debug(">>> /patient/patientList");
		 log.debug("SearchVo = {}", SearchVo); 

		try {

			SearchVo.setTotalCount(patientService.selectTotalCount(SearchVo));
			SearchVo.setPageBlockSize(10);
			SearchVo.setScreenSize(5);
			SearchVo.pageSetting();

			List<PatientVo> items = patientService.patientSelectList(SearchVo);
			log.debug(">>> items : {}", items);

			model.addAttribute("patList", items);

		} catch (Exception e) {

			e.printStackTrace();

		}

		return "patient/patientList";

	}

	// 환자정보 상세보기
	@RequestMapping(value = "/patient/patientView")
	public String patientView(@ModelAttribute PatientVo patientVo, Model model) throws Exception {
		log.info(">>> patient/patientView");

		PatientVo result = patientService.patientSelectView(patientVo);
		log.debug(">>> result : {}", result);

		model.addAttribute("patView", result);

		return "patient/patientView";

	}

	// 환자정보 수정 페이지

	@RequestMapping(value = "/patient/patientUpdate")
	public String patientUpdate(@ModelAttribute PatientVo patientVo, Model model) throws Exception {
		log.info(">>> patient/patientUpdate");

		PatientVo result = patientService.patientSelectView(patientVo);
		model.addAttribute("patUpdt", result);

		return "patient/patientUpdate";

	}

	// 환자정보 수정 완료

	@RequestMapping(value = "/patient/patientUpdateProc")
	public String patientUpdateProc(@ModelAttribute PatientVo patientVo) throws Exception {
		log.info(">>> patient/patientUpdateProc");

		patientService.patientUpdate(patientVo);

		// 수정 후 리스트페이지로
		return "redirect:/patient/patientView?patCode=" + patientVo.getPatCode();

	}

}
