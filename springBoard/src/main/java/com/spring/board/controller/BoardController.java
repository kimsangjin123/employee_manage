package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCode;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {
	
	@Autowired 
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model,PageVo pageVo) throws Exception{
		

		String menu="menu";
		List<ComCode> comCodeList= boardService.boardSelectComCode(menu);
		model.addAttribute("comCodeList",comCodeList);
		return "board/boardList";
	}
	@RequestMapping(value = "/board/boardSelectAjax.do", method = RequestMethod.POST,produces = "application/text; charset=euc-kr")

	@ResponseBody
	public String boardSelectAjax(Locale locale,PageVo pageVo) throws Exception{
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();
		
		
		result.put("success", (boardList.size() > 0)?"Y":"N");
		result.put("boardList", boardList);
		result.put("totalCnt", totalCnt);
		result.put("pageVo", pageVo);
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception{
		
		String menu="menu";
		List<ComCode> comCode= boardService.boardSelectComCode(menu);
		
		model.addAttribute("comCode", comCode);
		
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale,BoardVo boardVo) throws Exception{
		
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt=0;
		
		
		
		// service단으로 옮겨서 작성
		for(int i=0;i<boardVo.getBoardVoList().size();i++) {
			// 비어있으면 통과하게끔 작성하면 script 단에서 전부 each문을 작성하지 않아도 된다.
			
			int Cnt=boardService.boardInsert(boardVo.getBoardVoList().get(i));
			if (Cnt>0) {
				
				resultCnt+=1;
			}
			
		}
		
		
		result.put("success", "resultCnt :"+resultCnt);
		
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(Locale locale, Model model
		,@PathVariable("boardType")String boardType
		,@PathVariable("boardNum")int boardNum) throws Exception{
	
	BoardVo boardVo = new BoardVo();
	
	boardVo = boardService.selectBoard(boardType,boardNum);
	
	model.addAttribute("boardType", boardType);
	model.addAttribute("boardNum", boardNum);
	model.addAttribute("board", boardVo);
		
		return "board/boardUpdate";
	}
	
	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(Locale locale,BoardVo boardVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardUpdate(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value="/board/boardDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardDelete(Locale locale,BoardVo boardVo) throws Exception {
		HashMap<String,String> result=new HashMap<String,String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt=boardService.boardDelete(boardVo);
		
		result.put("success", (resultCnt >0)?"Y":"N");
		String callbackMsg= commonUtil.getJsonCallBackString(" ", result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/board/testWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String testWriteAction(Locale locale,BoardVo boardVo) throws Exception{
		
		
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt=0;
		
		String boardType=boardVo.getBoardVoList().get(0).getBoardType();
		String boardTitle=boardVo.getBoardVoList().get(0).getBoardTitle();
		String boardComment=boardVo.getBoardVoList().get(0).getBoardComment();
		
		
		result.put("success", boardType+boardTitle+boardComment);
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	@RequestMapping(value = "/board/testWrite.do", method = RequestMethod.GET)
	public String testWrite(Locale locale, Model model) throws Exception{
		
		String codeType="menu";
		List<ComCode> comCode= boardService.boardSelectComCode(codeType);
		
		model.addAttribute("comCode", comCode);
		
		
		return "board/testWrite";
	}
	
	

	
	
}
