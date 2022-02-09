package com.spring.board.vo;

public class IssuedNumberVo {
	private int issuanceNumber;
	private String issuedDate;
	private int employeeId;
	private String creator;
	public int getIssuanceNumber() {
		return issuanceNumber;
	}
	public void setIssuanceNumber(Integer issuanceNumber) {
		this.issuanceNumber = issuanceNumber;
	}
	public String getIssuedDate() {
		return issuedDate;
	}
	public void setIssuedDate(String issuedDate) {
		this.issuedDate = issuedDate;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	
	
	
}
