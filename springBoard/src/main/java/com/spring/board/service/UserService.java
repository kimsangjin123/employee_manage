package com.spring.board.service;

import com.spring.board.vo.UserVo;

public interface UserService {
	public int userInsert(UserVo userVo) throws Exception;

	public int userIdChk(UserVo userVo) throws Exception;

	public UserVo userSelectOne(UserVo userVo) throws Exception;
}
