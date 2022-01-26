package com.spring.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.UserDao;
import com.spring.board.service.UserService;
import com.spring.board.vo.UserVo;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao userDao;
	
	@Override
	public int userInsert(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userInsert(userVo);
	}

	@Override
	public int userIdChk(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userIdChk(userVo);
	}

	@Override
	public UserVo userSelectOne(UserVo userVo) throws Exception {
		
	
		
		return userDao.userSelectOne(userVo);

	}


}
