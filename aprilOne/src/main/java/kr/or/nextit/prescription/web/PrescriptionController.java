package kr.or.nextit.prescription.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nextit.comm.model.PrescriptionVo;
import kr.or.nextit.prescription.service.PrescriptionService;

@Controller
public class PrescriptionController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	PrescriptionService prescriptionService;

	
	
	// !!! 처방조회 폼 화면
	@RequestMapping("/prescription/prescriptionView")
	public String prescriptionSelect() {
		log.info(">>> /prescription/prescriptionView");
	
		
		return "prescription/prescriptionView";
	
	}
	
	

	// !!! 처방 등록
	@RequestMapping("/prescription/prescriptionCreate")
	public String prescriptionCreate(PrescriptionVo prescriptionVo) throws Exception {
		log.info(">>> /prescription/prescriptionCreate");
		
		prescriptionService.prescriptionViewSelect(prescriptionVo);
		
		
		
		
		
		
		return "prescription/prescriptionCreate";
		
	}

	
	
	
	
	
	
	
	
}













