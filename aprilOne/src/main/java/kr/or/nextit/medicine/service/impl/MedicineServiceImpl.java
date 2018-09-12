package kr.or.nextit.medicine.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.medicine.service.MedicineService;

@Service("MedicineService")
public class MedicineServiceImpl implements MedicineService {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MedicineMapper medicineMapper;

	@Override
	public void medicineCreate() throws Exception {
		
		medicineMapper.medicineCreate();
		
		
	}


	

	

}
