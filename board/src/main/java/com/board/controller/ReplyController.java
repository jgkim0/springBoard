package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;
import com.board.domain.ReplyVO;
import com.board.service.BoardService;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	private BoardService service;

	@Inject
	private ReplyService replyService;

	// 댓글 조회
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public void getSelect(@RequestParam("rno") int rno, Model model) throws Exception {

		ReplyVO vo = replyService.select(rno);
		model.addAttribute("select", vo);

		}

	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWirte(ReplyVO vo) throws Exception {

		replyService.write(vo);

		return "redirect:/board/view?bno=" + vo.getBno();
	}

	// 댓글 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getModify(@RequestParam("rno") int rno, Model model) throws Exception {

		ReplyVO vo = replyService.select(rno);
		model.addAttribute("reply", vo);
	}

	// 댓글 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postmodify(ReplyVO vo) throws Exception {

		replyService.update(vo);

		return "redirect:/board/view?bno=" + vo.getBno();
		
	}

	
	// 댓글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(ReplyVO vo) throws Exception {

		replyService.delete(vo);
		return "redirect:/board/view?bno=" + vo.getBno();

	}
	
	
	/*
	// 댓글 삭제
	@RequestMapping(value = "/delete", method =RequestMethod.POST)
	public String postDelete(ReplyVO vo) throws Exception {

	
		replyService.delete(vo);
		return "redirect:/board/view?bno=" + vo.getBno();
		
	}

	 */

}