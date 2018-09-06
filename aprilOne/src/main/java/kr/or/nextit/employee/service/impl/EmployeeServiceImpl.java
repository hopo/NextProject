package kr.or.nextit.employee.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.employee.service.EmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private EmployeeMapper employeeMapper;



	@Override
	public void employeeInsert(EmployeeVo employeeVo) throws Exception {

		  employeeMapper.employeeInsert(employeeVo);
		
	}

	
	
	
	
	
}
