package kr.or.nextit.patient.service.impl;

import java.util.List;

import kr.or.nextit.comm.model.PatientVo;

public interface PatientMapper {
	
	// 환자등록 	
	public void patientInsert(PatientVo patientVo) throws Exception;
		
	// 환자 리스트 	
	public List<PatientVo> patientSelectList(PatientVo patientVo) throws Exception;
	
	// 환자 상세보기 	
	public PatientVo patientSelectView(PatientVo patientVo) throws Exception;
	
		

}
