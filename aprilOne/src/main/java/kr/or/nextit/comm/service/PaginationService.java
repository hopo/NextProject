package kr.or.nextit.comm.service;

import kr.or.nextit.comm.util.SearchVo;

public interface PaginationService {

	/**
	 * @param searchVo
	 * @return
	 * @throws Exception
	 */
	public int selectTotalCount(SearchVo searchVo) throws Exception;

}
