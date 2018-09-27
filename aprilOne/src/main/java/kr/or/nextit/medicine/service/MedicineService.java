package kr.or.nextit.medicine.service;

import java.util.List;

import kr.or.nextit.comm.model.MedicineVo;

public interface MedicineService {

	/**
	 * @param medicineVo
	 * @throws Exception
	 */
	public void insertMedicine(MedicineVo medicineVo) throws Exception;

	/**
	 * @param medicineVo
	 * @return
	 * @throws Exception
	 */
	public List<MedicineVo> selectMedicineList(MedicineVo medicineVo) throws Exception ;
	
}
