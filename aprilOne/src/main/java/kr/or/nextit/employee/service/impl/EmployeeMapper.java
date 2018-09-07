package kr.or.nextit.employee.service.impl;

import kr.or.nextit.comm.model.EmployeeVo;

public interface EmployeeMapper {

	/**
	 * @param employeevo
	 * @throws Exception
	 */
	public void insertEmployee(EmployeeVo employeevo) throws Exception;
}
