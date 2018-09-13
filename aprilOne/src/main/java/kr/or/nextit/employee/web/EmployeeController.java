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
import kr.or.nextit.comm.util.SearchVo;
import kr.or.nextit.employee.service.EmployeeService;

@Controller
public class EmployeeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "EmployeeService")
	private EmployeeService employeeService;

	@Resource(name = "PaginationService")
	private PaginationService paginationService;

	// !!!직원리스트 화면
	@RequestMapping(value = "/employee/employeeList")
	public String employeeList(
				HashMap<String, Object> hmap,
				@ModelAttribute(name = "searchVo") SearchVo searchVo // ;name='*' 과 jsp 쪽 form commandName='*' 같음
			) {
		log.info(">>> /employee/employeeList");
		log.debug(">>> searchVo : {}", searchVo);

		List<EmployeeVo> result = null;

		try {

			searchVo.setSearchTable("tb_employee"); 	// ;검색테이블 설정
			searchVo.setTotalCount(paginationService.selectTotalCount(searchVo)); // ;검색 레코드 전체 수
			searchVo.setPageBlockSize(5); 			// ;페이지 5개씩
			searchVo.setScreenSize(10);				// ;로우 10개씩 
			searchVo.pageSetting(); // ;토대로 세팅하라
			
			log.debug(">>> ========= searchVo =====================");
			log.debug(">>> SearchTable : {}", searchVo.getSearchTable());
			log.debug(">>> SearchType : {}", searchVo.getSearchType());
			log.debug(">>> SearchText : {}", searchVo.getSearchText());
			log.debug(">>> TotalCount : {}", searchVo.getTotalCount());
			log.debug(">>> ScreenSize : {}", searchVo.getScreenSize());
			log.debug(">>> TotalPageCount : {}", searchVo.getTotalPageCount());
			log.debug(">>> CurPage : {}", searchVo.getCurPage());
			log.debug(">>> EndPage : {}", searchVo.getEndPage());
			log.debug(">>> StartRow : {}", searchVo.getStartRow());
			log.debug(">>> EndRow : {}", searchVo.getEndRow());
			log.debug(">>> =========================================");

			result = employeeService.selectEmployeeList(searchVo);
			log.debug(">>> result : {}", result);
			
			hmap.put("result", result);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "employee/employeeList";
	}

	// !!!직원 상세보기 화면
	@RequestMapping(value = "/employee/employeeView")
	public String employeeView(
				HashMap<String, Object> hmap,
				@RequestParam HashMap<String, Object> param
			) {
		log.info(">>> /employee/employeeView");
		log.debug(">>> param : {}", param);
		
		EmployeeVo item = null;
		try {
			item = employeeService.selectEmployeeItem(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		log.debug(">>> item : {}", item);
		hmap.put("item", item);
		
		return "employee/employeeView";
	}

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
			employeeService.insertEmployee(param);
			
			hmap.put("param", param);

			return "employee/employeeCreateProc";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";
	}

	// !!!직원 수정 화면
	@RequestMapping(value = "/employee/employeeEdit")
	public String employeeEdit(
				HashMap<String, Object> hmap,
				@RequestParam HashMap<String, Object> param
			) {
		log.info(">>> /employee/employeeEdit");
		log.debug(">>> param : {}", param);
		
		EmployeeVo item = null;

		try {
			item = employeeService.selectEmployeeItem(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		log.debug(">>> item : {}", item);
		hmap.put("item", item);
		
		return "employee/employeeEdit";
	}

	// !!!직원 수정 프로세서
	@RequestMapping(value = "/employee/employeeEditProc")
	public String employeeEditProc(
				@ModelAttribute EmployeeVo param
			) {
		log.info(">>> /employee/employeeEditProc");
		log.debug(">>> param : {}", param);
		
		try {
			employeeService.updateEmployee(param);
			String resultViewUrl = String.format("redirect:/employee/employeeView?empId=%s", param.getEmpId());
			
			return resultViewUrl;
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

	// !!!직원 퇴사(수정) 프로세서
	@RequestMapping(value = "/employee/employeeRetireProc")
	public String employeeRetireProc(
				@ModelAttribute EmployeeVo param
			) {
		log.info(">>> /employee/employeeRetireProc");
		log.debug(">>> param : {}", param);
		
		try {
			employeeService.updateRetireEmployee(param);
			
			return "redirect:/employee/employeeList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wrong";
	}

}
