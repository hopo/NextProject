package kr.or.nextit.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.nextit.comm.model.NoticeVo;

public interface NoticeService {

	// 리스트
	public List<NoticeVo> selectNoticeList() throws Exception;

	// 글작성

	public void insertNotice(Map<String, Object> hmap) throws Exception;

	// 상세보기 
	public NoticeVo noticeView(Map<String, Object> hmap) throws Exception;
	
	// 수정페이지
	public  void noticeUpdateForm(Map<String, Object> hmap) throws Exception;
	
	//수정 처리
	public  void noticeUpdate(Map<String, Object> hmap) throws Exception;
	
}
