package com.spring.board.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.UserDao;
import com.spring.board.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int userInsert(UserVo userVo) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.insert("user.userInsert",userVo);
	}

	@Override
	public int userIdChk(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userIdChk", userVo);
	}

	@Override
	public UserVo userSelectOne(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userSelectOne", userVo);
	}

	
	
}
