package kr.or.nextit.notice.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.nextit.comm.model.NoticeVo;
import kr.or.nextit.comm.util.NoticeSearchVo;
import kr.or.nextit.comm.util.SearchVo;

public interface NoticeMapper {

	/**
	 * @param searchVo
	 * @return
	 * @throws Exception
	 */
	public List<NoticeVo> selectNoticeList(SearchVo searchVo) throws Exception;

	/**
	 * @param searchVo
	 * @return
	 * @throws Exception
	 */
	public int selectTotalCount(SearchVo searchVo) throws Exception;

	/**
	 * @param ntcIdx
	 * @throws Exception
	 */
	public void updateViewCount(String ntcIdx) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// 글작성
	public void insertNotice(Map<String, Object> hmap) throws Exception;

	// 상세보기
	public NoticeVo selectNoticeItem(HashMap<String, Object> param) throws Exception;
	
	// 수정페이지
	public  void updateNotice(NoticeVo param) throws Exception;
	
	// 삭제
	public void updateDelNotice(NoticeVo param) throws Exception;
	
	
}