package kr.or.nextit.employee.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.employee.service.EmployeeService;

@Controller
public class EmployeeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	EmployeeService employeeService; 

	// 직원등록 
	@RequestMapping(value = "/employee/employeeCreate")
	public String employeeCreate() {
		log.info(">>> employee/employeeCreate");
		
		return "employee/employeeCreate";

	}
	
	
	
	// 직원리스트 
	@RequestMapping(value = "/employee/employeeCreateResult")
	public String employeeList(EmployeeVo employeeVo, Model model) throws Exception {
		log.info(">>> employee/employeeList");
		
		employeeService.employeeInsert(employeeVo);
		
		model.addAttribute("insertResult", "등록완료");
		

		return "redirect:/employee/employeeCreateResult";

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
