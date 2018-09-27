package kr.or.nextit.employee.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.comm.service.PaginationService;
import kr.or.nextit.comm.service.impl.CommBuis;
import kr.or.nextit.comm.util.MessageVo;
import kr.or.nextit.comm.util.SearchVo;
import kr.or.nextit.employee.service.EmployeeService;

@Controller
public class EmployeeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "EmployeeService")
	private EmployeeService employeeService;

	// @Resource(name = "PaginationService")
	// private PaginationService paginationService;

	// !비즈니스 로직
	private CommBuis commBuis = CommBuis.getInstance();

	// !메시지Vo 공동 사용
	private MessageVo msgVo = null;


	// !!!직원 등록 화면
	@RequestMapping(value = "/employee/employeeCreate")
	public String employeeCreate() {
		log.info(">>> /employee/employeeCreate");

		return "employee/employeeCreate";
	}

	// !!!직원 등록 프로세서
	@RequestMapping(value = "/employee/employeeCreateProc")
	public String employeeCreateProc(
				@ModelAttribute EmployeeVo param,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /employee/employeeCreateProc");
		log.debug(">>> param : {}", param);
		
		try {

			employeeService.insertEmployee(param); // ;DB에 새로운 계정을 인서트 한다

			msgVo = new MessageVo();

			msgVo.setMsgTag("info");
			msgVo.setMsgValue(String.format("%s님 계정이 생성되었습니다.", param.getEmpId()));

			hmap.put("msgTag", msgVo.getMsgTag());
			hmap.put("msgValue", msgVo.getMsgValue());

			return "redirect:/session/login";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";
	}

	// !!!직원 리스트 화면
	@RequestMapping(value = "/employee/employeeList")
	public String employeeList(
				@RequestParam HashMap<String, Object> param,
				@ModelAttribute(name = "searchVo") SearchVo searchVo, // ;name='*' 과 jsp 쪽 form commandName='*' 같음
				HashMap<String, Object> hmap
			) {
		log.info(">>> /employee/employeeList");
		log.debug(">>> param : {}", param);
		log.debug(">>> searchVo : {}", searchVo);

		try {

			//searchVo.setSearchTable("tb_employee"); 	// ;(PaginationService)검색테이블 설정
			searchVo.setTotalCount(employeeService.selectTotalCount(searchVo)); // ;검색 레코드 전체 수
			searchVo.setPageBlockSize(5); 			// ;페이지 5개씩
			searchVo.setScreenSize(10);				// ;로우 10개씩 
			searchVo.pageSetting(); // ;토대로 세팅하라
			
			commBuis.dispSearchVo(searchVo);

			List<EmployeeVo> result = employeeService.selectEmployeeList(searchVo);
			log.debug(">>> result : {}", result);
			
			hmap.put("result", result);
			
			msgVo = new MessageVo();

			hmap.put("msgVo", msgVo); // ;왜 Vo가 안넘어 가는가, 아마도 마샬링?
			hmap.put("msgTag", param.get("msgTag"));
			hmap.put("msgValue", param.get("msgValue"));

			return "employee/employeeList";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";
	}

	// !!!직원 상세보기 화면
	@RequestMapping(value = "/employee/employeeView")
	public String employeeView(
				@RequestParam HashMap<String, Object> param,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /employee/employeeView");
		log.debug(">>> param : {}", param);

		try {

			EmployeeVo item = employeeService.selectEmployeeItem(param);
			log.debug(">>> item : {}", item);
			
			hmap.put("item", item);

			hmap.put("msgTag", msgVo.getMsgTag());
			hmap.put("msgValue", msgVo.getMsgValue());

			return "employee/employeeView";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";
	}

	// !!!직원 수정 화면
	@RequestMapping(value = "/employee/employeeEdit")
	public String employeeEdit(
				@RequestParam HashMap<String, Object> param,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /employee/employeeEdit");
		log.debug(">>> param : {}", param);
		
		try {

			EmployeeVo item = employeeService.selectEmployeeItem(param);
			log.debug(">>> item : {}", item);

			hmap.put("item", item);
			hmap.put("phone", item.getEmpPhone().split("-")); // ;;전화번호 쪼개기
			hmap.put("rrnum", item.getEmpRrnum().split("-")); // ;;주민번호 쪼개기

			return "employee/employeeEdit";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "wrong";
	}

	// !!!직원 수정 프로세서
	@RequestMapping(value = "/employee/employeeEditProc")
	public String employeeEditProc(
				@RequestParam HashMap<String, Object> param,
				@ModelAttribute EmployeeVo employeeVo,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /employee/employeeEditProc");
		log.debug(">>> employeeVo : {}", employeeVo);
		
		try {

			employeeService.updateEmployee(employeeVo); // 직원정보를 수정하였다

			msgVo = new MessageVo();

			msgVo.setMsgTag("info");
			msgVo.setMsgValue(String.format("%s님 계정이 수정되었습니다.", employeeVo.getEmpId()));

			hmap.put("msgTag", msgVo.getMsgTag());
			hmap.put("msgValue", msgVo.getMsgValue());

			hmap.put("empId", employeeVo.getEmpId());
			
			return "redirect:/employee/employeeView";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";
	}

	// !!!직원 퇴사(수정) 화면
	@RequestMapping(value = "/employee/employeeRetire")
	public String employeeRetire(
				@ModelAttribute EmployeeVo param
			) {
		log.info(">>> /employee/employeeRetire");
		log.debug(">>> param : {}", param);
		
		return "employee/employeeRetire";
	}

	// !!!직원 퇴사(수정) 프로세스
	@RequestMapping(value = "/employee/employeeRetireProc")
	public String employeeRetireProc(
				@ModelAttribute EmployeeVo employeeVo,
				HashMap<String, Object> hmap
			) {
		log.info(">>> /employee/employeeRetireProc");
		log.debug(">>> param : {}", employeeVo);
		
		try {

			employeeService.updateRetireEmployee(employeeVo);

			msgVo = new MessageVo();
			msgVo.setMsgTag("warning");
			msgVo.setMsgValue(String.format("%s님 계정이 삭제(퇴사) 되었습니다.", employeeVo.getEmpId()));

			hmap.put("msgTag", msgVo.getMsgTag());
			hmap.put("msgValue", msgVo.getMsgValue());
			
			return "redirect:/employee/employeeList";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";
	}

}
