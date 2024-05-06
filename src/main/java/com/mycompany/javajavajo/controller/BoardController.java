package com.mycompany.javajavajo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.javajavajo.dto.Qna;
import com.mycompany.javajavajo.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/writeBoard")
	public String writeBoard() {
		return "board/writeBoard";
	}
	
	@RequestMapping("/list")
	public String listBoard(@RequestParam(defaultValue="") String keyword) {
		log.info(keyword);
		return "board/list";
	}
	
	@PostMapping("/writeBoard")
	public String writeBoard(Qna qna) {
		boardService.writeBoard(qna);
		return "redirect:/board/list";
		
	}
	
	@GetMapping("/detailBoard")
	public String detailBoard(int qnano, Model model) {
		log.info("run");
		Qna qna = boardService.getQna(qnano);
		model.addAttribute("qna", qna);
		log.info(qna.getQnatitle());
		return "board/detail";
	}
	
	
	
}
