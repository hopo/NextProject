package kr.or.nextit.medicine.service;

import java.util.List;

import kr.or.nextit.comm.model.MedicineVo;

public interface MedicineService {
	
	
	// 약품등록 폼 
	public void medicineCreate() throws Exception ;
	


	// 약품 리스트 조회 
	public List<MedicineVo> medicineSelectList(MedicineVo medicineVo) throws Exception ;

	
	
	
	
	
	
	
	
	
	
	
	
	
}