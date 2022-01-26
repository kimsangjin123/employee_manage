package com.spring.board.dao;

import com.spring.board.vo.UserVo;

public interface UserDao {

	int userInsert(UserVo userVo) throws Exception;

	int userIdChk(UserVo userVo)  throws Exception;

	UserVo userSelectOne(UserVo userVo) throws Exception;

	
}
