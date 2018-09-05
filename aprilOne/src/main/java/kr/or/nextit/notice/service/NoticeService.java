package kr.or.nextit.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.nextit.comm.model.NoticeVo;

public interface NoticeService {
	
	// 리스트
	public List<NoticeVo> selectNoticeList() throws Exception;
	
	// 글작성
	
	public void insertNitice(Map<String, Object> hmap) throws Exception;
	
	

}
