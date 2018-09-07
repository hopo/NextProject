package kr.or.nextit.employee.web;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.employee.service.EmployeeService;

@Controller
public class EmployeeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	EmployeeService employeeService; 

	// 직원등록폼  
	@RequestMapping(value = "/employee/employeeCreate")
	public String employeeCreate() {
		log.info(">>> employee/employeeCreate");
		
		return "employee/employeeCreate";
	}
	
	
	
	// 직원등록 결과 
	@RequestMapping(value = "/employee/employeeCreateProc")
	public String employeeCreateProc(EmployeeVo employeeVo, HashMap<String, Object> hmap) throws Exception {
		log.info(">>> employee/employeeCreateProc");
		
		employeeService.employeeInsert(employeeVo);
	
		
		// 정상적 등록시 로그인 화면으로 이동 
		return "employee/employeeCreateProc";

	}
	
	
	
	
	
	
	/*
	// 직원목록 
		@RequestMapping(value = "/employee/employeeList")
		public String employeeList() {
			log.info(">>> employee/employeeCreate");
			
			return "employee/employeeList";

		}
	
		
		
		*/
		
		
		
	

	@RequestMapping(value = "employee/employeeView")
	public String employeeView() {
		log.info(">>> employee/employeeView");

		return "employee/employeeView";

	}

}
