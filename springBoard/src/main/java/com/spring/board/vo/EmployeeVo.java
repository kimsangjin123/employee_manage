package com.spring.board.vo;

import java.time.LocalDate;

public class EmployeeVo {
	private int employeeId;
	private String employeeName;
	private int ssNumber1;
	private int ssNumber2;
	private String department;
	private String employeeJob;
	private String startDate;
	private String regiDate;
	private String endDate;
	private String workDays;
	private String issuanceNumber;
	private String workType;
	private String sal;	
	private String employeeAddr1;
	private String employeeAddr2;
	private String employeeAddr3;
	private String employeeAddr4;
	private String employeeAddr5;
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

	
	public int getSsNumber1() {
		return ssNumber1;
	}
	public void setSsNumber1(int ssNumber1) {
		this.ssNumber1 = ssNumber1;
	}
	public int getSsNumber2() {
		return ssNumber2;
	}
	public void setSsNumber2(int ssNumber2) {
		this.ssNumber2 = ssNumber2;
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
	public EmployeeCodeVo getEmployeeCodeVo() {
		return employeeCodeVo;
	}
	public void setEmployeeCodeVo(EmployeeCodeVo employeeCodeVo) {
		this.employeeCodeVo = employeeCodeVo;
	}
	public String getEmployeeAddr1() {
		return employeeAddr1;
	}
	public void setEmployeeAddr1(String employeeAddr1) {
		this.employeeAddr1 = employeeAddr1;
	}
	public String getEmployeeAddr2() {
		return employeeAddr2;
	}
	public void setEmployeeAddr2(String employeeAddr2) {
		this.employeeAddr2 = employeeAddr2;
	}
	public String getEmployeeAddr3() {
		return employeeAddr3;
	}
	public void setEmployeeAddr3(String employeeAddr3) {
		this.employeeAddr3 = employeeAddr3;
	}
	public String getEmployeeAddr4() {
		return employeeAddr4;
	}
	public void setEmployeeAddr4(String employeeAddr4) {
		this.employeeAddr4 = employeeAddr4;
	}
	public String getEmployeeAddr5() {
		return employeeAddr5;
	}
	public void setEmployeeAddr5(String employeeAddr5) {
		this.employeeAddr5 = employeeAddr5;
	}
	

	public String ssNumberToString() {
		
		return getSsNumber1()+"-"+ getSsNumber2();
	}
	
	public String employeeAddrToString() {
		
		String addr= (getEmployeeAddr2()!=null) ? getEmployeeAddr2():getEmployeeAddr3();
		addr+=getEmployeeAddr4()!=null?(", "+getEmployeeAddr4()):"";
		
		return addr;
	}
	
	
}
