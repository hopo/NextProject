package kr.or.nextit.prescription.service;

import java.util.List;

import kr.or.nextit.comm.model.PrescriptionVo;
import kr.or.nextit.comm.util.SearchVo;

public interface PrescriptionService {

	public void insertPrescription(PrescriptionVo prescriptionVo) throws Exception;

	public PrescriptionVo prescriptionSelect(PrescriptionVo prescriptionVo) throws Exception;

	public PrescriptionVo selectClinicItem(PrescriptionVo prescriptionVo) throws Exception;

	public List<PrescriptionVo> selectPrescriptionList(SearchVo searchVo) throws Exception;

	public PrescriptionVo selectOneView(PrescriptionVo prescriptionVo) throws Exception;

	public int selectTotalCount(SearchVo searchVo) throws Exception;

	public void updatePrescription(PrescriptionVo prescriptionVo) throws Exception;

}
