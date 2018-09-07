package kr.or.nextit.employee.service;

import kr.or.nextit.comm.model.EmployeeVo;

public interface EmployeeService {

	/**
	 * @param employeeVo
	 * @throws Exception
	 */
	public void insertEmployee(EmployeeVo param) throws Exception;
}
