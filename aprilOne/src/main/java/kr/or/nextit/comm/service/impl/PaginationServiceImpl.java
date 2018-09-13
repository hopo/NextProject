package kr.or.nextit.comm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.service.PaginationService;
import kr.or.nextit.comm.util.SearchVo;

@Service("PaginationService")
public class PaginationServiceImpl implements PaginationService {

	@Autowired
	public PaginationMapper paginationMapper;

	@Override
	public int selectTotalCount(SearchVo searchVo) throws Exception {
		return paginationMapper.selectTotalCount(searchVo);
	}

}