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
		@RequestMapping("/medicine/medicineCreate")
		public String medicineCreate() throws Exception {
			log.info(">>> /medicine/medicineCreate");
			
		  return "medicine/medicineCreate";
			
		}
		
		
	
		
	// 약품 리스트 조회 할수있어요 ..페이징은 할수있으나 어려우니 페이징은 나중나중에 할게요  ^^~~
	@RequestMapping("/medicine/medicineList")
	public String medicineSelectList(@ModelAttribute MedicineVo medicineVo,
							   Model model
							  ) throws Exception {
		
		log.info(">>> /medicine/medicineList");
	
		List<MedicineVo> item = medicineService.medicineSelectList(medicineVo);
		model.addAttribute("medList", item);
		
		return "medicine/medicineList";
		
	}

	
	
	
/*	
	// 약품등록 하기 .. 약품등록 후 결과까지입니당 ^^~~
	@RequestMapping("/prescription/prescriptionCreateProc")
	public String insertMedicine() {
		
		
		return "/prescription/prescriptionCreateProc";
		
	}
	*/
		
		
		
	


	
	


}



















