package kr.or.nextit.employee.service;

import java.util.HashMap;
import java.util.List;

import kr.or.nextit.comm.model.EmployeeVo;

public interface EmployeeService {

	/**
	 * @return
	 * @throws Exception
	 */
	public List<EmployeeVo> selectEmployeeList() throws Exception;

	/**
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public EmployeeVo selectEmployeeItem(HashMap<String, Object> param) throws Exception;

	/**
	 * @param param
	 * @throws Exception
	 */
	public void insertEmployee(EmployeeVo param) throws Exception;

	/**
	 * @param param
	 * @throws Exception
	 */
	public void updateEmployee(EmployeeVo param) throws Exception;

	/**
	 * @param param
	 * @throws Exception
	 */
	public void updateRetireEmployee(EmployeeVo param) throws Exception;

}
