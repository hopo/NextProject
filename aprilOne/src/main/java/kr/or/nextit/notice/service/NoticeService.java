package kr.or.nextit.notice.service;

import java.util.List;

import kr.or.nextit.comm.model.NoticeVo;

public interface NoticeService {
	
	public List<NoticeVo> selectNoticeList() throws Exception;
	
	

}
