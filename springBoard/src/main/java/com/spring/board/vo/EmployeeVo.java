package com.spring.board.vo;

public class EmployeeVo {
	private int employeeId;
	private String employeeName;
	private int ssNumber1;
	private int ssNumber2;
	private String department;
	private String employeeJob;
	private String startDate;
	private String regiDate;
	private String workType;
	private String sal;	
	private String employeeAddr1;
	private String employeeAddr2;
	private String employeeAddr3;
	private String employeeAddr4;
	private String employeeAddr5;
	
	/* 테이블에 없는 변수들, 문서를 위해 만들었다*/
	private String endDate;
	private int workDays;
	private int workYears;
	private int workMonths;
	private int totalWorkDays;
	
	private String workDaysToString;
	private String employeeAddrToString;
	private String todayDateToString;
	
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
	
	
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getWorkDays() {
		return workDays;
	}
	public void setWorkDays(int workDays) {
		this.workDays = workDays;
	}
	public int getWorkYears() {
		return workYears;
	}
	public void setWorkYears(int workYears) {
		this.workYears = workYears;
	}
	public int getWorkMonths() {
		return workMonths;
	}
	public void setWorkMonths(int workMonths) {
		this.workMonths = workMonths;
	}
	public int getTotalWorkDays() {
		return totalWorkDays;
	}
	public void setTotalWorkDays(int totalWorkDays) {
		this.totalWorkDays = totalWorkDays;
	}
	public String getWorkDaysToString() {
		return workDaysToString;
	}
	public void setWorkDaysToString(String workDaysToString) {
		this.workDaysToString = workDaysToString;
	}
	public String getEmployeeAddrToString() {
		return employeeAddrToString;
	}
	public void setEmployeeAddrToString(String employeeAddrToString) {
		this.employeeAddrToString = employeeAddrToString;
	}
	public String getTodayDateToString() {
		return todayDateToString;
	}
	public void setTodayDateToString(String todayDateToString) {
		this.todayDateToString = todayDateToString;
	}
	
	
	
}
