package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.EmployeeCodeVo;
import com.spring.board.vo.EmployeePageVo;
import com.spring.board.vo.EmployeeVo;

public interface EmployeeDao {

	int insert(EmployeeVo evo) throws Exception;

	List<EmployeeVo> employeeList(EmployeePageVo employeePageVo) throws Exception;

	int selectEmployeeCnt() throws Exception;

	EmployeeVo employeeSelectOne(EmployeeVo evo) throws Exception;

	int employeeUpdate(EmployeeVo evo) throws Exception;

	int employeeDelete(EmployeeVo evo) throws Exception;

	List<EmployeeCodeVo> employeeSelectCode() throws Exception;

}
