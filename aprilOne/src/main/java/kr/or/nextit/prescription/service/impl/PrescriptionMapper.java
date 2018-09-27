package kr.or.nextit.prescription.service.impl;

import java.util.List;

import kr.or.nextit.comm.model.PrescriptionVo;
import kr.or.nextit.comm.util.SearchVo;

public interface PrescriptionMapper {

	/**
	 * @param prescriptionVo
	 * @throws Exception
	 */
	public void insertPrescription(PrescriptionVo prescriptionVo) throws Exception;
	
	/**
	 * @param searchVo
	 * @return
	 * @throws Exception
	 */
	public List<PrescriptionVo> selectPrescriptionList(SearchVo searchVo) throws Exception;
	
	/**
	 * @param searchVo
	 * @return
	 * @throws Exception
	 */
	public int selectTotalCount(SearchVo searchVo) throws Exception;
	
	/**
	 * @param prescriptionVo
	 * @return
	 * @throws Exception
	 */
	public PrescriptionVo selectPrescriptionView(PrescriptionVo prescriptionVo) throws Exception;
	
	
	
	
	
	public PrescriptionVo prescriptionSelect(PrescriptionVo prescriptionVo) throws Exception;
	
	public int updatePrescription(PrescriptionVo prescriptionVo) throws Exception;

	public PrescriptionVo selectClinicItem(PrescriptionVo prescriptionVo) throws Exception;

}
























