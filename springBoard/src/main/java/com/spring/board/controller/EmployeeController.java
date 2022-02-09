package com.spring.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.EmployeeService;
import com.spring.board.vo.DocFileBoardVo;
import com.spring.board.vo.EmployeeCodeVo;
import com.spring.board.vo.EmployeePageVo;
import com.spring.board.vo.EmployeeVo;
import com.spring.board.vo.IssuedNumberVo;
import com.spring.common.CommonUtil;
import com.spring.common.DocumentToString;

@Controller
public class EmployeeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	
	@Autowired
	private EmployeeService eService;
	
	@RequestMapping(value="/employee/employeement.do",method=RequestMethod.GET
			// ,produces="application/vnd.openxmlformats-officedocument.wordprocessingml.document"
			)
	@ResponseBody
	public void employeement(HttpServletResponse response,HttpServletRequest request,EmployeeVo evo) throws Exception
	{
		String textPath=request.getSession().getServletContext().getRealPath("/");
		textPath+="/resources/TFF_재직증명서.docx";
		logger.info(textPath);
		evo=eService.employeeSelectOne(evo);
		IssuedNumberVo issuedNumberVo=new IssuedNumberVo();
		issuedNumberVo.setEmployeeId(evo.getEmployeeId());
		eService.employeeDocInsertIssuedNumber(issuedNumberVo);
			
		logger.info(issuedNumberVo.getIssuanceNumber()+"");
		File f=new File(textPath);
		
		// File directory = new File(WORDFILE);
		// File[] files = directory.listFiles();		

		if(!f.isDirectory())
		{
				try (FileInputStream fis = new FileInputStream(f.getAbsolutePath());
						XWPFDocument document = new XWPFDocument(fis);
					)
				{
					// System.out.println(document);
					for (XWPFParagraph p : document.getParagraphs()) {
					    List<XWPFRun> runs = p.getRuns();
					    if (runs != null) {
					        for (XWPFRun r : runs) {
					            String text = r.getText(0);
					            if (text != null && text.contains("issuanceNumber")) {
					                text = text.replace("issuanceNumber",String.valueOf(issuedNumberVo.getIssuanceNumber()));
					                r.setText(text, 0);
					            }
					        }
					    }
					}
					
					for (XWPFTable tbl : document.getTables()) {
						   for (XWPFTableRow row : tbl.getRows()) {
						      for (XWPFTableCell cell : row.getTableCells()) {
						         for (XWPFParagraph p : cell.getParagraphs()) {
						            for (XWPFRun r : p.getRuns()) {
						              String text = r.getText(0);
						              

						              if (text != null && text.contains("employeeName")) {
						            	  
						            	  text = text.replace("employeeName",evo.getEmployeeName());
						                r.setText(text,0);
						              }
						              if (text != null && text.contains("ssNumber")) {
						            	  
						            	  text = text.replace("ssNumber",evo.getSsNumber1()+"-"+evo.getSsNumber2());
						                r.setText(text,0);
						              }
						              if (text != null && text.contains("startDate")) {
						            	  
						            	  text = text.replace("startDate", evo.getStartDate());
						                r.setText(text,0);
						              }
						              if (text != null && text.contains("endDate")) {
						            	  
						            	  text = text.replace("endDate", evo.getEndDate());
						                r.setText(text,0);
						              }
						              if (text != null && text.contains("department")) {
						            	  
						            	  text = text.replace("department", evo.getDepartment());
						                r.setText(text,0);
						              }
						              if (text != null && text.contains("employeeJob")) {
						            	  
						            	  text = text.replace("employeeJob", evo.getEmployeeJob());
						                r.setText(text,0);
						              }

						              if (text != null && text.contains("todayDate")) {
						            	  
						            	  text = text.replace("todayDate",evo.getTodayDateToString());
						                r.setText(text,0);
						              }
						              if (text != null && text.contains("employeeAddress")) {
						            	  
						            	  text = text.replace("employeeAddress",evo.getEmployeeAddrToString());
						                r.setText(text,0);
						              }    
						               
						            }
						         }
						      }
						   }
					}

					
					// String outName="d:/test.docx";
					// String outName="D:/test.docx";
					// document.write(new FileOutputStream(outName));
					
					OutputStream outputStream = response.getOutputStream();
					String fileName=evo.getEmployeeName()+"재직증명서";
					String fileNameOrg= new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
					response.setHeader("Content-Disposition", "attachment; filename="+fileNameOrg+".docx;");
					
					document.write(outputStream);
					
					document.close();
					outputStream.close();
				} catch (FileNotFoundException e)
				{
					e.printStackTrace();
				} catch (IOException e1)
				{
					e1.printStackTrace();
				}
		}
			System.out.println("완료");
				
		
	
	}
	
	@RequestMapping(value="/employee/career.do",method=RequestMethod.GET
			// ,produces="application/vnd.openxmlformats-officedocument.wordprocessingml.document"
			)
	@ResponseBody
	public void career(HttpServletResponse response,HttpServletRequest request,EmployeeVo evo) throws Exception
	{
		evo=eService.employeeSelectOne(evo);
		
		IssuedNumberVo issuedNumberVo=new IssuedNumberVo();
		issuedNumberVo.setEmployeeId(evo.getEmployeeId());
		eService.employeeDocInsertIssuedNumber(issuedNumberVo);
		
		
		String textPath=request.getSession().getServletContext().getRealPath("/");
		textPath+="/resources/TFF_경력증명서.docx";
		
		logger.info(textPath);
		
		
		// workDays가 365보다 클 때 년으로 나타내기
		
		File f=new File(textPath);
		
		
		// File directory = new File(WORDFILE);
		// File[] files = directory.listFiles();		

		if(!f.isDirectory())
		{
				// try (FileInputStream fis = new FileInputStream(f.getAbsolutePath());
				try (FileInputStream fis = new FileInputStream(f.getAbsolutePath());
						XWPFDocument document = new XWPFDocument(fis);
					)
				{
					// System.out.println(document);
									
					for (XWPFTable tbl : document.getTables()) {
						   for (XWPFTableRow row : tbl.getRows()) {
						      for (XWPFTableCell cell : row.getTableCells()) {
						         for (XWPFParagraph p : cell.getParagraphs()) {
						            for (XWPFRun r : p.getRuns()) {
						              String text = r.getText(0);
						              
						              if (text != null && text.contains("issuanceNumber")) {
						            	  
						            	  text = text.replace("issuanceNumber", String.valueOf(issuedNumberVo.getIssuanceNumber()));
						                r.setText(text,0);
						              }
						              else if (text != null && text.contains("employeeName")) {
						            	  
						            	  text = text.replace("employeeName",evo.getEmployeeName());
						                r.setText(text,0);
						              }
						              else if (text != null && text.contains("ssNumber")) {
						            	  
						            	  text = text.replace("ssNumber",evo.getSsNumber1()+"-"+evo.getSsNumber2());
						                r.setText(text,0);
						              }
						              else if (text != null && text.contains("startDate")) {
						            	  
						            	  text = text.replace("startDate", evo.getStartDate());
						                r.setText(text,0);
						              }
						              else if (text != null && text.contains("endDate")) {
						            	  
						            	  text = text.replace("endDate", evo.getEndDate());
						                r.setText(text,0);
						              }
						              else if (text != null && text.contains("department")) {
						            	  
						            	  text = text.replace("department", evo.getDepartment());
						                r.setText(text,0);
						              }
						              else if (text != null && text.contains("employeeJob")) {
						            	  
						            	  text = text.replace("employeeJob", evo.getEmployeeJob());
						                r.setText(text,0);
						              }
						              else if (text != null && text.contains("workDays")) {
						            	  
						            	  text = text.replace("workDays", evo.getWorkDaysToString());
						                r.setText(text,0);
						              }
						              else if (text != null && text.contains("todayDate")) {
						            	  
						            	  text = text.replace("todayDate", evo.getTodayDateToString());
						                r.setText(text,0);
						              }
						              else if (text != null && text.contains("workType")) {
						            	  
						            	  text = text.replace("workType",evo.getWorkType());
						                r.setText(text,0);
						              }
						              else if (text != null && text.contains("employeeAddress")) {
						            	  
						            	  // 수정할 부분
						            	  text = text.replace("employeeAddress", evo.getEmployeeAddrToString());
						                r.setText(text,0);
						              }    
						               
						            }
						         }
						      }
						   }
					}

					
					// String outName="d:/test.docx";
					// String outName="D:/test.docx";
					// document.write(new FileOutputStream(outName));
					
					OutputStream outputStream = response.getOutputStream();
					String fileName=evo.getEmployeeName()+"경력증명서";
					String fileNameOrg= new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
					response.setHeader("Content-Disposition", "attachment; filename="+fileNameOrg+".docx;");
				
					document.write(outputStream);
					
					document.close();
					outputStream.close();
				} catch (FileNotFoundException e)
				{
					e.printStackTrace();
				} catch (IOException e1)
				{
					e1.printStackTrace();
				}
		}
			System.out.println("완료");
				
		
	
	}
	
	@RequestMapping(value="/employee/employeeWrite.do")
	public String write(Locale locale,Model model) throws Exception {
		
		List<EmployeeCodeVo> employeeCodeVoList=eService.employeeSelectCode();
		model.addAttribute("employeeCodeVoList", employeeCodeVoList);
		
		return "employee/employeeWrite";
	}
	@RequestMapping(value="/employee/writeAction.do",method=RequestMethod.POST)
	@ResponseBody
	public String writeAction(Locale locale,EmployeeVo evo) throws Exception {
		

		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt=0;
		
			
		resultCnt=eService.insert(evo);

		result.put("success", (resultCnt >0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	@RequestMapping(value="/employee/employeeList.do")
	public String list(Locale locale,Model model) throws Exception {
		
		List<EmployeeCodeVo> employeeCodeVoList=eService.employeeSelectCode();
		
		model.addAttribute("employeeCodeVoList", employeeCodeVoList);
		
		return "employee/employeeList";
	}
	@RequestMapping(value="/employee/listAjax.do",method=RequestMethod.POST,produces="application/text; charset=euc-kr")
	@ResponseBody
	public String listAjax(Locale locale,EmployeePageVo employeePageVo) throws Exception {
		

		Map<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		int page=1;
		if(employeePageVo.getPageNo()==0)
		{
			employeePageVo.setPageNo(page);
		}
		int totalCnt = eService.selectEmployeeCnt();
		employeePageVo.calpage(totalCnt);
		
		List<EmployeeVo> eList=new ArrayList<>();
		
		eList = eService.employeeList(employeePageVo);
		result.put("success", (eList.size() > 0)?"Y":"N");
		result.put("eList", eList);
		result.put("totalCnt", totalCnt);
		result.put("employeePageVo", employeePageVo);
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value="/employee/employeeView.do",method=RequestMethod.GET)
	public String employeeView(Locale locale,Model model,EmployeeVo evo) throws Exception {
		
		evo=eService.employeeSelectOne(evo);
		// String textPath="D:/employee/TFF_재직증명서.docx";
		// ClassPathResource resource = new ClassPathResource("/resources/TFF_재직증명서.docx");
	
		model.addAttribute("evo", evo);
		
		return "employee/employeeView";
	}
	
	
	@RequestMapping(value="/employee/employeeUpdate.do")
	public String employeeUpdate(Locale locale,EmployeeVo evo,Model model) throws Exception {
		
		evo= eService.employeeSelectOne(evo);
		List<EmployeeCodeVo> employeeCodeVoList=eService.employeeSelectCode();
		
		model.addAttribute("evo", evo);
		model.addAttribute("employeeCodeVoList", employeeCodeVoList);
		return "employee/employeeUpdate";
	}
	@RequestMapping(value="/employee/employeeUpdateAction.do",method=RequestMethod.POST)
	@ResponseBody
	public String updateAction(Locale locale,EmployeeVo evo) throws Exception {
	
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt=0;
		
		resultCnt=eService.employeeUpdate(evo);
		
		result.put("success", (resultCnt >0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value="/employee/employeeDelete.do",method=RequestMethod.POST)
	@ResponseBody
	public String employeeDelete(Locale locale,EmployeeVo evo) throws Exception {
		
		
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt=0;
		
		resultCnt=eService.employeeDelete(evo);
		
		result.put("success", (resultCnt >0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	@RequestMapping(value="/employee/employeeCode.do",method=RequestMethod.GET)
	public String employeeCode(Locale locale,EmployeeCodeVo employeeCodeVo,Model model) throws Exception {
		
		List<EmployeeCodeVo> codeList=eService.employeeSelectCode();
		
		model.addAttribute("codeList", codeList);
		return "/employee/employeeCode";
	}
	
	@RequestMapping(value="/employee/test.do")
	public String test() {
		
		
		return "/employee/test";
	}
	
	
	@RequestMapping(value="/employee/getDocFile.do")
	@ResponseBody
	public String getDocFile(Locale locale,EmployeeVo evo) throws Exception {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt=0;
		
		DocFileBoardVo docFileBoardVo=eService.getdocFileOne(evo);
		
		result.put("success", (resultCnt >0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
}
