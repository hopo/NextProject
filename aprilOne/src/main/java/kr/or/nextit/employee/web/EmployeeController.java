package kr.or.nextit.employee.web;

import java.util.HashMap;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.employee.service.EmployeeService;

@Controller
public class EmployeeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "EmployeeService")
	private EmployeeService employeeService;

	// !!!직원리스트 화면
	@RequestMapping(value = "/employee/employeeList")
	public String employeeList() {
		log.debug(">>> /employee/employeeList");

		return "employee/employeeList";
	}

	// !!!직원 등록하기 화면
	@RequestMapping(value = "/employee/employeeCreate")
	public String employeeCreate() {
		log.debug(">>> /employee/employeeCreate");

		return "employee/employeeCreate";
	}

	// !!!직원 등록 프로세서
	@RequestMapping(value = "/employee/employeeCreateProc")
	public String employeeCreateProc(
				@ModelAttribute EmployeeVo param,
				HashMap<String, Object> hmap
			) {
		log.debug(">>> /employee/employeeCreateProc");

		log.debug(">>> param : {}", param);
		
		try {
			employeeService.insertEmployee(param);
			
			hmap.put("param", param);

			return "employee/employeeCreateProc";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/employee/employeeCreate";

	}

}
