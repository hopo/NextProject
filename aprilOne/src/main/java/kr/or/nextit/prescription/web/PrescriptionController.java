package kr.or.nextit.prescription.web;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nextit.clinic.service.ClinicService;
import kr.or.nextit.comm.model.ClinicVo;
import kr.or.nextit.comm.model.MedicineVo;
import kr.or.nextit.comm.model.PrescriptionVo;
import kr.or.nextit.medicine.service.MedicineService;
import kr.or.nextit.prescription.service.PrescriptionService;

@Controller
public class PrescriptionController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	PrescriptionService prescriptionService;
	@Autowired
	ClinicService clinicService;
	@Autowired
	MedicineService medicineService;

	
	// !!! 처방등록 폼 화면
	@RequestMapping("/prescription/prescriptionView")
	public String prescriptionSelect() {
		log.info(">>> /prescription/prescriptionView");
	
		return "prescription/prescriptionView";
	
	}
	
	

	// 진료테이블에서 정보가져오기 
	@RequestMapping("/prescription/prescriptionCreate")
	public String prescriptionCreate( @RequestParam(name="clnCode", defaultValue="c11111" , required=false ) String clnCode , 
													HashMap<String, Object> param,
													Model model
													) throws Exception {
		log.info(">>> /prescription/prescriptionCreate clnCode= {}", clnCode);
		
		param.put("clnCode", clnCode);
		
		// 진료정보를 조회하여 모델에 저장 	
		 ClinicVo clinicVo = clinicService.selectClinicItem(param);
		 model.addAttribute("clinicVo", clinicVo );
		 
		// TODO : 처방이력목록을 조회하여 모델에 저장 
		// model.addAttribute("",   )
		
		//약품목록을 조회하여 모델에 저장
		List<MedicineVo> medList = medicineService.medicineSelectList(null);
		 model.addAttribute("medList", medList  );
		
		return "prescription/prescriptionCreate";
		
	}

	
	// 처방 등록 
	@RequestMapping("/prescription/prescriptionCreateProc")
	public String insertPrescription(PrescriptionVo prescriptionVo,
									Model model) throws Exception {
		
		prescriptionService.insertPrescription(prescriptionVo);
		model.addAttribute("preInsert", prescriptionVo );
		
		return "/prescription/prescriptionCreateProc";
		
	}
	
	
	
	
	
	
	
	
}













