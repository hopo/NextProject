package kr.or.nextit.prescription.service;

import java.util.List;

import kr.or.nextit.comm.model.PatientSearchVo;
import kr.or.nextit.comm.model.PatientVo;
import kr.or.nextit.comm.model.PrescriptionVo;

public interface PrescriptionService {
	
	// 처방폼 화면  
	public PrescriptionVo prescriptionSelect (PrescriptionVo prescriptionVo)throws Exception;
	
	
	// 처방 등록  
	public PrescriptionVo selectClinicItem (PrescriptionVo prescriptionVo)throws Exception;
	


}
