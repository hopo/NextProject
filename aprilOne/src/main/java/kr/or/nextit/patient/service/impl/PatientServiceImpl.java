package kr.or.nextit.patient.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.PatientVo;
import kr.or.nextit.comm.util.SearchVo;
import kr.or.nextit.comm.util.SearchVo;
import kr.or.nextit.patient.service.PatientService;

@Service("PatientService")
public class PatientServiceImpl implements PatientService {

	@Autowired
	private PatientMapper patientMapper;

	@Override
	public void patientInsert(PatientVo patientVo) throws Exception {
		patientMapper.patientInsert(patientVo);
	}
	
	@Override
	public List<PatientVo> patientSelectList(SearchVo searchVo) throws Exception {
		return patientMapper.patientSelectList(searchVo);
	}

	@Override
	public PatientVo patientSelectView(PatientVo patientVo) throws Exception {
		return patientMapper.patientSelectView(patientVo);
	}

	@Override
	public int selectTotalCount(SearchVo SearchVo) throws Exception {
		return patientMapper.selectTotalCount(SearchVo);
	}

	@Override
	public void patientUpdate(PatientVo patientVo) throws Exception {
		patientMapper.patientUpdate(patientVo);
	}

}












