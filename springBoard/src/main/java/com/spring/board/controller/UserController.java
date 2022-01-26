package com.spring.board.controller;

import java.security.Provider.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.service.BoardService;
import com.spring.board.service.UserService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCode;
import com.spring.board.vo.UserVo;
import com.spring.common.CommonUtil;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/login/join.do",method = RequestMethod.GET)
	public String join(Locale locale, Model model) throws Exception {
		
		String codeType="phone";
		List<ComCode> phoneList=boardService.boardSelectComCode(codeType);
		
		model.addAttribute("phoneList", phoneList);
		
		
		return "/login/join";
	}
	
	@RequestMapping(value="/login/login.do",method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		
		
		return "/login/login";
	}
	
	
	@RequestMapping(value = "/login/userInsertAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String userInsertAction(Locale locale,UserVo userVo) throws Exception{
		
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
			
		int resultCnt=userService.userInsert(userVo);
			
		
		result.put("success", (resultCnt>0)?"Y":"N");
		
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value="/login/userIdChk.do",method=RequestMethod.POST)
	@ResponseBody
	public String userIdChk(Locale locale,UserVo userVo) throws Exception {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
			
		int resultCnt=userService.userIdChk(userVo);
			
		
		result.put("success", (resultCnt==0)?"Y":"N");
		
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
		
		
	}
	
	@RequestMapping(value="/login/loginAction.do",method = RequestMethod.POST)
	@ResponseBody
	public String loginAction(Locale locale,UserVo userVo,HttpSession session) throws Exception {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
			
		UserVo userVo1=userService.userSelectOne(userVo);
		
		int resultCnt=0;
		if(userVo.getUserPw().equals(userVo1.getUserPw())) {
			resultCnt=1;
			session.setAttribute("userId",userVo1.getUserId().toString());
		}
		
		result.put("success", (resultCnt==1)?"Y":"N");
		
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
		
	}
	
	@RequestMapping(value="/login/logout.do",method=RequestMethod.GET)
	public String logout(Locale locale,HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/board/boardList.do";
	
		
	}
	
	
}
