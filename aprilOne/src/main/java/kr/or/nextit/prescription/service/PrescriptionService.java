package kr.or.nextit.prescription.service;

import kr.or.nextit.comm.model.PrescriptionVo;

public interface PrescriptionService {
	
	// 처방폼 화면  
	public PrescriptionVo prescriptionSelect (PrescriptionVo prescriptionVo)throws Exception;
	
	// 진료테이블에서 정보가져오기 
	public PrescriptionVo selectClinicItem (PrescriptionVo prescriptionVo)throws Exception;
	
	// 처방 등록 
	public void insertPrescription(PrescriptionVo prescriptionVo) throws Exception;

	// 처방폼 화면
	public PrescriptionVo prescriptionSelect(PrescriptionVo prescriptionVo) throws Exception;

	// 처방 등록
	public PrescriptionVo selectClinicItem(PrescriptionVo prescriptionVo) throws Exception;

}
