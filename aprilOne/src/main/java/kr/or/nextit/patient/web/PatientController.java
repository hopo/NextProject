package kr.or.nextit.patient.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nextit.comm.model.PatientVo;
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
	
	
	
	

	// 환자 등록 결과
	@RequestMapping(value = "/patient/patientCreateProc")
	public String patientCreate(PatientVo patientvo, Model model) throws Exception {
		log.info(">>> patient/patientCreateProc");

		patientService.patientInsert(patientvo);
		model.addAttribute("patientInsert", patientvo);         

		return "patient/patientCreateProc";

	}
	
	
	
	 // 환자 리스트
	  @RequestMapping(value = "patient/patientList") 
	  public String patientList(
			    @ModelAttribute PatientVo patientVo
			  , Model model 

			  ) throws Exception {
	  log.info(">>> patient/patientList");
	  
	  List<PatientVo> items =  patientService.selectPatientList(patientVo);
	  model.addAttribute("patinetList", items);

	  
	  
	  
	  return "patient/patientList";
	  
	  }
	  
	
	  
	  
	  
	  
	  
	  // 환자정보 상세보기
	  
	  @RequestMapping(value = "patient/patientView") public String patientView() {
	  log.info(">>> patient/patientView");
	  
	  return "patient/patientView";
	 
	  }

}






















