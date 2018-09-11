package kr.or.nextit.clinic.service;

import java.util.HashMap;
import java.util.List;

import kr.or.nextit.comm.model.ClinicVo;

public interface ClinicService {

	/**
	 * @return
	 * @throws Exception
	 */
	public List<ClinicVo> selectClinicList() throws Exception;

	/**
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public ClinicVo selectClinicItem(HashMap<String, Object> param) throws Exception;

	/**
	 * @param param
	 * @throws Exception
	 */
	public void insertClinic(HashMap<String, Object> param) throws Exception;

}
