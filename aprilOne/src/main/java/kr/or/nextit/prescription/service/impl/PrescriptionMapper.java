package kr.or.nextit.prescription.service.impl;

import kr.or.nextit.comm.model.PrescriptionVo;

public interface PrescriptionMapper {
	
	// 처방 폼 화면 
	public PrescriptionVo prescriptionSelect(PrescriptionVo prescriptionVo) throws Exception;
		
	// 처방 조회   
	public PrescriptionVo prescriptionViewSelect (PrescriptionVo prescriptionVo)throws Exception;
	
	
	

}
