package kr.or.nextit.patient.service;

import java.util.List;

import kr.or.nextit.comm.model.PatientVo;
import kr.or.nextit.comm.util.SearchVo;

public interface PatientService {

	/**
	 * @param param
	 * @throws Exception
	 */
	public void insertPatient(PatientVo param) throws Exception;

	public List<PatientVo> patientSelectList(SearchVo searchVo) throws Exception;

	public PatientVo patientSelectView(PatientVo patientVo) throws Exception;

	public int selectTotalCount(SearchVo SearchVo) throws Exception;

	public void patientUpdate(PatientVo patientVo) throws Exception;
}
