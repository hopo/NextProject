package kr.or.nextit.patient.service;

import java.util.List;

import kr.or.nextit.comm.model.PatientVo;
import kr.or.nextit.comm.util.SearchVo;

public interface PatientService {

	// 환자등록
	public void patientInsert(PatientVo patientVo) throws Exception;

	// 환자 리스트
	public List<PatientVo> patientSelectList(SearchVo searchVo) throws Exception;

	// 환자 상세보기
	public PatientVo patientSelectView(PatientVo patientVo) throws Exception;

	// 환자 수정
	public void patientUpdate(PatientVo patientVo) throws Exception;

	// 환자 검색
	public int selectTotalCount(SearchVo SearchVo) throws Exception;

	

}
