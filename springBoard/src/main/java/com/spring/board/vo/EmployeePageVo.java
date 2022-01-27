package com.spring.board.vo;

public class EmployeePageVo {
	private int pageNo = 0;
	private int pageStart;
	private int pageEnd;
	private int pageTotalCnt;


	private int startPageCalculator(int param) {
		
		
		return ((int)Math.ceil(param/(double)10)-1)*10+1;
		
	}
	
	public void calpage(int TotalCnt) {
		// this.pageNo=pageNo;
		
		setPageStart(startPageCalculator(getPageNo()));
		setPageEnd(getPageStart()+9);

		setPageTotalCnt((int)Math.ceil(TotalCnt/(double)10));
		
		if (getPageEnd()>getPageTotalCnt()) {
			setPageEnd(getPageTotalCnt());
		}
		
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageStart() {
		return pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getPageTotalCnt() {
		return pageTotalCnt;
	}

	public void setPageTotalCnt(int pageTotalCnt) {
		this.pageTotalCnt = pageTotalCnt;
	}

	
	
	
}
