package kr.or.nextit.prescription.service.impl;

import kr.or.nextit.comm.model.PrescriptionVo;

public interface PrescriptionMapper {

	/**
	 * @param prescriptionVo
	 * @return
	 * @throws Exception
	 */
	public PrescriptionVo prescriptionSelect(PrescriptionVo prescriptionVo) throws Exception;

	/**
	 * @param prescriptionVo
	 * @return
	 * @throws Exception
	 */
	public PrescriptionVo selectClinicItem(PrescriptionVo prescriptionVo) throws Exception;

	/**
	 * @param prescriptionVo
	 * @throws Exception
	 */
	public void insertPrescription(PrescriptionVo prescriptionVo) throws Exception;

}
