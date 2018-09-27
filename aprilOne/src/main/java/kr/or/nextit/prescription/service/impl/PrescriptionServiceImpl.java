package kr.or.nextit.prescription.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.PrescriptionVo;
import kr.or.nextit.comm.util.SearchVo;
import kr.or.nextit.prescription.service.PrescriptionService;

@Service("PrescriptionService")
public class PrescriptionServiceImpl implements PrescriptionService {

	@Autowired
	private PrescriptionMapper prescriptionMapper;

	@Override
	public void insertPrescription(PrescriptionVo prescriptionVo) throws Exception {
		prescriptionMapper.insertPrescription(prescriptionVo);
	}

	@Override
	public List<PrescriptionVo> selectPrescriptionList(SearchVo searchVo) throws Exception {
		return prescriptionMapper.selectPrescriptionList(searchVo);
	}
	
	@Override
	public int selectTotalCount(SearchVo searchVo) throws Exception {
		return prescriptionMapper.selectTotalCount(searchVo);
	}

	@Override
	public PrescriptionVo selectPrescriptionView(PrescriptionVo prescriptionVo) throws Exception {
		return prescriptionMapper.selectPrescriptionView(prescriptionVo);
	}
	
	
	
	
	
	
	@Override
	public PrescriptionVo prescriptionSelect(PrescriptionVo prescriptionVo) throws Exception {
		prescriptionMapper.prescriptionSelect(prescriptionVo);
		return prescriptionVo;
	}

	@Override
	public PrescriptionVo selectClinicItem(PrescriptionVo prescriptionVo) throws Exception {
		return prescriptionMapper.selectClinicItem(prescriptionVo);
	}

	@Override
	public void updatePrescription(PrescriptionVo prescriptionVo) throws Exception {
		prescriptionMapper.updatePrescription(prescriptionVo);
	}

}
