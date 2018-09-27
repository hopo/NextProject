package kr.or.nextit.medicine.service.impl;

import java.util.List;
import kr.or.nextit.comm.model.MedicineVo;

public interface MedicineMapper {

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













