package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.EmployeeDao;
import com.spring.board.vo.EmployeeCodeVo;
import com.spring.board.vo.EmployeePageVo;
import com.spring.board.vo.EmployeeVo;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	private SqlSession sqlSession;
	@Override
	public int insert(EmployeeVo evo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("employee.insert",evo);
	}
	@Override
	public List<EmployeeVo> employeeList(EmployeePageVo employeePageVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("employee.employeeList", employeePageVo);
	}
	@Override
	public int selectEmployeeCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employee.selectEmployeeCnt");
	}
	@Override
	public EmployeeVo employeeSelectOne(EmployeeVo evo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employee.employeeSelectOne", evo);
	}
	@Override
	public int employeeUpdate(EmployeeVo evo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("employee.employeeUpdate", evo);
	}
	@Override
	public int employeeDelete(EmployeeVo evo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("employee.employeeDelete",evo);
	}
	@Override
	public List<EmployeeCodeVo> employeeSelectCode() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("employee.employeeSelectCode");
	}

}
