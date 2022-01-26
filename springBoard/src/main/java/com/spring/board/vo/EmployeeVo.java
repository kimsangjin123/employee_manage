package com.spring.board.vo;

import java.time.LocalDate;

public class EmployeeVo {
	private int employeeId;
	private String employeeName;
	private String ssNumber;
	private String department;
	private String employeeJob;
	private String startDate;
	private String regiDate;
	private String endDate;
	private String workDays;
	private String issuanceNumber;
	private String workType;
	private String sal;	
	private String employeeAddress;
	
	private EmployeeCodeVo employeeCodeVo;

	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmployeeJob() {
		return employeeJob;
	}
	public void setEmployeeJob(String employeeJob) {
		this.employeeJob = employeeJob;
	}
	public String getSsNumber() {
		return ssNumber;
	}
	public void setSsNumber(String ssNumber) {
		this.ssNumber = ssNumber;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}


	public String getWorkDays() {

		return workDays;
	}
	public void setWorkDays(String wordkDays) {
		this.workDays = wordkDays;
	}
	public String getIssuanceNumber() {
		return issuanceNumber;
	}
	public void setIssuanceNumber(String issuanceNumber) {
		this.issuanceNumber = issuanceNumber;
	}

	public String getSal() {
		return sal;
	}
	public void setSal(String sal) {
		this.sal = sal;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getRegiDate() {

		
		return regiDate;
	}
	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeAddress() {
		return employeeAddress;
	}
	public void setEmployeeAddress(String employeeAddress) {
		this.employeeAddress = employeeAddress;
	}
	public EmployeeCodeVo getEmployeeCodeVo() {
		return employeeCodeVo;
	}
	public void setEmployeeCodeVo(EmployeeCodeVo employeeCodeVo) {
		this.employeeCodeVo = employeeCodeVo;
	}
	
	
	
	
}
