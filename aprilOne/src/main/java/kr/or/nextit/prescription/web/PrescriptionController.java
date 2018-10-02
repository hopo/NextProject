package kr.or.nextit.prescription.web;

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

import kr.or.nextit.clinic.service.ClinicService;
import kr.or.nextit.comm.model.ClinicVo;
import kr.or.nextit.comm.model.MedicineVo;
import kr.or.nextit.comm.model.PrescriptionVo;
import kr.or.nextit.comm.service.impl.CommBuis;
import kr.or.nextit.comm.util.MessageVo;
import kr.or.nextit.comm.util.SearchVo;
import kr.or.nextit.medicine.service.MedicineService;
import kr.or.nextit.prescription.service.PrescriptionService;

@Controller
public class PrescriptionController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "PrescriptionService")
	private PrescriptionService prescriptionService;

	@Resource(name = "ClinicService")
	private ClinicService clinicService;

	@Resource(name = "MedicineService")
	private MedicineService medicineService;

	// !비즈니스 로직
	private CommBuis commBuis = CommBuis.getInstance();

	// !메시지Vo 공동 사용
	private MessageVo msgVo = null;
	

	// !!!처방 등록 화면
	// ;;;약품.진료 리스트 가져오기
	@RequestMapping(value = "/prescription/prescriptionCreate")
	public String prescriptionCreate(
				@RequestParam HashMap<String, Object> param,
				Model model
			) {
		log.info(">>> /prescription/prescriptionCreate");
		log.debug("param : {}", param);

		try {
			
			model.addAttribute("clnCode", param.get("clnCode"));
			model.addAttribute("patCode", param.get("patCode"));
			model.addAttribute("empId", param.get("empId"));

			// ;;진료정보를 조회하여 모델에 저장
			ClinicVo clinicVo = clinicService.selectClinicItem(null);
			log.debug("clinicVo : {}", clinicVo);

			model.addAttribute("clinicVo", clinicVo);

			// ;;약품목록을 조회하여 모델에 저장
			List<MedicineVo> medList = medicineService.selectMedicineList(null);
			log.debug("medList : {}", medList);

			model.addAttribute("medList", medList);

			return "prescription/prescriptionCreate";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// !!!처방 등록 프로세스
	@RequestMapping(value = "/prescription/prescriptionCreateProc")
	public String prescriptionCreateProc(
				PrescriptionVo prescriptionVo,
				Model model
			) {
		log.info(">>> /prescription/prescriptionCreateProc");
		log.debug(">>> prescriptionVo : {} ", prescriptionVo);

		try {

			prescriptionService.insertPrescription(prescriptionVo);
			model.addAttribute("prsInsert", prescriptionVo);

			return "redirect:/prescription/prescriptionList";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// !!!처방 리스트 화면
	@RequestMapping(value = "/prescription/prescriptionList")
	public String prescriptionList(
				@ModelAttribute PrescriptionVo prescriptionVo, 
				@ModelAttribute(name = "searchVo") SearchVo searchVo,
				Model model
			) {
		log.info(">>> /prescription/prescriptionList");
		log.debug(">>> searchVo : {}", searchVo);

		try {

			searchVo.setTotalCount(prescriptionService.selectTotalCount(searchVo));
			searchVo.setPageBlockSize(5);
			searchVo.setScreenSize(10);
			searchVo.pageSetting();

			commBuis.dispSearchVo(searchVo);

			List<PrescriptionVo> items = prescriptionService.selectPrescriptionList(searchVo);
			log.debug(">>> items : {}", items);

			model.addAttribute("prsList", items);

			return "prescription/prescriptionList";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// !!!처방 상세보기 화면
	@RequestMapping(value = "/prescription/prescriptionView")
	public String prescriptionView(
				@RequestParam String clnCode,
				HashMap<String, Object> param,
				PrescriptionVo prescriptionVo,
				Model model
			) {
		log.info(">>> /prescription/prescriptionView");
		log.debug("clnCode : {}", clnCode);
		log.debug("param : {}", param);
		log.debug("prescriptionVo : {}", prescriptionVo);

		try {

			// ;;진료정보를 조회하여 모델에 저장
			ClinicVo clinicVo = clinicService.selectClinicItem(param);
			model.addAttribute("clinicVo", clinicVo);

			prescriptionVo = prescriptionService.selectPrescriptionView(prescriptionVo);
			model.addAttribute("preView", prescriptionVo);

			return "prescription/prescriptionView";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// !!!처방 수정 화면
	@RequestMapping(value = "/prescription/prescriptionEdit")
	public String prescriptionEdit(
				PrescriptionVo prescriptionVo,
				Model model
			) {
		log.info(">>> /prescription/prescriptionEdit");
		log.debug("prescriptionVo : {}", prescriptionVo);

		try {

			prescriptionService.updatePrescription(prescriptionVo);
			model.addAttribute("prsUpdt", prescriptionVo);

			return "prescription/prescription";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

}
