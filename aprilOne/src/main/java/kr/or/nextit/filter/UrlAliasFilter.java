package kr.or.nextit.filter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class UrlAliasFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.err.println(">>> UrlAliasFilter.init() Call");

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.err.println(">>> UrlAliasFilter.doFilter() Call");
		
		HashMap<String, String> urls = new HashMap<>();
		
		// ;별칭 맵을 상뇽하면 좋을 듯 하다고 생각
		// ;필터 방식 말고 시작 할 때 한번만 하는 방법도 있을까?
		
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
		
		req.setAttribute("urls", urls);

		chain.doFilter(req, res);
	}

	@Override
	public void destroy() {
		System.err.println(">>> UrlAliasFilter.destroy() Call");
	}

}