package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.EmployeeDao;
import com.spring.board.service.EmployeeService;
import com.spring.board.vo.DocFileBoardVo;
import com.spring.board.vo.EmployeeCodeVo;
import com.spring.board.vo.EmployeePageVo;
import com.spring.board.vo.EmployeeVo;
import com.spring.board.vo.IssuedNumberVo;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao edao;
	
	
	@Override
	public int insert(EmployeeVo evo) throws Exception {
		// TODO Auto-generated method stub
		return edao.insert(evo);
	}


	@Override
	public List<EmployeeVo> employeeList(EmployeePageVo employeePageVo) throws Exception {
		// TODO Auto-generated method stub
		return edao.employeeList(employeePageVo);
	}


	@Override
	public int selectEmployeeCnt() throws Exception {
		// TODO Auto-generated method stub
		return edao.selectEmployeeCnt();
	}


	@Override
	public EmployeeVo employeeSelectOne(EmployeeVo evo) throws Exception {
		// TODO Auto-generated method stub
		return edao.employeeSelectOne(evo);
	}


	@Override
	public int employeeUpdate(EmployeeVo evo) throws Exception {
		// TODO Auto-generated method stub
		return edao.employeeUpdate(evo);
	}


	@Override
	public int employeeDelete(EmployeeVo evo) throws Exception {
		// TODO Auto-generated method stub
		return edao.employeeDelete(evo);
	}


	@Override
	public List<EmployeeCodeVo> employeeSelectCode() throws Exception {
		// TODO Auto-generated method stub
		return edao.employeeSelectCode();
	}


	@Override
	public int employeeDocInsertIssuedNumber(IssuedNumberVo issuedNumberVo) throws Exception {
		// TODO Auto-generated method stub
		return edao.employeeDocInsertIssuedNumber(issuedNumberVo);
	}


	@Override
	public DocFileBoardVo getdocFileOne(EmployeeVo evo) throws Exception {
		// TODO Auto-generated method stub
		return edao.getdocFileOne(evo);
	}

}
