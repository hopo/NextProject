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
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		log.info(">>> UrlAliasFilter.doFilter() Call");
		// ;별칭 맵을 상뇽하면 좋을 듯 하다고 생각
		// ; 세션에 loginInfo를 삭제 하면 어떻게 ???
		
		HttpServletRequest myreq = (HttpServletRequest)req;
		HashMap<String, String> urls = new HashMap<>();
		
		if(myreq.getSession().getAttribute("urls") == null) {
			// ! alias = url
			urls.put("index", "/index");
			urls.put("employee_list", "/employee/employeeList");
			urls.put("employee_view", "/employee/employeeView");
			urls.put("employee_create", "/employee/employeeCreate");
			urls.put("employee_createproc", "/employee/employeeCreateProc");
			urls.put("employee_edit", "/employee/employeeEdit");
			urls.put("employee_editproc", "/employee/employeeEditProc");
			urls.put("employee_retire", "/employee/employeeRetire");
			urls.put("employee_retireproc", "/employee/employeeRetireProc");

			myreq.getSession().setAttribute("urls", urls);
		} else {
			log.debug(">>> urlAliasMap : {}", myreq.getSession().getAttribute("urls"));
		}

		chain.doFilter(req, res);
	}

	@Override
	public void destroy() {
		log.info(">>> UrlAliasFilter.destroy() Call");
	}

}