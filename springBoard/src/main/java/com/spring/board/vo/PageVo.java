package com.spring.board.vo;

import java.util.List;

public class PageVo {
	
	private int pageNo = 0;
	private int pageStart;
	private int pageEnd;
	
	
	private String[] boardTypeList;
	
	public int calPage(int pageNo) {
		
		int result=((int)Math.ceil(pageNo/10)-1)*10+1;
		
		return result;
		
	
	}
	
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
		
	
	public String[] getBoardTypeList() {
		return boardTypeList;
	}

	public void setBoardTypeList(String[] boardTypeList) {
		this.boardTypeList = boardTypeList;
	}

	
	
	
	
}
