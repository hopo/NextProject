package kr.or.nextit.prescription.service;

import java.util.List;

import kr.or.nextit.comm.model.PrescriptionVo;
import kr.or.nextit.comm.util.SearchVo;

public interface PrescriptionService {

	/** 조회 
	 * @param prescriptionVo
	 * @return
	 * @throws Exception
	 */
	public PrescriptionVo prescriptionSelect(PrescriptionVo prescriptionVo) throws Exception;

	/** 한개조회 
	 * @param prescriptionVo
	 * @return
	 * @throws Exception
	 */
	public PrescriptionVo selectClinicItem(PrescriptionVo prescriptionVo) throws Exception;

	/** 등록 
	 * @param prescriptionVo
	 * @throws Exception
	 */
	public void insertPrescription(PrescriptionVo prescriptionVo) throws Exception;

	
	
	// 리스트조회 
	public List<PrescriptionVo> selectPrescriptionList(SearchVo searchVo) throws Exception;
	
	// 검색 
	public int selectTotalCount(SearchVo searchVo) throws Exception;
	
	// 처방 수정 
	public void updatePrescription(PrescriptionVo prescriptionVo) throws Exception;
	
	
	
	
}


















