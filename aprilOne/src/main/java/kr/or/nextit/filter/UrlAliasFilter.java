package kr.or.nextit.filter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UrlAliasFilter implements Filter {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.info(">>> UrlAliasFilter.init() Call");
	}

	@Override
	public void doFilter(
				ServletRequest req,
				ServletResponse res,
				FilterChain chain
			) throws IOException, ServletException {
		//		log.info(">>> UrlAliasFilter.doFilter() Call");
		// ;별칭 맵을 상뇽하면 좋을 듯 하다고 생각
		// ; 세션에 loginInfo를 삭제 하면 어떻게 ???
		
		HttpServletRequest myreq = (HttpServletRequest)req;
		HashMap<String, String> urls = new HashMap<>();
		
		if(myreq.getSession().getAttribute("urls") == null) {
			// ! alias = url

//			urls.put("clinic_create", "/clinic/clinicCreate");
//			urls.put("clinic_createProc", "/clinic/clinicCreateProc");
//			urls.put("clinic_view", "/clinic/clinicView");
//			urls.put("clinic_list", "/clinic/clinicList");
//
//			urls.put("employee_list", "/employee/employeeList");
//			urls.put("employee_view", "/employee/employeeView");
//			urls.put("employee_create", "/employee/employeeCreate");
//			urls.put("employee_createProc", "/employee/employeeCreateProc");
//			urls.put("employee_edit", "/employee/employeeEdit");
//			urls.put("employee_editProc", "/employee/employeeEditProc");
//			urls.put("employee_retire", "/employee/employeeRetire");
//			urls.put("employee_retireProc", "/employee/employeeRetireProc");
//			urls.put("patient_list", "/patient/patientList");
//			urls.put("prescription_create", "/prescription/prescriptionCreate");

			// !! index
			urls.put("index", "/index");
			urls.put("wrong", "/wrong");
			
			// !! clinic
			urls.put("clinic_create","/clinic/clinicCreate");
			urls.put("clinic_createProc","/clinic/clinicCreateProc");
			urls.put("clinic_list","/clinic/clinicList");
			urls.put("clinic_view","/clinic/clinicView");

			// !! employee
			urls.put("employee_list","/employee/employeeList");
			urls.put("employee_view","/employee/employeeView");
			urls.put("employee_edit","/employee/employeeEdit");
			urls.put("employee_editProc","/employee/employeeEditProc");
			urls.put("employee_retire","/employee/employeeRetire");
			urls.put("employee_retireProc","/employee/employeeRetireProc");
			urls.put("employee_create","/employee/employeeCreate");
			urls.put("employee_createProc","/employee/employeeCreateProc");

			// !! medicine
			urls.put("medicine_createProc","/medicine/medicineCreateProc");
			urls.put("medicine_list","/medicine/medicineList");
			urls.put("medicine_create","/medicine/medicineCreate");

			// !! notice
			urls.put("notice_create","/notice/noticeCreate");
			urls.put("notice_createProc","/notice/noticeCreateProc");
			urls.put("notice_list","/notice/noticeList");
			urls.put("notice_view","/notice/noticeView");
			urls.put("notice_edit","/notice/noticeEdit");
			urls.put("notice_editProc","/notice/noticeEditProc");
			urls.put("notice_delete","/notice/noticeDelete");
			urls.put("notice_deleteProc","/notice/noticeDeleteProc");

			// !! patient
			urls.put("patient_create","/patient/patientCreate");
			urls.put("patient_createProc","/patient/patientCreateProc");
			urls.put("patient_list","/patient/patientList");
			urls.put("patient_view","/patient/patientView");
			urls.put("patient_edit","/patient/patientEdit");
			urls.put("patient_editProc","/patient/patientEditProc");

			// !! prescription
			urls.put("prescription_list","/prescription/prescriptionList");
			urls.put("prescription_view","/prescription/prescriptionView");
			urls.put("prescription_edit","/prescription/prescriptionEdit");
			urls.put("prescription_create","/prescription/prescriptionCreate");
			urls.put("prescription_createProc","/prescription/prescriptionCreateProc");

			// !! session
			urls.put("session_loginProc","/session/loginProc");
			urls.put("session_loginInfo","/session/loginInfo");
			urls.put("session_logout","/session/logout");
			urls.put("session_showDateInfoProc","/session/showDateInfoProc");
			urls.put("session_login","/session/login");
			
			myreq.getSession().setAttribute("urls", urls);
		}

		chain.doFilter(req, res);
	}

	@Override
	public void destroy() {
		log.info(">>> UrlAliasFilter.destroy() Call");
	}

}