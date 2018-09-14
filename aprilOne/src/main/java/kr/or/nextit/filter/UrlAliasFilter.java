package kr.or.nextit.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/*
@WebFilter(urlPatterns = "/*")
public class UrlAliasFilter implements Filter {

	private ComService comService = null;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println(">>> ComFilter.init() Call");
		comService = new ComServiceImpl();

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println(">>> ComFilter.doFilter() Call");

		List<CodeVo> item = comService.selectCodeSex();

		for (CodeVo codeVo : item) {
			System.out.println(codeVo.getCodeParents());
			System.out.println(codeVo.getCodeId());
			System.out.println(codeVo.getCodeDescription());
		}
		
		request.setAttribute("codeSex", item);

		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {

		System.out.println(">>> ComFilter.destroy() Call");
		comService = null;
	}

}
*/