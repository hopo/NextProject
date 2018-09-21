package kr.or.nextit.medicine.service.impl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.MedicineVo;
import kr.or.nextit.medicine.service.MedicineService;

@Service("MedicineService")
public class MedicineServiceImpl implements MedicineService {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MedicineMapper medicineMapper;
	

	// 약품등록 폼 화면
	@Override
	public void medicineCreate() throws Exception {
		
		medicineMapper.medicineCreate();
	}

	// 약품등록 
	@Override
	public void medicineInsert(MedicineVo medicineVo) throws Exception {
		
		medicineMapper.medicineInsert(medicineVo);
		
	}
	
	
	// 약품 리스트
	@Override
	public List<MedicineVo> medicineSelectList(MedicineVo medicineVo) throws Exception {
		
		 return medicineMapper.medicineSelectList(medicineVo);
	}



	


	

}











