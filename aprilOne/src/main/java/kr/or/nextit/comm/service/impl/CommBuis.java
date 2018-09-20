package kr.or.nextit.comm.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.nextit.comm.util.SearchVo;

public class CommBuis {

	// !singletone
	private CommBuis() {}
	private static CommBuis instance = new CommBuis();
	public static CommBuis getInstance() {
		return instance;
	}	
	
	private final Logger log = LoggerFactory.getLogger(this.getClass());

	public void dispSearchVo(SearchVo searchVo) {
		log.debug(">>> ========= searchVo =====================");
		log.debug(">>> SearchTable : {}", searchVo.getSearchTable());
		log.debug(">>> SearchType : {}", searchVo.getSearchType());
		log.debug(">>> SearchText : {}", searchVo.getSearchText());
		log.debug(">>> TotalCount : {}", searchVo.getTotalCount());
		log.debug(">>> ScreenSize : {}", searchVo.getScreenSize());
		log.debug(">>> TotalPageCount : {}", searchVo.getTotalPageCount());
		log.debug(">>> CurPage : {}", searchVo.getCurPage());
		log.debug(">>> EndPage : {}", searchVo.getEndPage());
		log.debug(">>> StartRow : {}", searchVo.getStartRow());
		log.debug(">>> EndRow : {}", searchVo.getEndRow());
		log.debug(">>> =========================================");
	}
}
