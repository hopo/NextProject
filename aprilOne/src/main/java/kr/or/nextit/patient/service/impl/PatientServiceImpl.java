package kr.or.nextit.patient.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.PatientVo;
import kr.or.nextit.patient.service.PatientService;

@Service("patientService")
public class PatientServiceImpl implements PatientService {

	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PatientMapper patientMapper;

	
	
	// 환자 등록 
	@Override
	public void patientInsert(PatientVo patientVo) throws Exception {
		
		patientMapper.patientInsert(patientVo);
	}


	// 환자 리스트 
	@Override
	public List<PatientVo> patientSelectList(PatientVo patientVo) throws Exception {
		
		return patientMapper.patientSelectList(patientVo);
		
	}


	// 환자 상세보기 
	@Override
	public PatientVo patientSelectView(PatientVo patientVo) throws Exception {
		
		patientVo = patientMapper.patientSelectView(patientVo);
		
		return patientVo;
		
	}

	
	
	

	
	
	
}
