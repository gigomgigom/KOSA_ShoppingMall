package com.mycompany.javajavajo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Qna;
import com.mycompany.javajavajo.security.Tm1UserDetails;
import com.mycompany.javajavajo.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	// 글쓰기 페이지로 이동
	@GetMapping("/writeBoard")
	public String writeBoard() {
		return "board/writeBoard";
	}
	
	@RequestMapping("/list")
	public String listBoard(@RequestParam(defaultValue="") String keyword, Authentication authentication,Model model) {
		List<Qna> qna = boardService.getQnaList(keyword);
		model.addAttribute("qnaList", qna);
		return "board/list";
		
	}
		
	//글쓰기 페이지에서 dto로 게시물 작성에 필요한 정보들을 얻어옴
	// Controller에서 Service로 요청
	@PostMapping("/writeBoard")
	public String writeBoard(Qna qna) {
		boardService.writeBoard(qna);
		return "redirect:/board/list";
		//클라이언트 요청 -> 컨트롤러 -> 클라이언트 -> 경로로 이동시킴
	}
	
	@GetMapping("/detailBoard")
	public String detailBoard(int qnano, Model model) {
		log.info("run");
		Qna qna = boardService.getQna(qnano); // dto를 통해서 한 게시물의 정보를 가져옴
		model.addAttribute("qna", qna);
		log.info(qna.getQnatitle());
		return "board/detail";
	}
	

}






