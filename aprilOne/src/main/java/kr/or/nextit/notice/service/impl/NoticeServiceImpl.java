package kr.or.nextit.notice.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.NoticeVo;
import kr.or.nextit.notice.service.NoticeService;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private NoticeMapper noticeMapper;
	
	//리스트
	@Override
	public List<NoticeVo> selectNoticeList() throws Exception {
		List<NoticeVo> result = noticeMapper.selectNoticeList();
		return result;
	}
	
	// 등록
	@Override
	public void insertNotice(Map<String, Object> hmap) throws Exception {
		noticeMapper.insertNotice(hmap);
	}
	
	// 상세보기
	@Override
	public NoticeVo selectNoticeItem(HashMap<String, Object> param) throws Exception {

		return noticeMapper.selectNoticeItem(param);
	}
	// 수정
	@Override
	public void updateNotice(NoticeVo param) throws Exception {
		noticeMapper.updateNotice(param);
	}
	//삭제
	@Override
	public void deleteNotice(NoticeVo param) throws Exception {
		noticeMapper.deleteNotice(param);
	}

	
}
