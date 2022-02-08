package com.spring.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.board.HomeController;
import com.spring.board.vo.EmployeeVo;

public class DocumentToString {
	
	private EmployeeVo evo;
	
	public DocumentToString(EmployeeVo evo) {
		this.evo=evo;
		
	}
	
	
	public static String EmployeeAddrToString(String employeeAddr2,String employeeAddr3,String employeeAddr4) {
		
		String addr= (employeeAddr2!=null) ? employeeAddr2:employeeAddr3;
		addr+=employeeAddr4!=null?(", "+employeeAddr4):"";
		
		
		return addr;
	}
	public static String EmployeeWorkDaysToString(Integer workYears,Integer workMonths) {
		
		String yearMonthsString="";
		if (workYears!=0) {
			
			yearMonthsString=workYears+"년";
		}else if(workMonths!=0){
			yearMonthsString+=workMonths+"개월";
		}
		
		return yearMonthsString;
	}
	public String TodayDateToString(String todayDate) {
		
		String dateList[]=todayDate.split("-");
		
		return dateList[0]+"년"+dateList[1]+"월"+dateList[2]+"일";
	}
}
