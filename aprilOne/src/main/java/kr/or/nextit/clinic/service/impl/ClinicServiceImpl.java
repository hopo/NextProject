package kr.or.nextit.clinic.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.clinic.service.ClinicService;
import kr.or.nextit.comm.model.ClinicVo;
import kr.or.nextit.comm.util.SearchVo;

@Service("ClinicService")
public class ClinicServiceImpl implements ClinicService {

	@Autowired
	private ClinicMapper clinicMapper;

	@Override
	public List<ClinicVo> selectClinicList(SearchVo searchVo) throws Exception {
		return clinicMapper.selectClinicList(searchVo);
	}

	@Override
	public ClinicVo selectClinicItem(HashMap<String, Object> param) throws Exception {
		return clinicMapper.selectClinicItem(param);
	}

	@Override
	public int selectTotalCount(SearchVo searchVo) throws Exception {
		return clinicMapper.selectTotalCount(searchVo);
	}

	@Override
	public void insertClinic(HashMap<String, Object> param) throws Exception {
		clinicMapper.insertClinic(param);
	}

}
