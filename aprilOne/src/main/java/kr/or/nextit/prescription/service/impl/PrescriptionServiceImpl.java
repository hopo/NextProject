package kr.or.nextit.prescription.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.PrescriptionVo;
import kr.or.nextit.prescription.service.PrescriptionService;

@Service("PrescriptionService")
public class PrescriptionServiceImpl implements PrescriptionService {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PrescriptionMapper prescriptionMapper;

	// 처방 폼 화면
	@Override
	public PrescriptionVo prescriptionSelect(PrescriptionVo prescriptionVo) throws Exception {

		prescriptionMapper.prescriptionSelect(prescriptionVo);

		return prescriptionVo;
	}

	// 진료테이블에서 정보가져오기
	@Override
	public PrescriptionVo selectClinicItem(PrescriptionVo prescriptionVo) throws Exception {

		return prescriptionMapper.selectClinicItem(prescriptionVo);

	}

	// 처방 등록
	@Override
	public void insertPrescription(PrescriptionVo prescriptionVo) throws Exception {

		prescriptionMapper.insertPrescription(prescriptionVo);

	}

	
	// 처방 리스트 
	@Override
	public List<PrescriptionVo> selectPrescriptionList(PrescriptionVo prescriptionVo) throws Exception {
		
		return null;  
				
	}
	
	

	

}















