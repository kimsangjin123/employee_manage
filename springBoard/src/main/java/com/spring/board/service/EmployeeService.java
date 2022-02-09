package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.DocFileBoardVo;
import com.spring.board.vo.EmployeeCodeVo;
import com.spring.board.vo.EmployeePageVo;
import com.spring.board.vo.EmployeeVo;
import com.spring.board.vo.IssuedNumberVo;

public interface EmployeeService {

	int insert(EmployeeVo evo) throws Exception;

	List<EmployeeVo> employeeList(EmployeePageVo employeePageVo) throws Exception;

	int selectEmployeeCnt() throws Exception;

	EmployeeVo employeeSelectOne(EmployeeVo evo) throws Exception;

	int employeeUpdate(EmployeeVo evo) throws Exception;

	int employeeDelete(EmployeeVo evo) throws Exception;

	List<EmployeeCodeVo> employeeSelectCode() throws Exception;

	int employeeDocInsertIssuedNumber(IssuedNumberVo issuedNumberVo) throws Exception;

	DocFileBoardVo getdocFileOne(EmployeeVo evo) throws Exception;


}
