package kr.or.nextit.notice.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.NoticeVo;
import kr.or.nextit.comm.util.NoticeSearchVo;
import kr.or.nextit.comm.util.SearchVo;
import kr.or.nextit.notice.service.NoticeService;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeVo> selectNoticeList(SearchVo searchVo) throws Exception {
		return noticeMapper.selectNoticeList(searchVo);
	}

	@Override
	public int selectTotalCount(SearchVo searchVo) throws Exception {
		return noticeMapper.selectTotalCount(searchVo);
	}
	
	@Override
	public void updateViewCount(String ntcIdx) throws Exception {
		noticeMapper.updateViewCount(ntcIdx);
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
	public void updateDelNotice(NoticeVo param) throws Exception {
		noticeMapper.updateDelNotice(param);
	}


	
}
