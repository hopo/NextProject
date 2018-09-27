package kr.or.nextit.medicine.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nextit.comm.model.MedicineVo;
import kr.or.nextit.medicine.service.MedicineService;

@Controller
public class MedicineController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	 MedicineService medicineService;
	
	// 약품등록 폼 화면 
		@RequestMapping(value="/medicine/medicineCreate")
		public String medicineCreate() throws Exception {
			log.info(">>> /medicine/medicineCreate");
			
		  return "medicine/medicineCreate";
			
		}
		
		
		
	// 약품등록
	@RequestMapping(value="/medicine/medicineCreateProc")
	public String medicineCreateProc(MedicineVo medicineVo) throws Exception {
		
		medicineService.insertMedicine(medicineVo);
		
		return "medicine/medicineCreateProc";
		
	}
		
		
		
	
		
	// 약품 리스트 
	/*@RequestMapping("/medicine/medicineList")
	public String medicineSelectList(@ModelAttribute MedicineVo medicineVo,
							   Model model
							  ) throws Exception {
		
		log.info(">>> /medicine/medicineList");
	
	try {	
		
		
		
		
		List<MedicineVo> item = medicineService.medicineSelectList(medicineVo);
		model.addAttribute("medList", item);
		
		
	}catch (Exception e) {
		
		e.printStackTrace();
		
	}
		return "medicine/medicineList";
		
	}*/

	
		
		
		
	


	
	


}



















