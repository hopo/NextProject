package kr.or.nextit.medicine.service.impl;

import java.util.List;
import kr.or.nextit.comm.model.MedicineVo;

public interface MedicineMapper {
	

	// 약품등록 폼 
	public void medicineCreate() throws Exception ;
	
	// 약품 등록 
	public void medicineInsert(MedicineVo medicineVo) throws Exception;
	
	
	// 약품 리스트 조회 
	public List<MedicineVo> medicineSelectList(MedicineVo medicineVo) throws Exception;
	
	

















	}













