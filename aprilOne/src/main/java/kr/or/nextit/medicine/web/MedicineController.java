package kr.or.nextit.medicine.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nextit.comm.model.MedicineVo;
import kr.or.nextit.comm.service.impl.CommBuis;
import kr.or.nextit.comm.util.MessageVo;
import kr.or.nextit.medicine.service.MedicineService;

@Controller
public class MedicineController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "MedicineService")
	private MedicineService medicineService;

	// !비즈니스 로직
	private CommBuis commBuis = CommBuis.getInstance();

	// !메시지Vo 공동 사용
	private MessageVo msgVo = null;
	
	@RequestMapping(value = "/medicine/medicineCreate")
	public String medicineCreate() {
		log.info(">>> /medicine/medicineCreate");

		return "medicine/medicineCreate";
	}

	@RequestMapping(value = "/medicine/medicineCreateProc")
	public String medicineCreateProc(MedicineVo medicineVo) {

		try {

			medicineService.insertMedicine(medicineVo);

			return "redirect:/medicine/medicineList";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	@RequestMapping("/medicine/medicineList")
	public String medicineSelectList(
				@ModelAttribute MedicineVo medicineVo,
				Model model
			) {
		log.info(">>> /medicine/medicineList");

		try {

			List<MedicineVo> item = medicineService.selectMedicineList(medicineVo);
			model.addAttribute("medList", item);

			return "medicine/medicineList";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";

	}

}
