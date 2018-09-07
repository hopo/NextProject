package kr.or.nextit.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.nextit.comm.model.NoticeVo;

public interface NoticeService {

	// 리스트
	public List<NoticeVo> selectNoticeList() throws Exception;

	// 글작성

	public void insertNitice(Map<String, Object> hmap) throws Exception;

	// 상세보기 
	public HashMap<String, Object> noticeView(Map<String, Object> hmap) throws Exception;
	
	// 수정
	public void noticeUpdate(Map<String, Object> hmap) throws Exception;
	
}
