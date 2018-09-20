package kr.or.nextit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class TimerFilter implements Filter {

		@Override
		public void init(FilterConfig filterConfig) throws ServletException {
			// ; 메모리에 올라 올 때
			// ; 초기화 해야 할 자원이 있으면
			System.out.println("[TimerFilter] init() Call");
		}

		@Override
		public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
				throws IOException, ServletException {
			// ; 주의 : req 타입이 ServletRequest이므로 HttpServeletRequest로
			// ;형 변환해서 작업을 해야 할 때도 있다.
			HttpServletRequest myreq = (HttpServletRequest) req;

			// ; 전처리 부분
			long startTime = System.currentTimeMillis();
			System.out.printf("[TimerFilter] : %s --> 'TIME CHECK START'\n", myreq.getRequestURI());

			req.setAttribute("test", "testAttr"); // ;;;test

			// ; *** POINT
			chain.doFilter(req, res);
			

			// ; 후처리 부분
			long endTime = (System.currentTimeMillis() - startTime);
			System.out.printf("[TimerFilter] : %s --> '걸린시간' : %d ms\n", myreq.getRequestURI(), endTime);

		}

		@Override
		public void destroy() {
			// ; 메모리에서 내려갈 때
			// ; 대체적으로 init 설정한 자원을 정리해야 하는 경우
			System.out.println("[TimerFilter] destroy() Call");
		}

	}

