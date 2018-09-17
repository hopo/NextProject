package kr.or.nextit.patient.service.impl;

import java.util.List;

import kr.or.nextit.comm.model.PatientVo;
import kr.or.nextit.comm.util.PatientSearchVo;

public interface PatientMapper {

	/**
	 * @param patientVo
	 * @throws Exception
	 */
	public void patientInsert(PatientVo patientVo) throws Exception;

	/**
	 * @param patientSearchVo
	 * @return
	 * @throws Exception
	 */
	public List<PatientVo> patientSelectList(PatientSearchVo patientSearchVo) throws Exception;

	/**
	 * @param patientVo
	 * @return
	 * @throws Exception
	 */
	public PatientVo patientSelectView(PatientVo patientVo) throws Exception;

	/**
	 * @param patientVo
	 * @throws Exception
	 */
	public void patientUpdate(PatientVo patientVo) throws Exception;

	/**
	 * @param patientSearchVoVo
	 * @return
	 * @throws Exception
	 */
	public int selectTotalCount(PatientSearchVo patientSearchVoVo) throws Exception;
}
























