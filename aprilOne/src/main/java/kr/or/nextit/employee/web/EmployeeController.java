package kr.or.nextit.employee.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "employee/employeeCreate")
	public String employeeCreate() {
		log.info(">>> employee/employeeCreate");

		return "employee/employeeCreate";

	}

	@RequestMapping(value = "employee/employeeList")
	public String employeeList() {
		log.info(">>> employee/employeeList");

		return "employee/employeeList";

	}

	@RequestMapping(value = "employee/employeeView")
	public String employeeView() {
		log.info(">>> employee/employeeView");

		return "employee/employeeView";

	}

}
