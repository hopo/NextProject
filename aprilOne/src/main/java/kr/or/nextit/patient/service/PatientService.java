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

	/**
	 * @param searchVo
	 * @return
	 * @throws Exception
	 */
	public List<PatientVo> selectPatientList(SearchVo searchVo) throws Exception;

	/**
	 * @param patientVo
	 * @return
	 * @throws Exception
	 */
	public PatientVo selectPatientView(PatientVo patientVo) throws Exception;

	/**
	 * @param SearchVo
	 * @return
	 * @throws Exception
	 */
	public int selectTotalCount(SearchVo SearchVo) throws Exception;

	/**
	 * @param patientVo
	 * @throws Exception
	 */
	public void updatePatient(PatientVo patientVo) throws Exception;
}
