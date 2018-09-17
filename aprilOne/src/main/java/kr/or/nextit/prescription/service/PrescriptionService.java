package kr.or.nextit.prescription.service;

import kr.or.nextit.comm.model.PrescriptionVo;

public interface PrescriptionService {

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


















