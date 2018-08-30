package kr.or.nextit.patient.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PatientController {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "patient/patientCreate")
	public String patientCreate() {
		log.info(">>> patient/patientCreate");

		return "patient/patientCreate";

	}

	@RequestMapping(value = "patient/patientList")
	public String patientList() {
		log.info(">>> patient/patientList");

		return "patient/patientList";

	}

	@RequestMapping(value = "patient/patientView")
	public String patientView() {
		log.info(">>> patient/patientView");

		return "patient/patientView";

	}

}
