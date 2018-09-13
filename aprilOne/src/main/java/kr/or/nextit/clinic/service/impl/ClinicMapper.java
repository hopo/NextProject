package kr.or.nextit.clinic.service.impl;

import java.util.HashMap;
import java.util.List;

import kr.or.nextit.comm.model.ClinicVo;
import kr.or.nextit.comm.util.SearchVo;

public interface ClinicMapper {

	/**
	 * @param searchVo
	 * @return
	 * @throws Exception
	 */
	public List<ClinicVo> selectClinicList(SearchVo searchVo) throws Exception;

	/**
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public ClinicVo selectClinicItem(HashMap<String, Object> param) throws Exception;

//	public int selectTotalCount(SearchVo searchVo) throws Exception;

	/**
	 * @param param
	 * @throws Exception
	 */
	public void insertClinic(HashMap<String, Object> param) throws Exception;
}
