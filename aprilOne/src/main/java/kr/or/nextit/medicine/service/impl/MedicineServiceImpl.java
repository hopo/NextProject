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

	@Autowired
	MedicineMapper medicineMapper;

	@Override
	public List<MedicineVo> selectMedicineList(MedicineVo medicineVo) throws Exception {
		 return medicineMapper.selectMedicineList(medicineVo);
	}

	@Override
	public void insertMedicine(MedicineVo medicineVo) throws Exception {
		medicineMapper.insertMedicine(medicineVo);
	}
}











