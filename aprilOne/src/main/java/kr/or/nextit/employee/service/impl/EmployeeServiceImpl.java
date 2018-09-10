package kr.or.nextit.employee.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.comm.model.EmployeeVo;
import kr.or.nextit.employee.service.EmployeeService;

@Service("EmployeeService")
public class EmployeeServiceImpl implements EmployeeService {

	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private EmployeeMapper employeeMapper;

	@Override
	public List<EmployeeVo> selectEmployeeList() throws Exception {
		return employeeMapper.selectEmployeeList();
	}
	
	@Override
	public EmployeeVo selectEmployeeItem(HashMap<String, Object> param) throws Exception {
		return employeeMapper.selectEmployeeItem(param);
	}

	@Override
	public void insertEmployee(EmployeeVo param) throws Exception {
		employeeMapper.insertEmployee(param);
	}
	
	@Override
	public void updateEmployee(EmployeeVo param) throws Exception {
		employeeMapper.updateEmployee(param);
	}
	
	@Override
	public void updateRetireEmployee(EmployeeVo param) throws Exception {
		employeeMapper.updateRetireEmployee(param);
	}
}
